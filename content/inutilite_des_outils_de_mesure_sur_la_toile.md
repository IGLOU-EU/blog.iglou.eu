---
title: "Pourquoi Matomo ne devrait pas être votre alternative à Google Analytics"
miniature: "/images/gargantua_eat_computer.png"
description: "Explorons l'histoire des statistiques web, les informations qu'elles recueillent et pourquoi les outils de mesure statistiques sur la toile sont souvent inutiles."
date: 2023-04-27T15:25:53+02:00
tags: ["analytics", "rgpd", "statistiques web"]
notes:
    - "[Format de journalisation](https://goaccess.io/man#custom-log)"
    - "[Matomo (Piwik)](https://matomo.org/)"
    - "[Google Analytics](https://fr.wikipedia.org/wiki/Google_Analytics)"
    - "[Journalisation apache](https://httpd.apache.org/docs/2.2/logs.html#accesslog)"
    - "[NCSA HTTPd](https://web.archive.org/web/20090713225951/http://hoohoo.ncsa.illinois.edu/)"
    - "[Le projet Goaccess](https://goaccess.io/)"
    - "[La demo Goaccess](https://rt.goaccess.io/?20230331192652)"
    - "[Le projet AWStats](https://www.awstats.org/)"
    - "[Proposition pour rendre plus beau AWStats](https://github.com/eldy/AWStats/issues/233)"
    - "[Principe KISS](https://fr.wikipedia.org/wiki/Principe_KISS)"
    - "[Adoption d'une recommandation relative à la journalisation](https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000044272396)"
    - "[Article 5 RGPD](https://gdpr-text.com/fr/read/article-5/)"
---

# 📊 De l'inutilité des outils de mesure statistiques sur la toile
_🎵 Même s'il se lève tôt, sortir de Google_   
_🎶 En perpétrant son forfait, nul ne perçoit son méfait_   
_🎵 Déployant son Matomo, rester aveugle_   
_🎶 Gargantua encore pourra, digérer nos âpre data_   

![Représentation satirique de Gargantua mangeant un ordinateur](/images/gargantua_eat_computer.png "Gargantua n'a jamais fait d'aussi bon repas")

## 🥸 Vous avez dit Analytics ?
Petites data prospères, emmagasinées et stockées, une accumulation obsessionnelle de statistiques personnelles à des fins non définies ! Depuis la mise en place de la réglementation RGPD, Google Analytics a pris du plomb dans l'aile. La fin de cette hérésie de la récolte statistique du côté client, semblait vivre ses dernières heures pour le commun des mortels. Rien ne pouvait me rendre plus joyeux en cet instant. Nous l'avions vu dans un précédent article, moins de 30% des sites sont actifs et mis à jour par leur propriétaire, imaginez le peu de personnes ayant un attrait autre, qu'une curiosité passagère pour les statistiques de visites de leur site. La vision quand bien même agréable de ces graphiques in-intuitif aux demeurant et peu parlant, pour qui n'est pas du métier de l'analyse SEO. Nous avons donc, un gadget, qui, pour une grande majorité, n'aura aucune utilité.

Mais les mauvaises habitudes ont la vie dure, il n'en fallut point plus pour que du monde eut envie de se rabattre sur des alternatives, comme le logiciel libre Matomo. N'allez pas vous imaginer que je ne connais pas le sujet, j'eus a déployé Piwik et étudié son code PHP, puis à nouveau quand il changeât de nom pour Matomo. Comme beaucoup, mes armes furent forgées sur Google Analytics, immondice sortie d'insondables profondeurs, fuis à grande vitesse, car depuis toujours, fervent défenseur du logiciel libre.

Pratiquant de la sainte doctrine KISS (keep it simple, stupid), j'ai toujours eu à cœur de chercher le plus simple moyen d'effectuer une tâche. Et je dois vous avouer, très honorables lecteurs et lectrices, que de déployer un logiciel, dont il faudra maintenir le service, payer l'hébergement et ajouter une couche JavaScript sur chaque page cible, le tout dans des langages de script (PHP et JavaScript), n'est certes pas la méthode la plus simple, mais pas non plus l'une des plus intellectuellement productive.

## 🕰 À l'origine
Il y a bien longtemps, dans un internet oublié de tous, vivait NCSA HTTPd. L'un des premiers, si ce ne fut LE premier serveur web. Avec lui naquirent vers **1993** les prémices de "Common Log Format", un format de fichier texte permettant de conserver les traces des "demandes utilisateur". Avec le temps, il y eu de nouveaux formats comme le "Extended Log Format" qui permet de conserver encore plus d'informations dudit utilisateur.

Voyons un peu une partie de ce qui peut et est enregistré dans ces dits "logs" lors d'une visite d'un outil en ligne :
- Date et heure de la visite
- Adresse IP du client (utilisateur) qui effectue la visite
- Chemin de l'URL (adresse du site web) visité
- Méthode de la requête (GET, POST, etc.)
- Code de statut HTTP (ex: 200 OK, 404 Not Found)
- Navigateur et système d'exploitation utilisés par le client
- Informations sur la connexion TLS (type de chiffrement utilisé, etc.)
- Informations sur le MIME-type du contenu de la page
- Référence HTTP (si une autre page a dirigé le client vers cette page)
- Informations sur le cache de la page
- Requête HTTP complète envoyée par le client (méthode, URL, version HTTP, etc.)
- Informations sur l'utilisateur (si fourni via l'authentification HTTP)
- ...

Ces informations, sont enregistrées en une unique ligne par requête (échange avec le service). En cette belle année de 1993, alors que Braer prenez le temps de faire connaissance avec les fonds marin, les statistiques web, elles, apparaissaient à la surface de nos vies.

## 💡 Et la lumière fut
Dans vos cerveaux, partiellement embrumés de méconnaissance, vient probablement de s'allumer la lumière de la compréhension. **OUI MES AMIS**, il était déjà possible, en 93, d'ériger des statistiques de visites, des "Suivi de campagne", des "Données de conversion"... Incroyable n'est-il pas ? Question rhétorique, ne répondez pas.

Afin d'exploiter cette puissance, plusieurs logiciels sont venus au monde. Enfantés par des cercles d'érudits ou d'adolescents dans leur grenier. Comme le célèbre AWStats de la révolution 2000 ou le sublime Goaccess de 2010. Ils ne sont généralement pas limités à la seule étude statistique des sites internet. Offrant, bien souvent, l'avantage de la non-gloutonnerie, en permettant la génération de compte rendu statique, ne nécessitant aucun recours à de complexe ressources. Nous verrons l'incommensurable avantage de ces systèmes dans l'épisode 3 de "Ecoweb", une délicieuse aventure à découvrir entre Chalands.

Mais alors, me direz-vous, pourquoi tout ce "nouveau" farda, augmentant de façon exponentielle l'impacte de nos technologies numériques en ligne ? Pourquoi déployer ces autres services et prendre la peine d'ajouter des codes complexe et lourd sur vos sites ? 

Entendez bien et imaginez, s'il vous plaît, un monde dons la domination de Google est quasi totale et exclusive. Entendez la nouvelle de ce colosse qui en 2005, lance son "Google Analytics", outil "R.É.V.O.L.U.T.I.O.N.N.A.I.R.E" qui, en plus de fournir des statistiques, permettait à ce monstre, cette abomination non naturels, d'avoir un suivi complet de vos utilisateurs, leurs habitudes et vous promettait, en échange, un bonus sur votre référencement. L'habitude et la dépendance faisant leur office, distillant leurs poisons dans les esprits faibles, ont donné la situation abracadabrantesque actuelle.

## 🛠 Mise en pratique
N'abordons point la pratique des élitistes, ceux-là n'ayant en aucun cas besoin de ma connaissance afin d'exploiter là leur, en fichier de journalisation et outil comme Goaccess ([dons la talentueuse démonstration se trouve ici](https://rt.goaccess.io/?20230331192652).

Pour vous autres, par ma barbe, vous disposez probablement de ce que nous avons coutume de nommer "hébergement mutualisé". Bien aimable, ceux-ci ont tendance à fournir un outil de visualisation intégré à l'hébergement. AWStats, un choix répandu, malgré sa désuète interface, fournira toutes informations nécessaires. Voyez cette délicate illustration, artiste début 21ᵉ, représentant l'outil en question, dans son environnement naturel.

![Capture d'ecran du lien AWStats sur un cPanel](/images/awstats_icon.png)

![Capture d'ecran de l'interface AWStata... moche](/images/awstats_example.png "Exemple des plus parlants")

À cette vision, j'en vois, blêmissant et désireux de retrouver l'art et l'UX de concurrents. Réaction compréhensible, mais bien mal avisé, comme nous l'avons vu, l'effort, le cout et la puissance de calcule global, n'est pas comparable. Remarquez, logiciel libre aidant, proposez vos compétences pour l'évolution visuelle du produit, un ticket fut ouvert pendant la rédaction de cet article par votre serviteur, [suivez le lapin blanc](https://github.com/eldy/AWStats/issues/233).

Point n'étant un tuto ~~beauté~~, mais bien une présentation à l'alternative de complexe déploiement, se perdre en plus de palabres n'a aucune pertinences. Sachez cependant deux choses.
- Les "access log" sont bien souvent disponibles au téléchargement, potentiellement perdu dans les méandres de sous menus ou d'architectures de fichiers via FTP
- L'indiscrétion quant au comportement de l'utilisateur sur sa page (données de comportement utilisateurs) n'est pas possible. Quoique... Cela pourrait être le sujet d'un fascinant article de détournement.

## 👮‍ Que dit la CNIL
Les journaux de nos aimables serveur web doivent être conservés pour une durée de 5 ans, mais point de consultation autorisée au-delà de 1 an, hors ordonnance de justice.

Bien que ces réglementations soient issues d'une louable démarche sur le respect de notre vie privée. Elles ne sont pas tenables. Demanderait à toutes personnes disposant d'un site ou autres outils en ligne de savoir précisément où, quand, comment et sur combien de temps sont stockés ces informations. Pour les 1,116 milliards de sites web, cela me semble irréaliste. Ou alors, il serait nécessaire d'interdire au quidam la possession d'un outil en ligne et de ce fait restreindre sa liberté de présence et d'expression. De plus, vous n'avez sûrement aucun droit de gestion sur ces fichiers.


**À plus dans l'bus**
