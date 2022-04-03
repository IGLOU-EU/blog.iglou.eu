+++
title = "Don't Starve Steam - Divers bug !"
slug = "dont-starve-steam-divers-bug"
date = 2013-05-11T19:52:00Z
updated = 2013-08-06T16:00:51Z
tags = ["jeux"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Bonjour a tous, je viens de m'offrir Don't starve et comptais m'y metre de suite. Mais là encore Super-Bug est présent. Voici donc comment résoudre certaines erreurs que j'ai eu.

![Image de presentation](/images/td.png "")

**1. Le jeux ne voulais pas démarrer !**

J'avais acctivé  la traduction française inclue avec le jeux sous forme de mod et le jeu refusait tout bonnement de ce lancer.

Il suffit de vous rendre dans votre SteamApps

```
$ cd common/dont_starve/data/scripts/languages/
$ nano language.lua
```

et d'ajouter simplement "--" pour que tout rentre dans l'ordre.

```
--LanguageTranslator:LoadPOFile("data/scripts/languages/french.po", "fr")

```

**2. Erreu de chargement d'une lib steam !**

Petite erreur que j'ai remarqué en cherchant la cause d'une autre erreur.

```
/home/adrien/.local/share/Steam/linux32/libsteam.so
with error:
/home/adrien/.local/share/Steam/linux32/libsteam.so: cannot open shared object file: No such file or directory

```

Etrangement Don't Starve contien ce fichier, et ne le demande pas au bonne endroit.

```
SteamApps/common/dont_starve/bin/lib32/libstream.so
```

J'ai du coup opté pour copier cette lib

```
$ cp votre/SteamApps/common/dont_starve/bin/lib32/libstream.so ~/.local/share/Steam/linux32/libsteam.so
```

**3. Pas de son !!!**

Ne pas avoir de son, c'est vraiment ... déstabilisent, sur tout lors de son premier lancement. Les erreur lié au sont étaient :

```
ALSA lib dlmisc.c:236:(snd1_dlobj_cache_get)

Cannot open shared library /usr/lib32/alsa-lib/libasound_module_pcm_pulse.
[20:52.34.244349]: FMOD Error: Error initializing output device.
[20:52.34.244394]: SoundSystem::Initialize failed
[20:52.34.629191]: FMOD Error: Can't play event dontstarve/music/music_FE: An invalid object handle was used.
```

L'information a retenir est "libasound_module_pcm_pulse". Cette librairie est fournie avec "alsa-plugins 1.0.27-1" disponible dans "multilib"

```
$ yaourt alsa-plugins

<i> 2 multilib/lib32-alsa-plugins 1.0.27-1
      Extra alsa plugins (32-bit)</i>
```

Je n'avais tout simplement pas la lib32 pour alsa.

_**On peut regretter que Steam ne fournisse pas un debug simple et/ou ne prévienne pas qu'une librairie est manquante.**_

**éa, les amis.**
