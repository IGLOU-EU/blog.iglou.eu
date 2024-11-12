+++
title = "Crash de LibreOffice sous Linux"
slug = "crash-de-libreoffice-sous-linux"
date = 2014-01-16T04:59:00Z
lastmod = 2014-01-16T04:59:16Z
tags = ["linux", "software"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## LibreOffice crache sa sauce

Créer un document, rédiger quelques ligne, être fière de son boulot et ce dire "Je vais enregistrer on ne sait jamais", la BAM.   
Par deux fois, je me suis fait avoir par un crash de LibreOffice. Mais il ne m'y reprendras plus !

![Image de presentation](/images/survivingsurvivalism.com-computer_crash.jpeg "")

Ce crash interviens au moment de la sauvegarde et seulement avec KDE, en réalité Libreoffice entre en conflit avec la boite de dialogue de KDE.   
Pour résoudre ce problème, c'est simple `Outils -> Options -> LibreOffice -> Général` puis activer la boite de dialogue dédié de Libre office en cochant `Utiliser les boites dialogue LibreOffice`.

![Image de presentation](/images/snapshot101.png "Magie !")

Le bug à était listé ici : [https://bugs.kde.org/show_bug.cgi?id=317142](https://bugs.kde.org/show_bug.cgi?id=317142)
Il est affiché comme **Fixed**, mais n'en est rien pour moi.

**éa, les amis.**
