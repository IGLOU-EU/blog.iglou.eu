---
title: "Avoir un profil certifié sur Mastodon"
miniature: /images/avoir-un-profil-certifie-sur-mastodon_img-1.jpg
description: Petit guide et explication sur la certification de profil et son importance sur Mastodon.
date: 2022-11-18T18:34:21+02:00
tags: ["mastodon", "social"]
notes:
  - "[Aide de mastodon en francais](https://mastodon.help/fr)"
  - "[Partie head en HTML](https://developer.mozilla.org/fr/docs/Web/HTML/Element/head)"
  - "[Lien dans WordPress](https://wordpress.com/fr/support/editeur-wordpress/liens/)"
  - "[Modifier le header Wordpress](https://www.ionos.fr/digitalguide/hebergement/blogs/modifier-un-header-dans-wordpress/)"
  - https://docs.joinmastodon.org/user/profile/
---

# 🎤 Tu Vas Au Mastodon ?
_Mon pote est mort de Musk_   
_D'toute façon y m'gonflait_   
_Voulait jamais d'la liberté_   
_Y savait que r'vendre des données_   
_Et ses utilisateurs un peu con_   

_Alors j'l'ai enterré_   
_Pi j'suis allé poueter_   
_Avec des potes libérés_   
_Dans une instance pas du tout privée_   
_Et j'ai rien regretté_   
_Mais alors rien du tout !_   

![Image de presentation](/images/avoir-un-profil-certifie-sur-mastodon_img-1.jpg "Crédit : Christopher Mineses/Mashable – Mastodon<br><br>🧚‍♀️ L'écrasant poids de la liberté 🎱")

## λ Rise and shine Mr.Mastodon
Si vous arrivez sur ce post, c'est que, logiquement, vous connaissez déjà Mastodon. Donc pas besoin d'en expliquer le fonctionnement ou de tomber dans un débat sur la propriété des données, le logiciel libre, etc ... Et encore, j'utilise le mot débat, mais le mot monologue serait plus approprié.

En gros Mastodon c'est cool, Fediverse est une tuerie et plus particulièrement ActivityPub qui est clairement le futur ! 😍

_Entre nous, je ne crois pas réellement à la mort de Twitter. Mais à un engouement temporaire pour une alternative. Le fait que cette alternative soit décentralisée et issue du logiciel libre, me fait penser que l'engouement sera d'une courte durée en faveur de TwitterReborn ou un nouveau service propriétaire._

## 🪪 Pourquoi avoir un profil certifié ?
Il y a deux types d'attaques auquel un utilisateur de Mastodon peut être confronté et qui sont en rapport avec la certification de profil. Dans le milieu de la programmation, elles portent le nom de  `Dependency Confusion Attack` et `Typosquatting`. En gros, ces attaques consistent à usurper l'identité d'une dépendance (ici un utilisateur) en usurpant son nom. Ce qui créer une confusion.

### Possible sur Mastodon ?
L'une des plus grandes forces de Mastodon est son système de fédération de contenue, chaque branche est indépendante l'une de l'autre. C'est aussi son principal défaut pour usurper une identité. 

Imaginons : 
- je suis vendeur de moutons, mon compte est sur `mastodon.social`, au nom de `@rickdeckard@mastodon.social`
- Sur ce compte, je partage des photos de moutons avec des liens d'achat, etc ...
- Une personne malveillante voudrait usurper mon identité, en créant un compte sur `mastodon.xyz` et se nomme `@rickdeckard@mastodon.xyz`
- Ainsi toutes les futures personnes qui voudront suivre `@rickdeckard` ne sauront pas différencier le vrai compte du faux.

Cela ouvre un éventail de vecteurs d'attaques relativement important. Il est clair qu'il peut etre utilisé pour des campagnes de phishing, de spam, etc ... Il est possible de vérifier la date de création du compte, mais cela ne garantit pas que le compte est celui de la personne en question.

## 📝 Avoir un profil certifié ?
Pour pallier à ce problème sans toute fois le résoudre totalement, Mastodon dispose d'un système de certification de lien. Cela permet de vérifier que le lien entre un utilisateur et un domaine est bien celui de l'utilisateur.

Si l'on a le choix entre plusieurs personnes qui se nomment `@Mediapart`, comment identifier le compte officiel ? Mediapart a forcément les droits sur son site `mediapart.fr`, ce qui lui permettrait d'afficher sur son profil que le lien vers son site lui appartient effectivement. Ainsi, nous pouvons savoir que le compte est bien l'officiel de Mediapart.

Contrairement aux grands groupes qui se "permettent" de réclamer des papiers d'identité et/ou de l'argent, les instances Mastodon ne peuvent pas le faire. Cela requerraient des moyens financier et humains, ainsi qu'une morale douteuse. Il est fort probable que de nouvelles procédures de "certification" voient bientot le jour.

#### Quel type de modification ? 
Mastodon vérifie la légitimité de la cible en cherchant sur la page un "lien" de type `rel="me"`. Il propose de mettre en place un `<a>`, mais il est aussi possible, de l'ajouter sous forme de balise link dans le header. J'ai personnellement choisi cette dernière.

- Via un lien : `<a rel="me" href="https://[INSTANCE MASTODON]/@[NOM D'UTILISATEUR]">[NOM DU LIEN]</a>`
- Via le header : `<link rel="me" href="https://[INSTANCE MASTODON]/@[NOM D'UTILISATEUR]">`

_Voir le bas de page pour des tutoriels, ajouter le lien sur votre site internet ou votre header._

#### Ajouter le lien sur votre profil :
![Indication visuelle du site mastodon](/images/avoir-un-profil-certifie-sur-mastodon_img-2.jpg "Modifier le profil")
- Cliquez sur le bouton **Modifier le profil**

![Indication visuelle du site mastodon](/images/avoir-un-profil-certifie-sur-mastodon_img-3.jpg "Métadonnées du profil")
- Dans la section **Métadonnées du profil**, ajoutez le lien vers votre site internet
  - La partie **Étiquette** est le nom du lien
  - La partie **Contenu** est l'URL de votre site internet
- Cliquez sur **Enregistrer les modifications**

![Indication visuelle du site mastodon](/images/avoir-un-profil-certifie-sur-mastodon_img-4.jpg "Mon profil")
Une fois fait, Mastodon va vérifier automatiquement que le lien vous appartient. Si c'est le cas, le lien sera affiché en vert sur votre profil.


**À plus dans l'bus**