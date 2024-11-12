+++
title = "Utiliser un Terminal Linux et le comprendre"
slug = "utiliser-un-terminal-linux-et-le"
date = 2013-04-17T18:37:00Z
lastmod = 2014-03-11T20:27:03Z
tags = ["linux"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

Je me souviens d'il y a ~15ans, le début de mes déboires en informatique. La difficulté que j'avais à comprendre Tutoriels divers passant par ces "Terminaux". Ce n'est qu’après des mois ou plus encore que j'en avais compris l’utilité.

Il est certain que de nos jours avec internet que je n'avais pas à l’époque, les choses sont bien plus simples. Mais si personne ne prend la peine d'expliquer la BASE des BASES, on ne peut pas faire un pas de plus !

![Image de presentation](/images/cmatrix.png "Bienvenue dans la matrice")

### Qu'est ce que c'est un Terminal Informatique ?
Un terminal est un ensemble qui permet de "discuter" avec une machine.

De nos jours, un terminal sera généralement une fenêtre sur un environnement graphique (LXDE, KDE, OpenBox ...) qui émulera une console.

Cette interface donne accès à une console d’échange homme-machine qui peut sembler compliqué, mais ce révèle bien meilleure dans toute les tâches de tests, debug, administration...

Il y a de cela un bon moment un terminal n’était qu'un clavier et un écran relié au réseau permettant de parler avec un ordinateur distant. Ce procédé était d’ailleurs utilisé pour le Minitel.

### Et une Console alors ?
Une console est une interface généralement lancée par un terminal et qui reste en attente d'une instruction(commandes) shell

Par défaut on peut accéder directement aux consoles par Ctrl+Alt+F de 1à6 F7 étant consacré a Xorg, qui est votre interface graphique.

### Et un Shell ?
C'est l'interpréteur, sans lui l'ordinateur ne pourrais pas comprendre nos directives. Il va jouer l’intermédiaire entre l'homme et la machine.

Il traduit les commandes, les exécutes, puis nous retourne le résultat.

### Il y en a plusieurs, le quel utiliser ?
Il existe un très grand nombre de Terminal. Personnellement j'utilise "Yakuake" qui est basé sur "Konsole" il est très pratique pour de petites actions, et simplement "Konsole" lorsque je suis en "production". Il m'arrive d'utiliser le terminal inclus dans le gestionnaire de fichier Dolphin.

Les "terminaux" sont toujours disponible dans les section "accessoires" ou "système" de votre Os.

### Comment ça marche ?
Vous lancer un Terminal qui lui vas émuler une console, dans laquelle vous entrerez des instructions, qui seront traduites à la machine par le Shell

Un terminal s'utilise avec des Mots-clés nommé " **commandes**", que l'on frappe dans son l’interface. Celles-ci comme on viens de le voir sont transmises au système par le Shell.

Lors du lancement d'une terminal vous avec un curseur clignotant, c'est la console qui attend de transmettre vos instructions. Cette indicateur est précédé d'un icône "$" ou "#". Qui indique votre "état".

- $ Indique que vous êtes connecté comme "user" (utilisateur)
- \# Vous préviens que vous êtes en root

Le root à tout les droit sur le système et est à utiliser avec parcimonie. Pour vous connecter en root il faut écrire "su" dans un terminal, ou "sudo su" sous Ubuntu.

Lors d'un tuto ou aide vous retrouverez toujours ces symboles qui indique sous quel état il est nécessaire d’exécuter la commande qui le succède (utilisateur ou root)

### Quels en sont les utilisations générales ?
On utilise généralement le terminal pour effectuer des actions rapides a l'aides des commandes unix. Je vous invite a regarder une liste de ses commandes sur wikipedia : [Liens - Commandes_Unix](http://fr.wikipedia.org/wiki/Commandes_Unix).

Mais aussi beaucoup en programmation avec des éditeur comme Vi, Emacs ou encore Nano, ce dernier étant beaucoup plus simple.

On utilise aussi les Terminaux pour effectuer du debug. C'est a dire, lorsque vous lancer un logiciel et qu'il plante, il peut y avoir un bref message d'erreur, mais rarement compréhensible. Démarrer ce même logiciel dans un terminal, au moment du plantage vous aurez de lister le résultat problème. Dans le pire des cas si vous le ne comprenez pas, il seras toujours plus simple de fournir ce résultat pour demander une aide précise.

### Pourquoi cela devrait me servir ?
Cela vous serviras à régler des problèmes, maintenir à jours votre système, Déboguer des programmes, effectuer des actions plus rapidement ... L'utilisation très varié est parfaitement complémentaire avec l'interface graphique et l'utilisation de la souris.

Je vous "invite" maintenant à effectuer des recherches plus poussé sur son utilisation, et vous laisse découvrir les joies de l'utilisation "kikoo" de la console !

Si vous avez besoin d’éclaircissement ou si vous remarquez une erreur, merci de m'avertir.

**éa, les amis.**
