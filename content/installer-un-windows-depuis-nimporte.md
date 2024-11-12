+++
title = "Installer un Windows depuis \"n'importe\" quel OS"
slug = "installer-un-windows-depuis-nimporte"
date = 2017-05-24T11:18:00Z
lastmod = 2017-05-24T11:18:42Z
tags = ["bsd", "linux", "os x"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Haaa, ces produits Windows de chez M$, quel… merde, et dire qu'il y a des moments où l'on ne peut pas s'en passer… Merci les solutions proprio 🤢

_Cette solution fonctionne sur tout Os ayant de la virtualisation (VirtualBox ici)_

![Image de presentation](/images/windows-10-installation-maj.jpg "Long, moche et sans debug")

Que ce soit pour flasher des dispositifs chinois,
Maj mon vieux GPS (qui est 100% pas libre, 100% fermé et 100% mal foutu),
Debug un programme dont on ne penserait jamais être utilisé sous Windows…

Enfin bref, il y a des moments, il faut faire avec !

---

### L'angoisse
Si vous n'avais pas un CD, une clé USB avec W$ ou un HDD avec tout de bien installé… Ça peut vraiment être ennuyeux.

Vous avez peut être déjà tenté la création d'une clé avec une ISO Windows depuis un GNU/Linux, encore pire depuis un BSD ou Solaris (il y en a qui ont de drôles d'idées), bah vous savez que ce n'est pas amusant.

Pour les autres, prenez des tools simple comme "dd if/of", liliusb, unetbootin et tous ces trucs-là, bah ça ne fonctionne pas !

Je ne vous parle pas des solutions dédiées qui sont super chiante à mettre en place, des petites astuces bancales ou des programmes aux interminables problèmes.

### La Solution
L'idée est d'utiliser la virtualisation, genre VirtualBox (il y en a qui doivent me voir venir)et de définir un disque physique comme disque virtuel. **TA DAM**, vous en voulez plus ? Bah, c'est parti pour la pratique :)

_Note : Dans l'exemple, je vais utiliser un disque e-sata nommé /dev/sde_

1. On connecte le dispositif de stockage (ne pas oublier que W$ n'aime pas trop être sur autre chose que du sata ou e-sata)
2. Création d'une nouvelle table de partition sur le dispositif, afin de faire propre (si vous ne savez pas comment on fait, utilisez gparted, profitez en pour noter le nom de votre dispositif)
3. Création d'un disque virtuel depuis le disque physique : `# VBoxManage internalcommands createrawvmdk -filename /tmp/w7.vmdk -rawdisk /dev/sde`
4. Lancement de VirtualBox et création d'une nouvelle box, on configure ça suivant le Windows choisi, pour le disque, on sélectionne "disque existant" puis notre disque virtuel vmdk
5. On fait comme dab (ISO dans le lecteur, etc.) et on commence l'installation de Windows normalement
6. J'ai choisi d’arrêter à la fin de la 1ʳᵉ étape d'installation quand il y a plus besoin du CD (ça fonctionne probablement, même en allant jusqu'au bout)
7. On coupe VirtualBox, déconnecte et reconnecte le dispositif à l'ordi qui doit l'utiliser
8. On boot et fini l'install de ce p***** de Windows !

### TADAM

 Il n'y a pas à chier, c'est super simple, j'ai été confronté à une seule erreur "Windows: erreur STOP:0x0000007B" qui venait du fait que j'avais connecté le HDD en USB, une fois passé en e-sata plus de problèmes.


 Pour faire tout ça, je n'ai utilisé que le root, même pour VirtualBox, mais attention ce n'est pas l'idée du siècle, étant sur une live, je n'avais cependant rien à craindre.

**éa, les amis.**