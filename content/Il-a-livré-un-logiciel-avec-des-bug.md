---
title: "Il a Livré Un Logiciel Avec Des Bug"
date: 2022-08-01T23:23:26+02:00
tags: ["programmation", "freelance"]
---

{{% warning `Article a l'attention des clients en prestation informatiques. À lire avec des capacités minimales d'autodérision.` %}}

# 👾 Mon développeur freelance livre des bugs et n'assume même pas
_Et dire que j'ai payé ce logiciel presque aussi cher qu'un préparateur Mcdo_

![Merci à Benjamin Daniel (alias Benzaie) pour cette illustration](/images/mais-enfiiin-jean-claude.gif "Attendez, mais je suis payé pour faire ça moi ? 💸")

Soyons sérieux, même si je n'en ai pas l'habitude... Comme toutes personnes sérieuses, j'aime annoncer des évidences.   

Si vous payez votre prestataire à un cout inférieur à ce qui se pratique dans son pays, il ne lui sera pas possible de faire son travail correctement. De prendre le temps nécessaire à peaufiner, tester son code, et le rendre dans un état attendu. Tout aussi évident, le pays d'un prestataire ne définit pas ses compétences. Il y a de très bons développeurs, partout dans le monde et donc des prestations à tous les prix.   

L'assistance et la hotline ne font généralement pas partis des projets au "forfait". Ou en de très rare cas et toujours à un coup supplémentaire non négligeable, ainsi que des répercutions sur le droit d'exploitation du code.

## 💸 Qu'est-ce qu'une commande au "forfait" ?
Il faut savoir qu'il existe globalement deux types de prestations, nous allons voir lesquelles par la suite.   
Et en tant qu'indépendant, ~50% du solde de la commande est destinée aux impôts, taxes, etc.

### La prestation en régie 🦸🏼‍♀️
Ce type de prestation n'est pas du tout le sujet de cet article, principalement dû au fait que l'on n'y rencontre pas les mêmes problématiques.   
Une forme proche du salariat déguisé, n'ayons pas peur des mots et ne nous mentons pas. Je l'apprécie cependant, tout comme le commanditaire. Elle permet, en ce qui me concerne, de conserver la liberté de choix de l'indépendant, tout en ayant une situation "fixe". Et pour lui de me remercier à tous moments 😅

En 4 points cela donne:
- Facturation au temps de travail (sur base d'un TJM{{% ref `0` %}})
- TJM de 277€/jours pour un junior front-end a +1010€/jours pour un senior{{% ref `1` %}} (principalement data-scientist et cybersécurité)
- On est là pour aider au mieux le client à réaliser ses objectifs
- Pas d'obligation de résultats, s'opère principalement en mode agile

En France, un développeur a moins de 250€/jours, n'est pas forcément mauvais, il peut simplement creuver la dalle et désespérer de trouver un client.   
Si vous payez un indépendant moins de 140€/jours, cela représente net un salaire inférieur à un serveur McDonald's en France{{% ref `2` %}} ...

### La prestation au "forfait" 🥷🏼
Annoncer une question pour répondre 3 paragraphes plus loin. Il y en a qui abusent vraiment de votre temps !

L'idée, est que le client dit ce qu'il veut, le prestataire réalise un devis avec une date de livraison. Il y a une obligation de résultats, et de test de son code, un objectif final, possible demande de pénalités de retard de livraison, prix ferme… Tout est beau dans le meilleur des mondes. Non, bien sûr que non, il y a souvent des extensions de devis, car le client change d'avis, des retards pour diverses raisons (y compris le client qui ne donne pas les infos requises)...

Il est très rare que ces prestations intègrent de l'assistance ou de la hotline et encore moins inclus à vie 😉 Habituellement, la solution est livrée avec un manuel et/ou de la documentation, une période de rodage/test pendant laquelle le client DOIT valider le bon fonctionnement et le respect de sa demande, ainsi qu'une période durant laquelle le prestataire s'engage à corriger les bugs. Cependant, les clients ont la fâcheuse tendance à ne tester qu'après la mise en production{{% ref `3` %}}, trouvent des "bug" que 1 à 2 ans après la livraison, et les "bugs" en sont rarement de vrais. À maintes reprises, j'ai eu des appels ou des e-mails pour en signaler un, alors que le problème se trouvait manifestement entre son ordinateur et sa chaise.

Je résumerai ces prestations ainsi :
- Date de livraison
- Période de garantie
- Obligation de résultats (qui ne veut pas dire sans bug)
- Frais fixes, pas de surprise, c'est sur devis OBLIGATOIRE (en France)

Pendant cette période, le ou les prestataires sont libres de travailler comme et quand ils le veulent, temps que la date de livraison est respectée. Il n'y a pas et ne doit pas avoir de relation du type travailleur-employeur. C'est dans ce cadre que l'indépendant est le plus libre, selon moi, et donc ainsi ma forme de prestation favorite.

## 🗺 Pourquoi payer plus cher, si je peux avoir la même qualité plus loin 
C'est vrai à 100% ! Il est tout à fait envisageable de travailler avec des personnes en Inde, Chine, et d'autres pays où le prix de la vie est différent. Cela n'entache en rien les capacités de travail de ces populations.

Cependant, il est plus simple de se faire avoir par un prestataire que vous ne pourriez pas assigner en justice. Qui n'est pas dans l'obligation de se soumettre aux lois Européennes ou Françaises. Il est aussi possible d'avoir des problèmes de communication et d'incompréhension (seulement 28% de Français bilingue{{% ref `4` %}} ...) ou de fuseau horaire. `On avait dit le 12 janvier 13h UTC+1 pour la reunion ? A moins que ce ne soit le fuseau horaire du prestataire a Noumea, en UTC+11.`   
J'ai déjà eu ce genre de problème, et encore, avec des Anglais, donc uniquement une heure de différence.

Dernière problématique, la RGPD et l'exportation des données personnelles. Il est possible que votre demande fasse l'objet d'un traitement de données personnelles, et qu'il soit donc interdit{{% ref `5` %}} de les faire sortir du pays d'origine.

## 🐞 Qu'est-ce qu'un bug ?
Dans son livre Design of Design{{% ref `6` %}}, Frederick Brooks définit que `la présence de bugs dans les logiciels n'est pas un accident, mais est due à la nature même des logiciels, autrement dit, il existe des bugs dans les logiciels parce que ce sont des logiciels.`

Un bug est une erreur dans un programme duquel peut découler un dysfonctionnement plus ou moins grave.
- Plantage (arrêt inattendu) du programme, voir de la machine 
- Des pertes d'informations (données, fichiers, etc)
- Mises en danger divers (explosion, fuite, mort...)

On peut classer les bugs en trois catégories:
- les mineurs (les plus courants, leurs corrections n'est pas toujours souhaitable)
- les majeurs (on en trouve toujours dans de sombres recoins du code)
- les critiques (ne devrait pas arriver en production)

Dans le Kernel Linux, il y a une moyenne de 1 bug toutes les 5 000 lignes de code{{% ref `7` %}}. Sur 985 identifier, 259 mineurs, 627 majeurs et 100 critiques et non Windows ou OsX ne font pas mieux. On estime un maximum de 20 bugs pour 1000 lignes de code pour un logiciel commercial. Un logiciel comme WordPress comporte 346 000 lignes de code{{% ref `8` %}} et sa dernière version majeure corrige pas moins de 1000 bugs{{% ref `9` %}}.

Les bugs mortels ont tendance à se raréfier, grâce à de plus en plus de soin, de tests et de nouvelles approches dans la conception des logiciels. Mais même les plus grosses entreprises peuvent y faire face. En 2009, la Lexus ES350{{% ref `10` %}} pouvait d'un seul coup accélérer à 150km/h en désactivant le système de freinage. Le funeste résultat en fut + de 300 morts.

## 🐛 Je ne veux pas de bug dans mon projet 
Réponse plus que simple a cette affirmation → `Alors autant ne pas faire ce projet`

Il est "impossible" et contre-productif de chercher à produire un logiciel qui ne contient pas de bug. D'autant plus sur les bugs mineurs, qui peuvent être extrêmement long à corriger pour un résultat proche de l'inutile. À moins que votre entreprise soit, bien entendu, dans un secteur particulièrement à risque (et encore, comme vu plus haut, cela ne va pas en empêcher).

Pour corriger un bug, il faut déjà le trouver, pour le trouver, il faut le reproduire, et pour le reproduire, il faut suffisamment d'informations sur le moment où le bug a été détecté. Informations qui sont généralement fournies par des utilisateurs, et donc sont floues, voire erronées et difficiles à interpréter.

## 📚 Sources et définitions
{{% reflist 
    "TJM = taux journalier moyen, montant facturé au client pour une journée de prestation"
    "[Tarif jour moyen](https://www.malt.fr/t/barometre-tarifs/tech)"
    "[Salaire McDonalds](https://fr.indeed.com/cmp/McDonald's/salaries)"
    "[Définition d'une mise en production](https://www.cerfi.ch/fr/Actualites/5-4-3-2-1-Mise-en-Prod.html)"
    "[Rapport ifop](https://www.ifop.com/publication/les-francais-et-leur-rapport-a-la-langue-anglaise/)"
    "[Mise en conformité CNIL](https://www.cnil.fr/fr/transferer-des-donnees-hors-de-lue)"
    "[Design of Design](https://isbnsearch.org/isbn/0201362988)"
    "[Nombre de bugs](https://www.wired.com/2004/12/linux-fewer-bugs-than-rivals/)"
    "[Informations WordPress](https://wordpressfoundation.org/projects/)"
    "[Note de version WordPress 6.0](https://wordpress.org/news/2022/05/arturo/)"
    "[Bug mortel chez Toyota](https://www.washingtonpost.com/business/economy/toyota-reaches-12-billion-settlement-to-end-criminal-probe/2014/03/195738a3c4-af69-11e3-9627-c65021d6d572_story.html)"
 %}}



**À plus dans l'bus**