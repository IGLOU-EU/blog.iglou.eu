+++
title = "Logiciel et Jeux Windows sous Linux avec wine"
slug = "logiciel-et-jeux-windows-sous-linux"
date = 2013-04-14T16:56:00Z
updated = 2013-08-06T15:59:35Z
tags = ["jeux", "software"]
blogimport = true
+++

### Comment utiliser Wine

![Image de presentation](/images/lan.nost.biz-wp-content-uploads-2012-10-wine-logo.jpg "")

Wine est un projet qui a débuté en 1993 et a donc 20ans ! Sa première version stable est sortie en 2008, il a fallu prés de 15ans pour la développer. Wine n'est pas un émulateur Windows, il n'a pas besoin du système Windows et c'est ce qui le différencie de beaucoup.

Il existe plusieurs projets qui s’appuient sur Wine, notamment le commercial Cedega ou le "libre" PlayOnLinux.

Je déprécie particulièrement ce dernier, il n'est qu'un outil graphique pour utiliser Wine "facilement" et utilise des script conçue par la communauté. Il ce revendique pourtant comme logiciel à part entière, vous ne trouverez aucun lien vers Wine ni un remerciement sur leurs site officiel. Le tout dans un environnement TRÈS restrictif, suspicieux et moralisateur. Je déconseille fortement !

#### Installons wine 

- Debian / Ubuntu `$ sudo apt-get install wine`
- Arch `# pacman -S wine`

Une fois installé faisons une première configuration.
- `$ winecfg`

![Image de presentation](/images/lh3.ggpht.com-uKG0PIzI6pw-UWqqBjVMPHI-AAAAAAAAAdw-0q6Prwqgc_A-s400-snapshot40.png "")
![Image de presentation](/images/lh3.ggpht.com-dQaDwdKgtXA-UWqqBt6-PvI-AAAAAAAAAdo-bxQtn0krzfQ-s400-snapshot39.png "")
![Image de presentation](/images/lh3.ggpht.com-qd-5ggOcq9Y-UWqqBpZlA3I-AAAAAAAAAds-iTaLrg2tKaw-s400-snapshot41.png "")
![Image de presentation](/images/lh3.ggpht.com-9pUg6i9ueHM-UWqqCOyWvMI-AAAAAAAAAd4-GOKwOqiHBOU-s400-snapshot42.png "")

Dans application on défini sur Windows XP car c'est le plus compatible de base. Lecteur "Détection Auto" ce qui vas attribuer les lettres et vous pouvez par la même occasion attribuer une lettre de lecteur au dossier ou vous voudrez effectuer les installation moi c'est "Z:" qui pointe sur "/media/win/". Audio pour définir votre sortie et alsa ou autre, pour moi ses défauts et probablement pour vous aussi (valeurs os).

#### Passons à l'utilisation et installation de logiciel

Si comme moi vous avez été en dual boot avec windows, sachez que la majorité des jeux et logiciel sont "portable" à l'origine. C'est-à-dire qu'ils peuvent être utilisé sans les ré-installer.

Pour exécuter un .... exécutable windows utiliser toujours la console. Elle vous serviras de "debug". Ce qui veux dire que vous pourrez analyser les actions du logiciel et connaître les problèmes ou les besoin qui ne lui sont pas satisfait et remonter a la source d'un plantage ou autre dysfonctionnement.
- wine /lechemin/delexec/log.exe

![Image de presentation](/images/lh3.ggpht.com-Yj3rbIKrKTk-UWqzws5pAoI-AAAAAAAAAeQ-A0NN4ivK__w-s640-snapshot43.png "")

Dans cette image j'ai désactivé la lib "ijl15.dll". Donc au lancement de WarCarft3 il indique que "Game.dll" ne la trouve pas. Dans le cas ou je ne l'aurais pas, il suffirait de la télécharger et la placer dans le dossier de l’exécutable.

Les sites de téléchargement de dll que j'ai testé sont :
- [http://fr.dll-files.com/](http://fr.dll-files.com/)
- [http://www.fichier-dll.fr/](http://www.fichier-dll.fr/)

Attention vous devez y obtenir un .zip ou .dll, les .exe sont des pub et autres conneries...

Ok on a vu comment si prendre pour débuter, mais **Wine peut être bien plus poussé** et disposes d'un fonctionnement qui permet de s'adapter à tout logiciel. Voyons un peu ça.

Ré-entrons dans WineCFG comme pour configurer wine la 1ere fois.

![Image de presentation](/images/lh3.ggpht.com-3Bj1tfSLCDs-UWq4eUjAZkI-AAAAAAAAAeg-Pi3KRCKCfFg-s400-snapshot44.png "")

Comme vous pouvez le voir je n'ai pas que "Paramètre par défaut" dans ma liste, mais plusieurs exécutables listé. ceci permet de spécifier une configuration spécifique pour chaque exécutable et ainsi laisser un environnement par défaut propre. Vous pouvez changer de windows, de dll, d'affichage etc ... pour chaque exécutable distinquetement.

Pour ce faire il suffit de faire "Ajouter une application" et de sélectionner l’exécutable a lier et luis spécifier sa configuration (qui reste par défaut si vous ne le modifier pas).

#### Ce débrouiller seul c'est bien, mais de l'aide ne fait pas de mal

Wine met à disposition sur son site une base de données des jeux et logiciels testés avec un indicateur de fonctionnement qui ce présente sous cette forme. Du logiciel fonctionnant très bien au logiciel impossible à faire tourner. Je vous ai concocté une petite image :)

![Image de presentation](/images/lh3.ggpht.com-YCowuUkPPEA-UWq9X1G2-jI-AAAAAAAAAew-IJmzVObD5lg-s640-wine_classification.png "_Wine classement_")

Si vous débutez sous Linux, ce n'est pas la peine de tester Les Bronze et Garbage, vous aurez sûrement du mal avec le grade Silver. Platinum et Gold ne présente aucune difficulté et rarement besoin de configuration.

Le site de wine ce trouve ici ainsi que la base de données:

- http://www.winehq.org/
- http://appdb.winehq.org/

Le moteur de recherche de la DB utilise google ce qui semble au 1ere abord très bordélique, mais l'on si fait. Un logiciel ce présente dans WineDB sous cette forme.

![Image de presentation](/images/snapshot45.png "")

La 1ere chose auquel il faut prêter attention est la section "Test Result". Vous avez dans cette liste les testes réalisé par les utilisateurs et le retour qu'ils ont donné. Ainsi vous pouvez voir la distribution utilisé, la date la note ... Prenez le teste qui à la date la plus proche, meilleur ratio et si possible sur votre distribution pour le sélectionner cliquez sur "show", "current" indique la ligne que vous regardez.

Passons à l’analyse de la section "selected test result". Il est listé ce qui fonctionne avec cette installation, ce qui ne fonctionne pas et ce qui ne fut pas testé. Ce qui nous intéresse le plus ce trouve dans "Additional Comments" qui fournis des information sur la démarche d'installation, les dll utilisé, la config wine.

C'est que l'on peut utiliser pour ensuite revenir configurer notre exécutable dans WineCGF et éventuellement lui ajouter ce qu'il lui faut.

#### Indiquations 

Pour aller plus loin ou installer certaines lib il faut utiliser un outil nommé "winetricks", il s'utilise sous cette forme "sh winetricks nomdelalib"

Dans WineCFG a l'onglet "affichage" activer "Émuler un bureau virtuel" peut résoudre beaucoup de bug d'affichage.

N’exécuter pas de logiciel sur une partition FAT ou NTFS. C'est généralement source de problème.

Des racousis clavier de votre environnement Linux peut gêner l'utilisation de certain logiciel.

#### En savoir plus (ou moins) 
- [http://www.winehq.org/about](http://www.winehq.org/about)
- [http://www.winehq.org/help](http://www.winehq.org/help)
- [http://doc.ubuntu-fr.org/wine](http://doc.ubuntu-fr.org/wine)

#### Après avoir bien utilisé ce logiciel je vous conseille deux choses 
1. Participer et donner vos retours sur des logiciel dans la DB de Wine
2. Faire un don a Wine pour soutenir ce projet libre [http://www.winehq.org/donate/](http://www.winehq.org/donate/)

Pour revenir un peu sur le cas de PlayOnLinux. Il peut etre bon de regarder les script de la communauté. POL utilise des script qui ont des configuration de wine différentes pour chaque jeux, et qui indique a leurs programme les dépendances a installer. Il est donc possible "d'utiliser" leurs scripts sans POL !

A bientôt pour un approfondissement :)

**éa, les amis.**
