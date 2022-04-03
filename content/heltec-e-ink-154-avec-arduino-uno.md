+++
title = "Heltec e-ink 1.54\" avec Arduino UNO"
slug = "heltec-e-ink-154-avec-arduino-uno"
date = 2019-03-18T13:17:00Z
updated = 2019-03-18T21:40:24Z
tags = ["hardware", "programmation"]
blogimport = true
+++

## La base pour utiliser cet écran e-ink

_**EDIT:** Vous allez rire, j'ai passé deux jours à chercher de la doc pour cet écran. Puis en rédigeant cet article, j'ai remarqué qu'elle était disponible sur le site du constructeur… et est dû rédiger à nouveau cet article, et retirant pleinnnnnn d'indications… C'est du boulot d’être con._

![Image de presentation](/images/4.bp.blogspot.com-mWhQoubCNE0-XI9f2kthPmI-AAAAAAAAA2A-uEWIut-TtYdYi-W7DZ1x-H8GGumvSsMgCLcBGAs-s640-IMG_20190318_100636.jpg "Qu'il est beau !")

### _Heltec 1.54" e-ink_

**I**l était une fois, un petit malin. Il pensait que l’écran e-ink le moins cher et le moins connu de son site chinois était le meilleur choix… Vous savez quoi ? Il avait tort.

Heureusement parmi les commentaires du produit, une personne a eu la bonne idée de citer la lib qu'il utilisait (merci à lui ...). Il indiquait aussi que la lib officiel ne fonctionnait pas bien (sans blague).

La lib compatible est 🎊 EPD Waveshare 1.54 🎉, en plus elle est disponible dans le lib manager de l'IDE Arduino.

[Lien officiel du produit](http://www.heltec.cn/project/1-54-inch-e-ink-screen/?lang=en)

[Lien officiel de la documentation + sources](https://drive.google.com/file/d/1cxx3VWmvgyAFA6MwDRLmr0n2f8Gkta9O/view)

Infos du produit compatible de chez waveshare (Probablement la même base):

- [E-Paper DataSheet.pdf](https://www.waveshare.com/w/upload/7/77/1.54inch_e-Paper_Datasheet.pdf)
- [E-Paper module user manual.pdf](https://www.waveshare.com/w/upload/7/7f/1.54inch_e-paper_module_user_manual_en.pdf)
- [Code exemple.7z](https://www.waveshare.com/wiki/File:1.54inch_e-Paper_Module_code.7z)
- [Tuto pour la création d'une font](https://wavesharejfs.blogspot.com/2018/08/make-new-larger-font-for-waveshare-spi.html)

### Time for action !

![Image de presentation](/images/2.bp.blogspot.com-H8fjOnsOpJM-XI9mLOtjHfI-AAAAAAAAA2M-J2i-Mjsuk2kA4C_XhL5MNCF4CzasVCAAwCLcBGAs-s640-Arduino-uno.png "Un Arduino UNO classique, avec ses broches.")

Le constructeur du nôtre écran, bien qu'un peu à cran (à non ça, c'est moi) ... fournis la liste des pins. C'est sympa ça. Attention les épines, ça pique, alors il ne faut pas se tromper.

![Image de presentation](/images/scr_111606.png "SDI = MOSI = D11; CLK = SCK = D13VCC à connecter sur 3.3v et GND ... ba sur GND !")

La lib de Waveshare, donne l'utilisation des pins **reset** et **busy**, mais elle ne sont pas disponible sur notre écran et totalement optionnel.

Le code d'exemple est relativement parlant, il n'y a donc rien à ajouter sur ce point. Si vous avez besoin de la liste des fonctions, ne regardez pas dans le .h, les commentaires étant dans le .cpp ...

### Bon à savoir !

Il y a deux zones mémoires. Par ex, pour afficher une image de fond et un texte, il faut charger les deux zones avec 'setFrameMemory' puis les afficher 'displayFrame'.

Pour afficher plusieurs zones, il faut définir une zone à éditer avec 'setWidth et setHeight', puis 'clear' cette zone avant d'y écrire.

Il n'est pas possible d'utiliser de larges zones à éditer, l'atmega de notre Arduino n'ayant que 2048Bytes de ram, 1Byte = 8pixel. Il y a 40k pixel sur cet écran, sélectionner tout l’écran prendrait 5000Bytes.

Il y a un bon exemple d'utilisation d'image dans la lib de chez waveshare, il faut juste garder en tête que l'image est en N&B et exprimé en hexadécimal. Vous pouvez utiliser [cet outil en ligne](http://www.digole.com/tools/PicturetoC_Hex_converter.php) au besoin.

Tout call a 'displayFrame', devrait, semble-t-il, être précédé d'une attente de 300ms

**éa, les amis.**

PS: Dans cet article, il y a probablement pleins d’imprécisions et d'erreur, du fait que je découvre tout juste la techno. N’hésitez pas à corriger **;)**