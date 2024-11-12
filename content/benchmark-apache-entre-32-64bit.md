+++
title = "Benchmark apache entre 32-64bit"
slug = "benchmark-apache-entre-32-64bit"
date = 2014-01-16T04:25:00Z
lastmod = 2014-01-16T04:27:04Z
tags = ["serveur"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

**Bonjours à tous,** dernièrement je me suis demandé quel seraient les différences entre un OS 32-64bit pour un serveur (notamment apache et ce après une discutions avec mon oncle), je m'attendais à de petites différences en faveur du 64bit. C'est la 1ere fois que je réalise un benchmark espérons que je ne fasse pas trop d'erreur...

![Image de presentation](/images/www.pointgphone.com-wordpress-wp-content-uploads-2013-08-benchmark-010801.jpg "")

A la base je pensais faire le Bench ausi sur OpenBSD, mais celui-ci n’ayant pas un apache officiel ... Il aurait était possible de recompiler apache avec son AB, mais peut être une prochaine fois.

Installation par défaut des 2OS, aucunes amélioration , optimisation …

**Materiel Hote :**
- Linux version 3.12.7-1-ARCH x86_64 GNU/Linux
- Mémoire Vive 8192Mo
- Processeurs 4
- Ressources 4.5Ghz
- Vidéo 2048Mo
- Sata 3Go/s 320Go 7200t/mn (Disque utilisé pour les VM) + Sata 6Go/s SSD (systéme)

**Materiel des VM :**
- VirtualBox 4.3.6_OSE r91406
- Mémoire Vive 1024Mo
- Processeurs 2
- Ressources 100%
- Vidéo 12Mo
- Controleur Sata vdi de 8Go
- Systéme de fichiers

**Infos OS :**
- Debian32 / Linux version 3.2.0-4-486 Debian 3.2.51-1 i686 GNU/Linux / Load average: 0.02, 0.02, 0.01
- Debian64 / Linux version 3.2.0-4-amd64 Debian 3.2.51-1 x86_64 GNU/Linux / Load average: 0.03, 0.02, 0.01

**Logiciels :**
- Debian32 / Apache-2.2.22 (Debian) / PHP 5.4.4-14+deb7u7 / ApacheBench 2.3-r655654
- Debian64 / Apache-2.2.22 (Debian) / PHP 5.4.4-14+deb7u7 / ApacheBench 2.3-r655654

**Teste par AB :** _10k-50k Requêtes envoyées - 30 Requêtes parallèle - H active Gzip_

ab -n 10000 -c 30 *localhost*

ab -n 50000 -c 30 *localhost*

ab -n 50000 -c 30 -H "Accept-Encoding: gzip" *localhost*

**Code HTML utilisé :**

```html
<html>
    <head>
        <title>Test page</title>
    </head>
    <body>
        <h1>Hello, world !</h1>
        <p>Test de page web ... Pour benchmark A-HTML.</p>
    </body>
</html>
```

**Code PHP utilisé :** _Il y a mieux pour la charge, mais ça suffit pour des chiffres qui parlent._

```php
<?php
phpinfo();
```

 **Résultat du Benchmark :**

![Image de presentation](/images/4.bp.blogspot.com-QFFD5810p10-UtdMLnhrNLI-AAAAAAAAAjg-kjrNEaJzvuI-s1600-cpu_req.png "_(Le plus petit est le meilleur)_")

![Image de presentation](/images/2.bp.blogspot.com-pJYmZcBIt7Q-UtdMLoDDi8I-AAAAAAAAAjY-rThEY4-JYMc-s1600-req_sec.png "_(Le plus grand est le meilleur)_")

![Image de presentation](/images/req_conc.png "_(Le plus petit est le meilleur)_")
Le resultat etait previsible, mais j'aurais du faire aussi un instantane de la memoire, 64bit prenant forcement plus de place.   
32 ou 64 ne change presque rien pour des pages statiques (quoique les requêtes pas secondes...), mais le gain en 64bit pour php est bien visible ! Avec de tels résultats, j'ai tout a coup envie de faire d'autres Bench pour comparer ces deux là !

Il est au passage vraiment étrange de ne trouver que très peu de Bench entre ces deux là. La question des Architectures(32-64) est pourtant intéressantes bien que l'apparition de la 64bit date de bien aven 2004.

**éa, les amis.**
