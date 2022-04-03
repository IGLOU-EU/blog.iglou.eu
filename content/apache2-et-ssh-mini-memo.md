+++
title = "Apache2 et ssh, mini memo"
slug = ""
date = 2012-11-14T05:56:00Z
updated = 2013-08-06T16:07:32Z
tags = ["Serveur", "memo"]
blogimport = true
+++

## 🙈 Deb 🙉 me 🙊

Il y a de cela 8mois, j'avais entamé la configuration de mon nouveau serveur dédié sous debian. Il y a peu, j'eus besoin de modifications très simples, mais pas moyen de me rappeler comment les effectuer. Profitons en pour realiser un memo qui me servira aussi dans le futur.

![Image de presentation](/images/www.lafermeduweb.net-images-billets-2009-01-debian_topBillet.png "")

### Compiler Apache 
A la compilation d'apache j'ajoute quelques options
```sh
./configure -enable-modules=all --with-included-apr --with-mpm=event --enable-rewrite --enable-headers --enable-deflate --enable-fcgid 
make
sudo make install
```

### apache2.conf
```conf
AddHandler fcgid-script .php
FCGIWrapper /usr/lib/cgi-bin/php5 .php
Options ExecCGI
```

### Désactiver l’auto-index 
Le désactiver de façons général dans apache2
```
sudo a2dismod autoindex
```

"a2dismod" est la commande pour désactiver un mod, pour le réactiver il faut utiliser "a2enmod". Il faut ensuite restart apache
-  /etc/init.d/apache2 restart

Le désactiver dans une racine virtual host.
- nano .htaccess
- _ajouter_ Options -Indexes

### Sécuriser ssh 
 **Changer le port (par défaut, port 22)**

On vérifie si le port que l'on veux pour ssh est utilisé, ici le port 4012.

- # netstat -tulnp | grep 4012

Puis modifier le port.

- # nano /etc/ssh/sshd_config

**Contrôle Des login** s

On ouvre le fichier de configuration où l'on ajouteras les options.

- # nano /etc/ssh/sshd_config

Pour limiter les tentatives de connection au user autorisé.

- AllowUsers toto tata

Desactiver root et n'utiliser que "su" est très important.

- PermitRootLogin no

Par défaut "PermitEmptyPasswords no" et le protocole ssh2 devrait êtres défini correctement. Reload de ssh.

- # /etc/init.d/ssh restart

### Définir la page d'index
Il peut arriver que l'on ne veuille pas utiliser la traditionnelle page index.* comme accueil par défaut. Dans ce cas je vous conseil de ne pas modifier ceci directement dans la conf de apache, mais dans un .htaccess a la racine du virtual host ciblé.

- $ nano .htaccess
- DirectoryIndex monindexperso.ty

### Gérer les virtual host
Pour créer un host, il suffit d'un simple fichier de conf dans sites-available. Il existe déjà un exemple qu'il suffit de copier.

- # cd /etc/apache2/sites-available
- # cp default monsitedeblabla

Il n'y a plus qu'a éditer ce fichier pour notre host, l'activer et redémarrer apache.

- # nano monsitedeblabla
- # a2ensite monsitedeblabla
- # apache2ctl restart

Le fichier de conf pas défaut est "compliqué" pour rien, il est possible d'avoir son host en 3lignes (bien qu'il manque des options). Pour désactiver un site utilisez a2dissite, vous pouvez le supprimer en suite de sites-available ou le garder pour plus tard. Si vous n'accéder pas au bon répertoire c'est la ligne "RedirectMatch ^/$ /apache2-default/" qui est présente dans la conf du host. A commenter ou supprimer ...

Mettre en place un firewall, ou un script d'intrusion n'est pas une mauvaise idée.

**éa, les amis.**
