+++
title = "[Imprimante 3D] Offset Z, Sonde et astuce ATX"
slug = "imprimante-3d-offset-z-sonde-et-astuce"
date = 2018-02-03T00:22:00Z
updated = 2018-02-03T01:05:09Z
tags = ["hardware", "reprap"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Bonjours a tou·te·s,

Waaoooo, bien tôt 1 an sans articles, je suis tout ému !

![Image de presentation](/images/4.bp.blogspot.com-OeNndYJD4p8-WnTQw5cvQQI-AAAAAAAAAuU-O0xDVBXg-DgPhaCP1FvP4209mIGdLXMAwCPcBGAYYCw-s400-images.duckduckgo.com.jpg "“I do not understand why the Designer chose to put such flaws into the world, that it appears almost as if it were damaged. But I must believe that there is a purpose here I cannot see.” – _1w/Faith v10.3.0047f_")

Voici Le grand jour enfin arrivé ! M'armant des derniers outils de notre époque, la pointe de la technologie, dons un tournevis et un marteau. Je fis route vers ma destinée, depuis longtemps tracé.

Cette… quête, fut un combat acharné de 24h, a la suite des quel je pus crier dans ma victoire "J'AI UNE IMPRIMANTE 3D !".

Quel bonheur de pouvoir s'adonner à la passion de créer et réaliser ce qui fut par le passé hors de notre portée. Mais en réalité… ça doit bientôt faire 2 semaines et je n'ai toujours pas fini de calibrer ce truc, depuis le début, j'imprime des boites, des benchs et des bateaux !

Du coup je vous fais un petit article, sur ce que j'ai compris, appris et que je n'ai pas ou peu trouvé malgré mes innombrables recherches.

---

### Ainsi parla Norihiori le sage et voici ses 7 commandements

#### 1) **Ton beau plateau, ta plaque de verre, ton aluminium, tu n'utiliseras point pour te faire la main.**
![Image de presentation](/images/1.bp.blogspot.com-a8pJ8AAmX9A-WnTaasV2d2I-AAAAAAAAAug-1lpZPsRxaEMka95bGEGEi2HBn_03lbCiQCLcBGAs-s200-BigBox_glass_bed_chip_indent.jpg "")

Effectivement, j'ai eu la chance de ne PAS avoir de plaque de verre à la bonne taille et me suis donc retrouvé avec une planche d'un vieux meuble IKEA. Quelle chance, car vue les trous et les rainures, je n'aurais pas aimé expérimenter ça sur du verre ou autre.

---
#### 2) **Pour ton offset, ne pas te casser la tête.**
![Image de presentation](/images/2.bp.blogspot.com-2Q7NWPAJ1X0-WnThMxHF1LI-AAAAAAAAAus-xrSa4WsYqfcgTE4E-YtHHhPKCKmjsrHvQCLcBGAs-s200-hqdefault.jpg "")

- Calibrer son axe Z (100mm demandé, bouge de 100mm)
- Faire un **_G28_** pour définir le zéro de la sonde
- Désactiver les Software Endstop afin de pouvoir se déplacer en négatif avec _**M211 Z0 S0**_
- Prendre une feuille de papier 0.1mm et la poser sur le bed
- Faire descendre l'axe Z petit à petit (1mm>0.1mm>0.02mm) pour toucher la feuille
- Voilà vous êtes à 0.1mm du bed, si vous descendez encore de 0.1mm vous serez à zéro (ne faites pas ça ...)
- Vous pouvez définir cette valeur négative comme étant zéro et faire des testes pour arriver à faire de jolies couches et définir votre zéro final (putain, c'est aussi chiant que de chercher le Graal)

---
#### 3) **Si la mémoire EEPROM est activé, ne pas l'oublier, car comme un benêt, tu serais bien embêté.**
![Image de presentation](/images/3.bp.blogspot.com-2aUnQCgfk5Q-WnTh-uocPlI-AAAAAAAAAu0-2iPbkomc96oIvo7CV2-n4VTb3SWhczhaACLcBGAs-s200-images.duckduckgo.com.jpg "Burn-Out")

Si vous avez Marlin (je ne connais pas les autres), et avez activé la mémoire interne… il ne faut pas l'oublier. Parce que les modifications effectuées en flashant le firmware, ne seront prises en compte qu'a la réinitialisation de cette mémoire. Sachant que j'ai tout défini en dur… avoir oublié de réinitialiser cette mémoire m'a joué des tours.

Pour vider l'EEPROM et réinitialiser avec les valeurs du programme (ce que l'on a compilé et flashé), utilisez **M710**

---

#### 4) **Une sonde tu as, alors à chaque print tu ne proberas pas**"   
_(notez l'inventivité de ma langue française)_
![Image de presentation](/images/2.bp.blogspot.com-AS6PjTDm9sk-WnTma674OjI-AAAAAAAAAvA-P1o4m3THxp4PtiWEkkHFODXarTD3dREaQCLcBGAs-s200-images.duckduckgo.com.jpg "")

Si vous avez activé l'EEPROM, il est possible de stoker en mémoire "aplanissement virtuel du plateau" comprenez la commande **G29** (nota. sous smoothieware c'est l'utilisation de **G32**, le résultat est automatiquement mis en mémoire).

Pour ce faire, on fait un **G28** histoire de tout remettre à zéro et on prob le bed avec **G29**, une fois fini on demande à l'imprimante de nous garder ça au chaud avec un **M500**. Et voilà, c'est en mémoire !

Pour l'utiliser, il est cependant nécessaire de le demander à l'imprimante avec un **M420 S1** avant chaque print (placez le, après un **G28** dans votre start script G-code)

---

#### 5) **Et Élohim, dans sa grande bonté, les ATX créa.**

Il est possible de "piloter" les alimentations ATX avec les ramps 1.4, il serait dommage de ne pas en profiter… Suivez le guide

![Image de presentation](/images/Screenshot-2018-2-2%203_zpseb50f706.png "La petite image sous Gimp pour l'occasion !")

Pour activer ce support, c'est dans **Configuration.h**
- **#definePOWER_SUPPLY1**
- **#define PS_DEFAULT_OFF** // L'imprimante reste éteinte par défaut

Une fois ceci fait, vous pouvez allumer l'imprimante avec **M80** et l'éteindre avec **M81**; Pour ma part, j'ai ainsi mis un **M80** dans mon script Gcode de début et un **M81** dans mon Gcode de fin.

Du coup l'imprimante s'allume pour un print et s’éteint à la fin.

---

#### 6) **Boucher, est celui qui débitera sans ventiler**.
![Image de presentation](/images/Screenshot-2018-2-3.png "Je joue du Gimp ce soir !")

Mais où donc se branche ce ventilo, non mais c'est vrai, le ventilo pour le radiateur de la buse, il se branche où ? Non parce que, sur tous les schémas, il y a un ventilo branché sur **D9**, mais ça, ce sont des conneries ! **D9** c'est pour le ventilateur destiné au refroidissement des pièces ou à une deuxième résistance chauffante.

---
#### 7) **Pousser n'est pas jouer**.
![Image de presentation](/images/images.duckduckgo.com.jpg "")

Pour l'axe Z on utilise généralement deux moteurs, le problème est qu'il faut pousser le pololu au cul pour qu'il accepte de faire bouger les deux, il y a ainsi plus de risque de l’endommager. Ou alors on utilise un autre pololu à la place du 2ᵉ extrudeur qui sera utilisé pour le 2ᵉ moteur de l'axe Z.

L'option est prévue par marlin sur les RAMPS uniquement et dans le fichier **Configuration_adv.h**
- **#define Z_DUAL_STEPPER_DRIVERS**

---

**SOURCES:**
- IRC freenode #reprap-fr- - [http://reprap.org/wiki/G-code](http://reprap.org/wiki/G-code)- - [http://reprap.org/wiki/RAMPS1.4](http://reprap.org/wiki/RAMPS1.4)
- [MakerBot Z calibration](https://www.youtube.com/watch?v=SQXSwAOXytE)
- [https://github.com/ErikZalm/Marlin/blob/Stable/Marlin/Configuration.h](https://github.com/ErikZalm/Marlin/blob/Stable/Marlin/Configuration.h)

_Comme toujours, si je raconte des conneries, dites le moi, ça évitera au clampin qui passe dans le coin d'appliquer celle-ci._

**éa, les amis.**