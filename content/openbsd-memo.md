+++
title = "OpenBSD Memo"
slug = "openbsd-memo"
date = 2013-05-31T16:15:00Z
lastmod = 2013-08-06T16:01:07Z
tags = ["bsd"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

### 🐡 Open ton BSD

**Pour ce nouveau post, BSD est a l'honneur et plus précisément, l'OpenBSD.**

![Image de presentation](/images/puffy53.gif "Inspiration du film blade runner pour cette V5.3")

Avant toute chose, si vous n'avez jamais touche à OpenBSD, je vous conseil de passer par leur [FAQ](http://www.openbsd.org/faq/fr/index.html), qui est tout simplement génial ! Contrairement à la croyance cette distribution n'est pas vraiment déroutante, et ceux grâce à la trés bonne documentation qui offre toujours réponse à tout. Le système est là pour vous guider vers un pas de plus, notamment par ses nombreux "e-mails". Vous me direz que ce mémo n'est donc pas utile ... Perso je n'aime pas chercher 3h dans une doc, un point particulier que j'ai déjà abordé 100fois.

_Je tiens a préciser que je ne suis pas un expert de cette OS, OpenBSD est pour moi "tout nouveau". Je l'ai abordé il y a peu de temps pour les futur besoins de mes serveurs._

### Let's Get Started

#### A) Lors de l'installation.
1. Activer [NTPD](http://www.openbsdsupport.org/openNTPD.html), ce qui permet d'avoir une synchronisation parfaite avec notre fuseau horaire.
2. Créer tout de suite l'user qui pourras utiliser "su", cela permet de désactiver directement la connexion root depuis [ssh](http://www.openbsd.org/cgi-bin/man.cgi?query=ssh) et d'étre en user l'ors du 1er démarrage.

#### B) Après l'installation
1. Augmenter la résolution (je suis pas fan du 25*80). Le plus simple c'est par là **[-->[ici]](http://www.openbsd.org/faq/fr/faq7.html#80x50)**
2. Paramétrer PKG_PATH, d’après la lite des [miroir Http/FTP](http://www.openbsd.org/fr/ftp.html). Personnellement j'utilise " [http://ftp2.fr.openbsd.org/pub/OpenBSD/](http://ftp2.fr.openbsd.org/pub/OpenBSD/)" en amd64. Ce qui me donne " _$ export PKG_PATH=http://ftp2.fr.openbsd.org/pub/OpenBSD//5.3/packages/`machine -a`/_"
3. Installer votre éditeur favori. Pour moi le petit nano. "# pkg_add -iv nano"
4.  Configurer [SUDO](http://www.openbsd.org/cgi-bin/man.cgi?query=sudo&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=i386&format=html) (préférez utilisez "sudo" a "su" et "sudo -s" a "sudo su"). "# nano /etc/sudoers" et dé-commentez la ligne '# `%wheel ALL=(ALL) -- > %wheel ALL=(ALL)`' pour donner l'autorisation de sudo aux utilisateur du groupe wheel (par défaut si vous l'avez crée a l'installation). Ajoutez y `"NOPASSWD: ALL" pour eviter la fastidieuse demande perpétuel.`
5. Installer un paquetage prés compilé "sudo pkg_add -iv ---", i permet de voir les différentes versions et de toujours choisir en cas d'options disponibles, v permet d'avoir le maximum d'informations.
6. Un navigateur c'est toujours utile "sudo pkg_add elinks". Je trouve que Elinks à l'utilisation la plus naturel et intuitive, bien qu'il ne soit pas le plus performant.
7. Si vous utilisez SSH n'oubliez pas de le configurer, mais [on a déjà vu ça](http://blog.the-red-wolf.com/2012/11/apache2-et-ssh-mini-memo.html).

#### C) Utiliser les "ports"
Pour cette partie je vous invite a aller voir sur la [-->[FAQ]](http://www.openbsd.org/faq/fr/faq15.html#Ports).

L'utilisation des ports c'est vraiment pas mon dada. Ok ça peut être vraiment très utile. Mais étant rarement à jours, je préfère compiler moi même et avec mes options quitte à me faire les dépendances (étant un ancien de Slackware ça me fait pas peur ! :p ).

Je trouve, que ce système de "ports" d'OpenBSD est bien moins performant que AUR avec yaourt pour ArchLinux.

#### D) Divers commandes
1. C'est con mais la 1ere fois j'ai cherché comment éteindre le système ... "$ [halt](http://www.openbsd.org/cgi-bin/man.cgi?query=halt&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=i386&format=html)"
2. Toute les [commandes UNIX](http://fr.wikipedia.org/wiki/Commandes_Unix) sont utilisable (aucun dépaysement ...)
3. Pour télécharger sous [-->[UNIX]](http://www.spam-cheetah.com/articles/cmdlinedownload.html). Étant habitué a wget, j'ai du l'installer, car non disponible de base.
4. Lister les perif PCI "pciconf"
5. Lister les modules noyau qui sont chargé "kldstat"
6. Charger / Décharger les modules du noyau "kldload/kldunload"
7. Voir les appels système "strace"

#### E) Attention
1. Dans l'installation d'origine, bash n'est pas disponible. Si vous compter l'utiliser en root ne lui assignez pas directement, mais assigner le à un compte toor ! [-->[Sur le sujet]](http://books.google.fr/books?id=-SZ4LyJcUFAC&pg=PA111&lpg=PA111&dq=%22root%22+%22toor%22+openbsd&source=bl&ots=9O5PDeUp8m&sig=b7vezAq3ED56ig5RgOAdekQ4x1w&hl=fr&sa=X&ei=xIqoUdq4H6LC7AaD7YHwBQ&ved=0CFYQ6AEwAw#v=onepage&q=%22root%22%20%22toor%22%20openbsd&f=false)
2. BSD utilise [INIT](http://www.openbsd.org/cgi-bin/man.cgi?query=init&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=amd64&format=html) les contrôles de démarrage sont donc lié a l'utilitaire ["RC"](http://www.openbsd.org/cgi-bin/man.cgi?query=rc&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=amd64&format=html)
3. OpenBSD nome l’interface réseau par le nom de son pilote et non pas ethX. [Ex --->[ici]](http://www.openbsd.org/cgi-bin/man.cgi?query=em&apropos=0&sektion=0&manpath=OpenBSD+Current&arch=amd64&format=html)
4. Les commandes spécifiques a Linux ne sont bien-sur  pas disponible sous BSD.

**Si vous relevez une erreur ou si vous aviez quelque chose a ajouter, merci de laisser un commentaire afin que je puisse me corriger.**

**éa, les amis.**
