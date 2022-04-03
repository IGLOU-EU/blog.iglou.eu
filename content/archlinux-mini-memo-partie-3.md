+++
title = "Archlinux mini memo (partie 3)"
slug = "archlinux-mini-memo-partie-3"
date = 2012-01-13T10:30:00Z
updated = 2013-08-06T16:08:50Z
tags = ["linux", "memo"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## Mes "mentos" d'Arch

Dans la partie 3 nous allons retrouver un moment mon très aimable initab, puis la gestion du poweroff et reboot pour les users, ainsi que les lancement a la connexion. Le tout d'un point de vue "virtual console".

Pourquoi encore du inittab (fait chier avec son inittab...) ? Car j'aime ça, mais aussi pour une connexion automatique de user en virtual console ! C'est le genre de petit truc que je trouve très utile parfois, mais que j’oublie rapidement ...

### Méthode 1
```
c1:2345:respawn:/sbin/agetty -a <nomdeluser> -8 -s 38400 tty1 linux #(on modifie la ligne du tty1)
```

### Méthode 2
Il faut installer **mingetty** `yaourt -S mingetty`

```
a1:2345:wait:/sbin/mingetty --autologin <nomdeluser> tty1 linux #(on ajoute la ligne pour tty1. ATTENTION les tty ne seront pas dispo avant la fin de a1 !)
```

### Alternative pour eviter le wait _(attention impossible de quitter A1 qui remplacera C1)_
```
a1:2345:respawn:/sbin/mingetty --autologin <nomdeluser> tty1 linux #(et t'en qu'a faire, commentez la ligne du c1 que a1 remplace.)
```

---

Il y a bien sur d'autres méthodes mais suivant le besoin j'utilise ces deux la.

J'ai eu longtemps du mal avec cette gestion de l’énergie pour les users.   
Attachez vous, c'est l'heure de reboot en mode user ! Je préfère la solution avec sudo.
- yaourt -S sudo
- Puis on va éditer /etc/sudoers pas besoin d'une machine a gaz pour éditer ça ...
- sudo nano /etc/sudoers
- user hostname=NOPASSWD: /sbin/shutdown ,/sbin/reboot ,/sbin/poweroff  (on y ajoute cette ligne, pour lui indiquer de ne pas demander le PW)
- On édite .bashrc  (et on s’embête pas, on utilise nano [te la pète pas avec ton V ou E])
- Puis on y ajoute des alias dans ce genre _alias reboot="sudo reboot"_ (comme conseillé par le wiki archlinux ;) )

Et pour finir cette 3eme partie le lancement semi automatique d'une commande a la connexion d'un user.
- On vas dans le .bash_profile  de l'user en question et on l'édite !
- La ligne ce compose de la cible a qui l'on vas parler puis de ce que l'on va lui dire. Ce qui donne :
- [[ $(tty) == '/dev/tty1' ]] && lacommande  (on parle ici a tty1 en lui disant "lacommande")

Par exemple pour démarrer un script par un alias. Ou :
- [[ $(tty) == '/dev/tty1' ]] && reboot

**éa, les amis.**
