+++
title = "[OpenBSD] Juste de l'OpenHttpd, du LuaPatterns et du Let's encrypt"
slug = "openbsd-juste-de-lopenhttpd-du"
date = 2018-08-02T20:18:00Z
lastmod = 2018-08-02T20:18:04Z
tags = ["bsd", "serveur", "memo"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## Le dernier espoir : OpenHTTPD

![Image de presentation](/images/2.bp.blogspot.com-3v13E4KCfGI-W2IlD-UYSNI-AAAAAAAAAyw-tZu9O6AeJIIPSvYI00qW1i5LLzErnnBVACPcBGAYYCw-s1600-openhttpd-logo.png "")

Salut à toi lecteur. 

Moi, c'est Luc, Jean-Luc, Jean-Luc qui porte un sky, lecteur !    
Si tu es là, c'est qu'tu connais un peu le bousin, la force est déjà avec toi et elle t'a mené à moi.

J'n'vais pas t'parler comme à un débutant, et si tu ne comprends pas, tu dois juste écouter 3 personnes, Mme.man toujours là pour te guider, Mr.prompt qui fait souvent des sorties et Mme.log une véritable pipelette, cette dernière, n'hésite pas à la "tail" afin de couper court à la discussion (en plus elle radote).

Comme tu le sais déjà, depuis OpenBSD 5.6, on n'utilise plus les technos de l'empire comme apache ou nginx, mais une production de l'Alliance, OpenHTTPD.

Bon allé, fini avec le blabla, prends ton LightKeyboard et petit récap

### Pour activer httpd par def
```
rcctl enable httpd
```

### Le redémarrer
```
rcctl restart httpd
```

### Pour debug le fichier de conf
```
httpd -n
```

Puis merde pour les patterns lua vas lire le manuel, tout ce que t'as à savoir c'est qu'il n'y a pas de négation ni de "ou" logique, les paternes lua à gérer en gros ça prends 500 lignes de code, la regex +4.000 lignes… alors bon !
[https://www.lua.org/pil/20.2.html](https://www.lua.org/pil/20.2.html)

Et pour let's encrypt, moi j'utilise dehydrated, ne me demande pas pourquoi c'est comme ça !
[https://github.com/lukas2511/dehydrated](https://github.com/lukas2511/dehydrated)

![Image de presentation](/images/itsatrap.jpg "Ne tombe pas dans les pièges !")

Si on veut QUE du HTTPS, on peut simplement faire un "default" sur le port 80 qui redirige sur le 443 via un simple : `block return 301 "https://$HTTP_HOST$REQUEST_URI"`, la base, on connait tous.

Mais si on désire certifier via let's encrypt par exemple, ba ça n'marche pas (ça a peut être changé dernièrement ...), il faut une variante HTTP pour chaque domaine.
Bon c'est chiant, car moi je n'veux pas de variante HTTP et je convoite que tous les challenges se passent au même endroit.
L'idée est d'utiliser un défaut donc `location` serait "si la demande n'est pas.well-known" alors on redirige.

Pour utiliser des patterns, on a `location match` (t'as pas compris ? Retourne lire la doc httpd.conf), sauf qu'il n'utilise pas regex, mais lua patterns et comme je t'ai l'ai déjà dit (putain t'écoute vraiment rien ...), il ne gère pas la négation !

### En gros voici la magouille.
Si la requête débute par de l'alphanumérique ou contient uniquement `/` alors on redirige.

Il n'y a pas de problème avec les ancres, `toto.com/#a` est redirigé, car il n'est pas envoyé en GET, la requête est : `"GET / HTTP/1.1" 200`

En revanche, les requêtes en `/?toto=tata`, ne devrait pas être redirigé sans ajouter une ligne avec un nouveau pattern ... Pourtant, `"GET /?toto=tata HTTP/1.1" 301`, on est correctement redirigé… J'ai dû louper un truc, n'hésite pas à m'expliquer.

```conf
server "default" {
        listen on * port 80

        root "/htdocs"
        directory no index

        location match "^/%w" {
                block return 301 "https://$HTTP_HOST$REQUEST_URI"
        }

        location match "^/$" {
                block return 301 "https://$HTTP_HOST$REQUEST_URI"
        }
}
```

Si jamais t'a mieux gamin, dis le moi. Tous les challenges sont dans `/htdocs/.well-known/acme-challenge/*` accessible en port 80, le reste exclusivement en 443 ou redirigé comme il faut. On pourrait effectivement améliorer ça avec un root directement dans un doc acme, et ajouter une `location` ... blablabla root / ... blablabla. Mais j'ai d'autre truc à faire, comme la vidange de mon speeder

---

### Tien ton script
J'ai aussi un petit script à partager avec toi, il me permet d'ajouter un domaine rapidement en CLI [addWebSite.sh](https://git.iglou.eu/Production/addWebSite/blob/master/addWebSite.sh).

Bon le script ne fait même pas 100 lignes, il est grossier, simple, les echo font office de commentaires, ça ne devrait pas être compliqué à comprendre pour ceux qui n'touche jamais a un shell.

---

### Ba quoi PHP ?
Au passage, PHP, pour ceux qui l'utilisent... Il faut installer php et php-cgi.
Puis comme httpd est en chroot, il faut un sock php dans son run.
Pour ça on utilise le service `php fpm`, ex avec php7: `rcctl start php70_fpm`.   

Les libs disponibles sont dans `/etc/php-7.0.sample/`, et sont à link avec un `ln -s` dans `/etc/php-7.0/`
La conf de PHP `fpm` Quelle que soit sa version est dans `/etc/php-fpm.conf`.   

Ne reste plus qu'à utiliser un truc du genre :
```conf
location "*.php" {
    fastcgi socket "/run/php-fpm.sock"
}
```

---

_Comme toujours, si je raconte des conneries, dites le moi, ça évitera au clampin qui passe dans le coin d'appliquer celle-ci._

**éa, les amis.**