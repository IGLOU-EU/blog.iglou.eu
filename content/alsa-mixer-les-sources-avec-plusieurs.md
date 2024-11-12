+++
title = "[Alsa+Dmix] Mixer les sources pour plusieurs cartes"
slug = "alsa-mixer-les-sources-avec-plusieurs"
date = 2014-03-16T22:44:00Z
lastmod = 2014-03-17T18:17:55Z
tags = ["linux"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Voici déjà plus de 4jours que je cherchais la solution afin d'avoir le mixage des sources avec plusieurs cartes son. Par la suite de mes recherches, j'avais déjà posté sur comment utiliser plusieurs cartes son avec Alsa.

![Image de presentation](/images/www.noulakaz.net-weblog-images-20050814-dmix.jpg "")

N’ayant VRAIMENT pas envie d'utiliser quelque chose comme Jack, PulseAudio et autres machines a gaz nécessitant moults configurations, direction Dmix le plugin d'Alsa. Alsa, mixage de sources = Dmix.

Dmix est un serveur de son, il vient s'interposer entre le logiciel source du signal audio et le pilote (Alsa). Il a pour vocation de mélanger les sources audio afin d'en envoyer une unique au pilote. Dmix est un plugins activé par défaut sur les installations actuel de Alsa, il est contenu dans le package "alsa-utils".

Le problème étant que Dmix n'est pas capable de mixer des sources destiné a plusieurs cartes son. Il faut donc indiquer a Alsa que chaque carte son est traité par Dmix indépendamment et ensuite envoyé au pilote qui les regroupes.

Les problèmes :

1- Pas de cartes son multiples avec Dmix

2- Dmix cause une perte de qualité sonore

3- Le traitement des cartes son séparément demande d'effectuer deux fois le boulot

#### 1) Pas de cartes son multiples

Comme nous l'avons vu Dmix est activé pas défaut, mais n'est pas capable de mixer plusieurs cartes. Celui-ci est désactivé si plusieurs cartes sont configuré pour alsa.

Voici la solution, définir dmix pour chaque carte indépendamment, puis lier la sortie. Script :

```
# réglage des cartes son, selon la commande « aplay -l », card = carte et device = périphérique
pcm.carteInterne {
    type hw
    card 0
    device 0
}

ctl.carteInterne {
    type hw
    card 0
    device 0
}

pcm.carteUsb {
    type hw
    card 2
    device 0
}

ctl.carteUsb {
    type hw
    card 2
    device 0
}

# Creation d'un Dmix pour chacune 
pcm.interneMix {
    type dmix
    ipc_key 1024
    ipc_key_add_uid false
    ipc_perm 0666
    slave {
        pcm "carteInterne"
        channels 2
        periods 128
        period_time 0
        period_size 2048
        buffer_size 4096
    }
    bindings {
        0 0
        1 1
    }
}

pcm.usbMix {
    type dmix
    ipc_key 2048
    ipc_key_add_uid false
    ipc_perm 0666
    slave {
        pcm "carteUsb"
        channels 2
        periods 128
        period_time 0
        period_size 2048
        buffer_size 4096
    }
    bindings {
        0 0
        1 1
    }
}

# Sortie multi cartes
pcm.both {
    type route;
    slave.pcm {
        type multi;
        slaves.a.pcm "interneMix";
        slaves.b.pcm "usbMix";
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
        slave {
                pcm both
        }
}

ctl.!default {
        type hw
        card 2
}
```

#### 2) Perte de qualité sonore

La seul solution a ma connaissance est d’éviter le ré-échantillonnage. A la base Alsa à une fréquence d'échantillonnage de 48000hz, n’écoutant que des flac provenant de rip cd a une fréquence de 44100hz ce n'est pas adapté.

Il faut donc passer en "rate 44100" (regardez le rate de vos medias).

Deux façons de faire, ajouter la ligne "defaults.pcm.dmix.!rate 44100" a votre fichier .asoundrc, soit ajouter "rate 44100" dans la section slave de votre carte avec dmix.

Même chose pour :

defaults.pcm.dmix.!rate_converter "samplerate_best", qui interviens si malgré tout il y avait besoin d'un re-échantillonnage

#### 3) Effectuer deux fois le boulot

Il est possibles que les veilles config ne supporte pas la solution **1**, il est donc possible de réaliser deux fichier asoundrc que l'on "switch" suivant l'utilisation de l'une ou l'autre carte son.

---

En esperant n'avoir rien oublié, plus d'informations disponibles sur [wikipedia](http://fr.wikipedia.org/wiki/Advanced_Linux_sound_architecture), [wikiUbuntu](http://doc.ubuntu-fr.org/son), [DmixAlsa](http://alsa.opensrc.org/Dmix) et le script est aussi disponible sur le [wikiArchLinux](http://wiki.archlinux.fr/Alsa)

**éa, les amis.**
