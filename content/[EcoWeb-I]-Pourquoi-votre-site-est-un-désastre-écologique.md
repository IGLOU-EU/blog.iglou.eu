---
title: "[EcoWeb I] Pourquoi Votre Site Est Un Désastre Écologique"
date: 2022-10-12T12:56:28+02:00
tags: ["ecoWeb", "eco-conception", "web"]
---

{{% warning `Cette série "EcoWeb" ce concentrent sur les sites internet. Et ce, afin d'aider à prendre conscience de leur impact et de voir si il est possible de le réduire. Ces principes peuvent etre appliques aux intranet, webapp...` %}}

Dans cette premiere partie, nous allons aborder :
- Pourquoi et comment un simple site peut poluer.
- les choix a eviter, pour reduire son impact a l'international. 
Dans de prochains articles, nous verrons ce qui est a privilegier et les solutions disponibles.


# 🌳 Arrête de te mentir, ceci n'est pas un arbre !
_🎵 Rebond et taux de conversion, c'est comme ça qu'le web t'est bon._   
_🎶 Interactivité, cookies non désirés, c'est comme ça qu'y t'fait vibrer._   
_🎶 Générer du clic, conserver l'trafic, c'est comme ça qu'tu vois ton public._   

![Cette image coute de l'énergie](/images/mortetarbres.png "🫠 On va tous crever et t'y aura participé (et moi aussi)")

## 🪤 Une vérité qui dérange
**Quel que soit l'effort que vous ferez**, votre site aura toujours un impact négatif sur l'environnement. Il est primordial de réduire celui ci au maximum, pour eviter le desastre actuel.

>Ce ne doit pas être aussi catastrophique que ça, non ? _Après tout, vous n'êtes pas Facebook._   
> => **Quel naif !**

💸 Pour les plus veneaux de mes lecteurs, sachez que cela fait aussi economiser de l'argent 💸

## 📊 Etat des lieux statistiques
Nous allons faire un peu de matthematiques en nous basant sur les chiffres officiels. Toutes les sources sont indiquees par un numero de reference et retrouvables en bas de page.
Les chiffres fournis sont des moyennes, realisees entre 2016 et 2022. Afin de ne pas gonfler les resultats, je prendrais toujours l'entier inferieur.

### Nombre de personnes avec internet
Les chiffres de l'INSEE sont les suivants :
- En 2021, 93 % des ménages ont un accès à l'internet en France
- En 2016, la France compte 29,2 millions de ménages 
- En 2016, un ménages se comportent en moyenne 2,2 personnes (Ceux-ci sont de plus en plus petits, nous retiendrons donc une moyenne de 2 personnes par ménage et ne prendrons pas en compte la croissance de la population)

D'apres ces chiffres, nous avons 93 % de 29 millions de ménages.   
Donc (29 millions * 2 personnes) * 93 pourcent / 100 = 53.94, nous retiendrons l'entier inferieur, soit 53 millions de personnes connectées en France.

### Nouveaux sites d'entreprise au 4eme trimestre 2019
Francenum nous indique :
- En 2019, 69 % des TPE possèdent un site Internet et 84 % pour les PME
- La meme annee, au meme trimestre, il y a eu 365,8 milliers de nouvelles entreprises en France hors micro-entrepreneurs
  
Le probleme de ce dernier petit calcul, est qu'il n'est pas possible de savoir si ces entreprises seront des TPE, PME ou autres.
Nous allons prendre le pourcentage le plus bas, soit 69 %. Il faut garder en tete que le resultat n'integrant pas non plus les micro-entrepreneurs, il serat largement inferieur a la realite.

Donc 365 milliers * 69 pourcent / 100 = 251,85, soit 251 milliers de nouveaux sites pour ce trimestre 2019.

## 🌍 Pourquoi et comment un simple site peut poluer

La consommation de matière première et d'énergie pour l'utilisation d'un site se mesure en trois points :
- Le réseau, pour l'acheminement des données
- Le côté client, c'est-à-dire l'utilisateur
- Le côté serveur, l'infrastructure qui héberge et fournit le service

### Le réseau
Pour faire le lien entre l'ordinateur de l'utilisateur et le site, il faut passer par un réseau. Ce dernier a la charge de transporter les données, plus y il a de données, plus il doit etre complexe. Pour transporter une petite page de text, 56Kb/s etait suffisant en 1995. Ce qui n'est plus le cas de nos jours.

**Preparons une analogie simple**
- Une requete _(acheminement d'une ressource)_ est un vehicule.
- Le poids d'une requete est la taille de ce vehicule, cela peut etre un scooter _(100<Ko)_, une voiture _(1000<Ko)_ ou un poid lourd _(>1000Ko)_.
- Le nombre de requetes est le nombre de vehicules qui circulent.

Au debut des internets, de petites routes de campagnes, le temps passant, il a fallu construire des departementales, puis des autoroutes _(fibre optique, 5g ...)_. A chaque fois ce sont de nouvelles infrastructures qui ont ete construites pour eviter embouteillages et ralentissements. En plus du nombre de vehicule, nous avons aussi vu le poids de chacun d'eux augmenter, rivalisant dans notre analogie avec des poids lourds.

Actuelement, un site internet est en moyenne compose de 82 vehicules _(82 requetes)_, constitue d'un poid lourd, quelques voitures et une flotre de scooter _(pour un poid moyen de 2194.1 Ko)_. Cela fait beaucoup, et ne fait que croitre. Il est simple d'imaginer la polution latente, ce trafic permanent represente grossierement ce qui ce passe a chaque chargement d'une page web.

A titre de comparaison, mon site https://iglou.eu se compose de 6 vehicules _(6 requetes)_, 6 scooters _(117.25 Ko)_. Il y a 14 fois moins de vehicules et 19 fois moins lourd que la moyenne. Bien que je puisse etre fier de mon site, il n'est pas parfait, vous conaissez surement la fable du cordonier mal chaussé.

### Le côté client
**La création d'obsolescence**   
Oui, vous avez bien lu. Votre site participe, a son échelle, à créer de l'obsolescence parmi les dispositifs numériques. Contrairement au [1er site internet de 1990](http://info.cern.ch/hypertext/WWW/TheProject.html), il y a de fortes chances que le vôtre nécessite un ordinateur avec un processeur récent ET puissant. 

Un site, et de surcroît un navigateur internet, est tout sauf trivial. Il doit décoder des fichiers HTML, interpréter des mises en forme CSS et exécuter du code JavaScript. Ce sont des tonnes de calculs complexes, des ordinateurs de 5 à 10 ans peuvent peiner à exécuter cette complexite qui est exponentiel au fil des ans. Il devient ainsi primordial de renouveler constament son matériel, pour utiliser votre site.

**Pour quoi certains ordinateurs ont-ils dû mal à afficher une page web ?**   
Fut un temps où ils n'avaient aucun mal à le faire. Mais comme anoncee precedement, la complexite des sites est exponentiel au fil des ans. Avec un cout non négligeable en puissance, cela devient de plus en plus difficile à calculer et de plus en plus long.

**D'ou vient cette complexite ?**
Cette complexite ne veut pas dire de meilleurs sites. Elle est generalement originaire de decisions des **equipes de developpement**, ainsi que du **client**, a qui l'on a tendance a tout ceder afin de le satisfaire, meme si celui ci n'y connait rien (si non, il n'aurait pas besoin de developeurs).

Les equipes de developpement, ont tendance a inclure dans leurs projets des boites a outils (React.JS, AngularJS, Node.js...), generalement enormes pour etre pret a n'importe quel demande. Ces boites a outils sont souvent tres complexes, necessitent un apprentissage et un investissement important pour un developeur, il veut rentabiliser celui ci. C'est un peut comme, avoir une stock de pieces d'aviation et de monster truck, avoir apris leurs fonctionnement, et les utiliser pour de simple scooter. L'excuse va generalement tourner autour d'un "on sait jamais" ou "les ordinateur sont suffisament puissant pour que l'on puisse se le permettre".

Le client, lui, professionnel des demandes sogrenues. Plus d'animations (partout), changement des comportements par défaut des navigateurs, plus de tracking plus intrusif, chargement dynamique et defilement infini "pour faire classe" et vouloir les memes polices de caractères que dans son PDF. Veritable machine a obsolescence et createur de complexite avec force decisionelle.

Ironiquement, la grande majorité de ces changements INUTILES, apportent de nouvelles problématiques. Tel que, une consultation impossible pour les déficients visuels, une difficulté de concentration pour les personnes souffrant de troubles de l'attention, de lecture pour les personnes TSLA, ou encore divers problématiques de sécurités.

**Voila qui peut conclure la complexite de calcules, au quel doit faire face l'ordinateur ou le smartphone de votre visiteur.**

### Le côté serveur
**Veritable "Dack side of the web 🎵"**   
Cette partie n'est que tres rarement abordee pour les personnes non techniques. Pourtant, suivant la technologie mise en place, elle peut etre tres complexe et couteuse ecologiquement et financierement.   
Sur ces serveurs, s'effectue tous les calculs pour construire votre page et la fournir au client. Et suivant la ou les technologies mises en place, cela peut demander beaucoup de puissance.

**Nouvelle analogie**   
Pour illustrer mes propos, attardons nous sur une analogie culinaire

Bien souvent, par soucie de "simplicité" votre web devloppeur va mettre en place un CMS (wordpress, drupal, ...) 

**En realisant des test de performance** entre un site statique et WordPress.   
- Le site statique est le mien, trouvable a l'adresse https://iglou.eu.
- Un WordPress tout juste sorti de l'emballage, theme par defaut et article par defaut.
- Site vitrine WordPress d'un ancien client, theme sur mesure, plugins et optimisation.
- Resultat d'une optimisation THEORIQUE a 90%, du site vitrine WordPress.

Cela donne les chiffres suivants :
![Diagramme du temps de service entre static et worpress](/images/static_wp_time.png)
- **Site Static** : Ne necessitant pas de calcule, mon site a un temps de traitement de 0.1ms
- **WP Par Defaut** : Apres son installation, il ne contient que le theme par defaut et un article. Pas d'utilisateurs ou de plugins a calculer 



## Utile ou inutile ?

## 📚 Sources et définitions
{{% reflist 
"https://httparchive.org/reports/state-of-the-web?lens=top1m&start=2017_10_01&end=latest&view=list"
"https://www.insee.fr/fr/statistiques/2385835"
"https://www.insee.fr/fr/statistiques/4277630"
"https://www.francenum.gouv.fr/guides-et-conseils/strategie-numerique/les-chiffres-cles-sur-la-presence-sur-internet-des-tpe-pme"
"https://www.insee.fr/fr/statistiques/2015204"
  "HTML : HyperText Markup Langage, c'est le langage de balisage qui permet de structurer une page web. C'est le squelette de la page, il contient entre autre le contenu textuel."
  "CSS : Cascading Style Sheets, c'est le langage de mise en forme des pages web. Il permet de définir la taille, la couleur, la position, etc. des éléments HTML."
  "JS/Javascript : C'est le langage de programmation qui permet d'ajouter de l'interactivité aux pages web. Il permet de faire des animations complexes, des calculs, du tracking, etc."
  "Framework JS : Sont un ensemble de code qui "facilite" la création de nouveaux code. Il permet de "gagner du temps" et est très utilisé et répandu dans le monde du web."
  "Hover : Le fait de passer la souris sur un élément. Un hover sur un lien, par exemple, peut le faire apparaitre soulignée."
  "scroll : Le fait de faire défiler la page. Se fait généralement avec la molette de la souris, les touches directionnelles du clavier ou le doigt sur un smartphone. C'est un comportement par défaut du navigateur et accepté par l'ensemble des utilisateurs comme étant le comportement attendu."
  "scrollbar : La barre de défilement de la page. C'est un élément graphique qui permet se déplacer de haut en bas de la page. Il est reconnu par l'ensemble des utilisateurs."
  "TSLA : Trouble Spécifique du Langage et de l'Apprentissage. C'est un trouble du développement qui entraine des difficultés de lecture, d'écriture, de calcul, etc."
 %}}









- L'appareil qui permet de consommer le site (PC, smartphone, etc...), en passant par le réseau pour le recevoir (fibre, 4G, etc...) et enfin l'énergie nécessaire a son interprétation machine.
 : De l'appareil qui permet de fournir le site (serveur, stockage, etc...), en passant par le réseau pour le recevoir (fibre, 4G, etc...) et enfin l'énergie nécessaire a son interprétation machine.


