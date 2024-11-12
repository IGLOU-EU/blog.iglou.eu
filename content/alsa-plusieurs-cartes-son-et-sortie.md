+++
title = "Alsa plusieurs cartes son et sortie audio USB"
slug = "alsa-plusieurs-cartes-son-et-sortie"
date = 2014-03-11T14:33:00Z
lastmod = 2014-03-16T18:26:39Z
tags = ["linux"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

**Bonjour à tous,** après deux ans de loyaux services mon casque a rendu l’âme ... Il était donc naturel d'en quérir un nouveau. Malheureusement et bien que choisi avec soin, celui ci à une connectique USB me limitant donc aux ordi. La qualité sonore n'en est pas pourtant pas meilleur, et c'est donc adieu (temporaire) à l'universel JACK qui lui, m'aurait permis de connecter ce casque a ma console ...

![Image de presentation](/images/www.semageek.com-wp-content-uploads-2010-11-ippod-cl%C3%A9-usb-de-merde-concept-apple.jpg "_Cette image exprime tres bien ce que je pense de l'USB pour l'audio et de Apple en général._Ayant testé cette "technologie" audio sous Windows7 et mon Linux, je peux certifié que l'on est mieux chez les manchot.")

Car oui chez *croSoft, impossible d'utiliser le casque correctement sans l’habituel et rebutante couche de Drivers a redémarrages et configurations fastidieuses. Un casque audio dit "gamer" a pourtant comme cible prioritaire Windows ! Non ? Sans parler de la cohabitation de deux cartes son et leurs Drivers qui chez w7 sont entré en conflit (ex: pour connecter une chaine jack).

Arrêtons ici le Troll et passons a ce qui nous intéresse, la configuration sous un Gnu/Linux avec Alsa et un petit passage sous KDE. Aucun problème a noter, prise en charge direct et multiples configurations possibles rien de spécial à installer. Je préviens aven de débuter, je n'ai pas utilisé la méthode graphique, mon casque étant le seul micro présent il est attribué automatiquement et en défaut par Alsa

**En graphique sous KDE**

Dans Kmix (d’après ce que j'ai compris) :

Kmix > Configuration du son et de la video > Lecture audio

Dans la liste monter le nouveau périphérique et cliquer sur "Tester"

Kmix > Configuration du son et de la video > Enregistrement audio

Comme précédemment ...

![Image de presentation](/images/snapshot111.png "")

Le défaut est que cette configuration n'est pas directement lié à Alsa, si vous changez d'interface graphique ou utilisez un logiciel quelque peu spécial c'est un retour à la carte par défaut "card 0".

**Via le fichier de conf utilisateur Alsa**

Ce fichier ce trouve dans le home de l'utilisateur en question et ce nome .asoundrc, autrement dit "~/.asoundrc", il est possible de l'appliquer a l'ensemble du système via "/etc/asound.conf" ce que je ne conseil pas. Il faut juste créer ou éditer ce fichier avec votre éditeur favoris, ce qui donne pour moi "$ kate ~/.asoundrc" ou "$ nano ~/.asoundrc". Connaitre ses interfaces peut être utile, avec la commande "$ aplay -l" ou "$ cat /proc/asound/cards"

**Utiliser qu'une carte**

```
pcm.!default {
 type hw
 card 0
}

ctl.!default {
 type hw           
 card 0
}
```

_Si c'est une carte son a plusieurs sortie vous pouvez spécifier le dispositif en ajoutant "device 0" 0 étant le dispositif par défaut._

**Utiliser deux cartes en clone**

```
pcm.both {
    type route;
    slave.pcm {
        type multi;
        slaves.a.pcm "plughw:0,0"
        slaves.b.pcm "plughw:2,0"
        slaves.a.channels 2;
        slaves.b.channels 2;
        bindings.0.slave a;
        bindings.0.channel 0;
        bindings.1.slave a;
        bindings.1.channel 1;

        bindings.2.slave b;
        bindings.2.channel 0;
        bindings.3.slave b;
        bindings.3.channel 1;
    }

    ttable.0.0 1;
    ttable.1.1 1;

    ttable.0.2 1;
    ttable.1.3 1;
}

pcm.!default {
        type plug
        slave.pcm "both"
}

ctl.!default {
        type hw
        card SB
}

```

Ce bout de code vas "réaliser" une route virtuel pour alsa. Il n'y a que 2 lignes a modifier. Ce qui dans mon cas donne :

slaves.a.pcm "plughw:0,0" = hw:1ere carte, 1er périphérique

slaves.b.pcm "plughw:2,0" = hw:3eme carte, 1er périphérique

**Petit plus !**

Pour revoir la qualité sonore a la hausse, vous pouvez ajouter ces lignes :

```
# fréquence d'échantillonnage
defaults.pcm.dmix.!rate 44100

# algorithme de re-échantillonnage
defaults.pcm.!rate_converter "samplerate_best"
```

_Source du sujet [ALSA MAIN](http://www.alsa-project.org/main/index.php/Main_Page)_ **.**

**éa, les amis.**
