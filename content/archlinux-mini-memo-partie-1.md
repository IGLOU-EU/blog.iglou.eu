+++
title = "Archlinux mini memo (partie 1)"
slug = "archlinux-mini-memo-partie-1"
date = 2012-01-09T05:15:00Z
updated = 2013-08-06T16:09:16Z
tags = ["linux", "memo"]
blogimport = true
+++

## My Arch 🐧

Qui n'a jamais passé des heures et des heures, a creusé ses méninges afin d'en faire sortir son précieux jus, contenant les commandes permettant de finir son installation correctement. Ou encore a secouer son moteur de recherche comme un prunier !

Tout ce foutoir n'est pas fini, mais au moins les lignes de bases sont la et c'est toujours utile.

L'un des point sur le quel il peut arriver de bloquer est la toute fin d’installation. Au moment de la configuration ... Partie 1 :

### /etc/rc.conf
- `LOCALE="fr_FR.utf8"` (Toujours mieux si l'on est fr)
- `TIMEZONE="Europe/Paris"` (Deja réglé dans l'installation logiquement, mais a verifier)
- `KEYMAP="** fr-latin9 **"` (clavier fr toujours mieux si l'on a un azerty. Pourquoi latin9 ? Aucune idée, vielle habitude de ma première Mandrake de "97" )
- `CONSOLEMAP, CONSOLEFONT` (perso pas besoin je fais pas de jap, chinois ou autres)
- `USECOLOR="yes"` (plus c'est kikou console plus c'est fun [sans trop abuser sur le kikou])
- `MODULES=()` (pour un wifi pas reconnue ou autre mais installé)
- `DAEMONS=(syslog-ng @network crond)` (ma config daemons avec un @ pour un chargement en fond)

### Ajouter un user
- `# useradd -m -s /bin/bash <user_name>`
- `# passwd <user_name>`
- `# usermod -G users,wheel,audio,optical,lp,scanner,log,power,floppy,storage,video <user_name>`

### /etc/pacman.conf
```toml
[archlinuxfr]
Server = http://repo.archlinux.fr/x86_64
```

### Autres fichiers importants
- **syslog-ng** s'occupe de la centralisation des logs
- **network** active les connexions
- **crond** planificateur de tâches
- **/etc/locale. _**gen** (juste passer en fr_**_"fr_FR.UTF-8 UTF8"_**_)_**
- **/etc/pacman.d/mirrorlist****_(_**mir.archlinux.fr**_)_**

**éa, les amis.**
