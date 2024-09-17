---
title: "[EcoWeb I] Pourquoi Internet Est Un Désastre Écologique"
date: 2023-04-17T12:56:28+02:00
tags: ["ecoWeb", "eco-conception", "web"]
---

{{% warning `Cette série “EcoWeb” se concentre sur les sites internet. Et ce, afin d’aider à prendre conscience de leur impact et de voir s'il est possible de le réduire. Ces principes peuvent être appliqués aux intranet, webapp…` %}}

# 🌳 L'arbre qui cache la foret de serveur !

_Sur l'air de C'est ton destin"_  
_🎵 Eh les dev, eh l'client, dans les CMS_  
_🎶 Ton web c'est pas propre_  
_🎶 Ton web c'est tres moche_  
_🎶 Alors prends ton clavier_  
_🎶 Si tu sais coder, si tu sais coder_  
_🎶 Prends, prends, prends ton clavier, si tu sais coder_

![Une foret de serveur, image libre de droit](/images/pourquoi-internet-est-un-désastre-écologique.jpg "🫠 Ho regarde comme il est beau ce Dell sauvage !")

## 🪤 Une vérité qui dérange

**Quel que soit l'effort que vous ferez**, votre site aura toujours un impact négatif sur l'environnement. Il est primordial de réduire celui-ci au maximum, pour limiter le désastre actuel. Cette démarche s'inscrit dans un effort global de notre mode de vie sur Terre.

> Ce ne doit pas être aussi catastrophique que ça, non ? _Après tout, vous n'êtes pas Facebook._

💸 Pour les plus vénaux de mes lecteurs, sachez que cela peut aussi faire économiser de l'argent 💸

## 📊 État des lieux statistiques

Nous allons faire un peu de mathématiques en nous basant sur les chiffres officiels. Toutes les sources sont retrouvables en bas de page.
Les chiffres fournis sont des moyennes, réalisées entre 2016 et 2022. Afin de ne pas gonfler les résultats, je prendrai toujours l'entier inférieur.

### Nombre de personnes avec internet

Les chiffres de l'INSEE sont les suivants :

- En 2021, 93 % des ménages ont un accès à l'internet en France
- En 2016, la France compte 29,2 millions de ménages
- En 2016, un ménage se comportent en moyenne 2,2 personnes (Ceux-ci sont de plus en plus petits, nous retiendrons donc une moyenne de 2 personnes par ménage et ne prendrons pas en compte la croissance de la population)

D'après ces chiffres, nous avons 93 % de 29 millions de ménages.  
Donc (29 millions _ 2 personnes) _ 93 pourcent / 100 = 53.94, nous retiendrons l'entier inférieur, soit 53 millions de personnes connectées en France.

### Nouveaux sites d'entreprise au 4ᵉ trimestre 2019

Francenum nous indique :

- En 2019, 69 % des TPE possèdent un site Internet et 84 % pour les PME
- La même année, au même trimestre, il y a eu 365,8 milliers de nouvelles entreprises en France, hors micro-entrepreneurs

Le problème de ce calcul est qu'il n'est pas possible de savoir si ces entreprises seront des TPE, PME ou autres.
Nous allons prendre le pourcentage le plus bas, soit 69 %. Ce résultat est à prendre avec des pincettes, ne disposant pas de suffisamment d'informations pour le lisser.

Ainsi 365 milliers \* 69 pourcent / 100 = 251,85, soit 251 milliers de nouveaux sites pour ce trimestre 2019.

### Comment cela se passe dans le monde

À un niveau mondial, Netcraft qui surveille le web depuis 1995, indique qu'en mars 2023 il y avait 1,116 milliards de sites web. Tous ne sont pas actifs, beaucoup n'ont jamais eu une seule mise à jour de leur contenu et n'en auront jamais. Toujours d'après Netcraft, moins de 30 % des sites sont considérés comme actif (1 116 018 952\*30/100), ce qui nous donne 334 805 685 sites actifs.

Ces sites, il y a plusieurs façons de les concevoir, la plus connue de nos jours est l'usage d'un CMS. Il en existe énormément, les principaux sont les suivants :

- Wordpress à 43%
- Wix à 10%
- Progress Sitefinity à 4%
- Squarespace à 3%

Il n'est pas toujours possible de connaître l'outil qui fut utilisé pour produire un site internet. Les statistiques sur les CMS sont réalisés sur un échantillon de "seulement" 78 millions de sites. C'est un peu grossier, mais le boom des CMS datant d'il y a plus de 10 ans, il est possible d'extrapoler les pourcentages sur le nombre de sites actif.

## 🌍 Comment un simple site pollue

La consommation de matière première et d'énergie pour l'utilisation d'un site se mesure en trois points :

- Le réseau, pour l'acheminement des données
- Le côté client, c'est-à-dire l'utilisateur
- Le côté serveur, l'infrastructure qui héberge et fournit le service

Des sites, il en existe de toutes sortes. De la vente en passant par le streaming à la petite vitrine. Les besoins ne sont pas les mêmes, ils ne vont pas être aussi simples, ni nécessiter les mêmes techniques d'optimisation. En règle générale, plus on en fait, plus il y a de code, plus cela va être un enfer pour les dev, l'impact sur notre monde et les coûts financiers.

Dans le prochain article, nous aborderons l'impact du "réseau" et du côté client, comment le mesurer, les outils et leurs limites.
Les chiffres vus dans cette introduction nous permettrons de mettre en perspective les impacts cumulés et comprendre la nécessité de limiter la consommation du moindre petit site.

## 📚 Sources et définitions

{{% reflist
"https://httparchive.org/reports/state-of-the-web?lens=top1m&start=2017_10_01&end=latest&view=list"
"https://www.insee.fr/fr/statistiques/2385835"
"https://www.insee.fr/fr/statistiques/4277630"
"https://www.francenum.gouv.fr/guides-et-conseils/strategie-numerique/les-chiffres-cles-sur-la-presence-sur-internet-des-tpe-pme"
"https://www.insee.fr/fr/statistiques/2015204"
"https://news.netcraft.com/archives/2023/03/23/march-2023-web-server-survey.html"
"https://www.netcraft.com/active-sites/"
"https://trends.builtwith.com/cms/traffic/Entire-Internet"
 %}}
