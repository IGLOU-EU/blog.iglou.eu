+++
title = "KDE, un démarrage digne de windows."
slug = "kde-un-demarrage-digne-de-windows"
date = 2012-11-09T02:15:00Z
lastmod = 2013-08-06T16:08:06Z
tags = ["linux", "software"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Depuis quelques jours, j'ai réinstallé mon Archnunux. Le SSD en place, je boot en 0,4s depuis le chargement de GRUB2 à KDM, mais la connexion a KDE prend 10-12s.

A son passage en version 4, KDE c'est tout à coup pris de lenteur et bien que ce soit optimisé sur les dernières versions, le problème persiste.

Jugeant inacceptable que KDE soit presque aussi long qu'un boot sur Win, je suis parti en quête d'optimisation.

En cherchant dans les options KDE (ce que je n'avais jamais vraiment fait), "Démarrage et arrêt" m'a sauté aux yeux comme révélateur et j'y est effectué la désactivation de tout ce que je n'utilisais pas.

Au login : démarrer une nouvelle session.

Services au démarrage : "Gestion de l'énergie (j'ai un fichier de conf maison)", "Notificateur url...", "Notification d'espace libre", "Service Nepomuk".

Mais je n'ai que très peu gagné ... c'est insignifiant.

Questionnant donc google, une piste m'est révélé "Nepomuk" serait là depuis la V.4 de KDE et plusieurs forum indique cette cause. Wikipedia me souffle que c'est un énorme projet de 17 millions d' euros auquel je ne comprends rien.

Je n'ai pas envie d'en savoir plus et ne pense pas l'utiliser un jour. Ni une, ni deux. Je le désactive. Magie, ma session KDE démarre en 2s.

![Image de presentation](/images/100px-Nepomuk.svg.png "")
