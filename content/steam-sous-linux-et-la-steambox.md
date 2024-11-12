+++
title = "Steam sous linux Et la SteamBox"
slug = "steam-sous-linux-et-la-steambox"
date = 2013-03-04T02:30:00Z
lastmod = 2013-08-06T16:05:25Z
tags = ["hardware", "linux", "software"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## I Have a Dream _!_

 _(pardonne moi martin de t'utiliser en informatique ...)_

Hé oui, steam est officiellement sous G/Linux depuis plus de 3semaines et c'est loin d’être un flop !

![Image de presentation](/images/img.clubic.com-05720824-photo-steam-linux.jpg "")

Avec un démarrage du feu des dieux, Steam-Linux serait déjà utilisé par plus de ~2,84%(tout linux confondu) de la communauté steam contre ~3.07% pour apple (bien que les mac ne soit pas des playeurs).

![Image de presentation](/images/lh3.ggpht.com-3LUKCYZMc1s-UTPx9s8cH8I-AAAAAAAAAcw-yRP3WgWb5PI-s320-snapshot10.png "")

Les mauvaises langues "ça ne marcheras jamais" seront calmé.

- Une petite liste des jeux deja porté pour linux : [ici](http://steamdb.info/linux/?displayOnly=Game)
- Un article sur SteamBox : [là](http://www.jeuxvideo.com/news/2013/00063551-steam-box-la-boite-pleine-de-brume.htm)

La SteamBox c'est quoi ?

C'est un PC sortis sous forme de console de salon, Une console dédié à steam, retrouver tout son PC-steam sur la TV sans avoir à déplacer son fix, et ceux avec une manette ou le combo classique. La steambox est basée sur linux, d’où le portage prévisible de la majorité des titres.

C'est ce qui personnellement me fait plaisir, grâce à ce projet de SteamBox et cette envie qu'a steam de ce dégager des bras de windows. Nos jeux favoris seront enfin disponible sous Linux et comme Photoshop tourne tout comme Maya sous linux, plus besoin de dual-boot avec windows.

![Image de presentation](/images/www.steamgamefans.com-wp-content-uploads-2012-09-Dwm-2012-09-05-17-40-38-52-1024x576.png "")

Si comme moi, vous vous êtes jeté pour l'installer avant même son placement en dépôt officiel, vous avez sûrement des bug du genre :
- Failed to load installscript
- OpenGL version: "1.4 (2.1.2 NVIDIA 313.18)"
- (steam:5959): LIBDBUSMENU-GLIB-WARNING **: Trying to remove a child that doesn't believe we're it's parent.

les remèdes sont :
- Ne pas utiliser de liens symboliques
- ReInstall de Steam depuis les dépôts officiel
- Installer/Remplacer Lib32 mesa par la lib32 propriétaire

**éa, les amis.**
