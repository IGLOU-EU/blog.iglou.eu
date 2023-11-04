---
title: "[Alpha I] Reverse Proxy Sur Hébergement Mutualisé"
description: "Du reverse proxy pour code arbitraire sur hébergement mutualisé"
miniature: "/images/865675824.jpg"
date: 2022-04-07T00:42:19+02:00
update: 2023-11-04T13:52:46+01:00
tags: ["alpha", "serveur", "hébergement mutualisé", "niveau:intermédiaire"]
notes:
    - "[rewrite flag P](https://httpd.apache.org/docs/trunk/fr/rewrite/flags.html#flag_p)"
    - "[reverse proxy en PHP](https://github.com/michaelfranzl/no.php/blob/master/no.php)"
---

{{% warning `Cette série "Alpha" tourne autour du thème de l'exécution de code
non prévu par les fournisseurs d'hébergement mutualisé. Et ce, affin de passer
outre les limitations comme le support de langages de script ou binaires` %}}

# 🎤 Viens chez mon :27039, j'habite chez :443
_Sur les bords au milieu, c'est vrai qu'je crains un peu._

![Elle mate :27039, et elle fait bien](/images/865675824.jpg "Comment elle mate mon :27039 depuis son :443 😱")

Il y a de cela fort longtemps, je me suis focalisé sur les langages de script,
et plus particulièrement PHP. Ce choix fut principalement orienté du fait que
je pensais, naïvement, qu'elle était la seule techno permettant de profiter des
hébergements mutualisés. Mais avec l'âge vient la sagesse, et après maintes
dépenses en serveurs dédiés pour faire tourner diverses applications. Je connais
le Kung-fu !

Il serait probablement bien plus raisonnable de commencer cette série "Alpha" par
l'exécution de code ou logiciel qui ne sont pas officiellement disponibles...
Mais j'avais la blague du matage de :27039 depuis :443 en tête, et j'en suis 
fier, même si je ne devrais pas.

> PS: _Attention, de l'ironie est susceptible de s'être glissée dans mes lignes._

## Reverse proxy dans ton .htaccess
Je ne sais pas si vous avez déjà entendu parlé d'un fichier du nom de 
`.htaccess`. C'est un fichier très peu utilisé, et très peu répandu sur les
hébergements mutualisés 😏 Celui-ci, quand il est supporté, permet un tas de 
choses sympas vu qu'il permet de modifier la configuration du serveur au niveau du
répertoire courant. C'est notamment lui qui permet d'avoir du `Pretty URLs`.

Tiens, cela tombe bien de parler des jolies URL, car pour notre reverse proxy,
nous allons utiliser le même mécanisme. Il y a donc de très grandes chances que
cette méthode fonctionne pour tous, `mod_rewrite` étant "toujours" disponible.

Mettons l'hypothèse suivante, nous disposons d'une app locale écoutant sur
`127.0.0.1:27039`, et nous désirons "rediriger" tout le flux arrivant vers celui-
ci. Attention, c'est vraiment complexe, accrochez-vous bien les yeux.
```apache
    RewriteEngine on
    RewriteRule ^(.*)$ http://127.0.0.1:27039/$1 [P]
```

Restons sérieux, je vais tout de même prendre le temps de détailler. 
- `RewriteEngine on` Activation du rewrite engine...
- `RewriteRule ^(.*)$ http://127.0.0.1:27039/$1 [P]` THE MAGIC ~~WAND~~ LINE 🪄
 - `^(.*)$` Attraper l'URL de la requête initial
 - `http://127.0.0.1:27039/$1` Redirection vers notre port local en y ajoutant
   la requête initiale
 - `[P]` La partie la plus importante, c'est un 'rewrite flags' qui veut dire
   proxy [la documentation des flags](https://httpd.apache.org/docs/trunk/fr/rewrite/flags.html#flag_p)

Il me semblait qu'il était possible, fut un temps, d'utiliser cette même 
technique pour taper directement dans un Unix Socket, via RewriteRule et une 
URI type `unix:`, cela ne semble plus possible (malheureusement pour nous). 
La seule solution pour exploiter un Socket avec apache serait ainsi de 
passer via une instruction `proxypass`, mais celle-ci n'est pas disponible 
via .htaccess.

{{% warning `Pour exploiter le Rewrite, le serveur doit mettre à disposition
'mod_rewrite', mais aussi 'mod_proxy' pour le flag P|proxy` %}}

## Reverse proxy dans ton PHP
Il est ironique de passer par un langage de script pour exploiter du natif,
voire traumatisant pour certains (dont moi).

Un proxy, basiquement, a pour seule mission de transférer les informations reçues
sur un point A vers un point B. Il est possible de faire cela avec n'importe quel
langage, et pour le coup, nous allons exploiter le support de PHP par le
serveur. N'étant pas le seul à avoir exploré ce genre de
choses, il y a un script PHP mis à disposition par une gentille personne 
[ici sur github](https://github.com/michaelfranzl/no.php/blob/master/no.php).
Ce script utilise la lib Curl, il est envisageable de faire du plus bas niveau 
avec, par exemple, l'usage de `php://input` ainsi que `fsockopen`. Cette technique 
entraîne, cependant, quelques limitations, comme les connexions persistantes…

L'hypothèse, nous avons un domaine `minsc.boo` qui "pointe" vers un dossier
`~/minsc.boo/` et une application qui écoute `127.0.0.1:27039`
- Mise en place de no.php sous `~/minsc.boo/index.php`
- Configuration `$backend_url = "http://127.0.0.1:27039"` et `$uri_rel =
  "index.php"`

Et… Ba voilà, c'est tout.

### Avec ton Socket tu m'Unix
Une autre approche de reverse serait d'utiliser des Unix Socket. 
Avec no.php, il faudrait effectuer des modifications, entre autres, ajouter des
directives curl comme `CURLOPT_UNIX_SOCKET_PATH`, ne pas initialiser curl avec
une URL, avoir un buffersize...

Ne comptez pas sur moi pour effectuer cette modification (quoique… une PR
ne mange pas de pain), mais certainement pas dans les mois à venir.

## Les EPI de ton proxy
_Équipement de Protection Individuelle_

Sur un hébergement mutualisé, vous n'êtes pas seul. L'espace de travail est
est partagé avec les autres, et il est possible que votre voisinage soit malveillant.
Tout repose sur la politique de sécurité de votre hébergeur et la qualité de
son isolation des environnements utilisateurs.

De plus `THERE IS NO CLOUD. It’s just someone else’s computer`, et qui vous dit que
`someone else`, n'est pas un peu trop curieux ?!

Mettez vos EPI, c'est parti pour un petit tour de piste des problématiques possibles
dans un environnement mutualisé ayant des problèmes de sécurité.

### Le voisin est un mateur 😭
Comme vous avez pu le constater, tout le trafic de notre reverse proxy passe
localement via le protocole `http`. Il n'est effectivement pas possible de 
passer des instructions comme `SSLProxyCACertificateFile` via le
fichier .htaccess. La confidentialité tout comme l'intégrité des données ne
peuvent donc pas être assurées localement.

Il y a quelques solutions possibles et passionnantes à mettre en place, comme :
- Le chiffrement de bout en bout, cela fera les pieds au mec du milieu
- Transmissions des informations de connexions via des hash uniquement
- Implémenter un système comparable à `Auth Digest` avec `qop=auth-int` en
bidirectionnel
- Instaurer un contrat de confiance SSL avec la solution en PHP

### Subir du harcèlement 🦟
Dans le cas d'un harceleur, celui-ci pourrait venir frapper à votre :27039 
plusieurs fois par seconde, que ce soit pour voir qui répond, ce qu'il en ressort, 
voler des mots de passe... Un véritable cauchemar de DoS et brute-force local.

Impossible de se protéger, Car toutes les requêtes seront émises localement 
et toutes auront la même origine locale 🤷. Il est même possible à notre
voisin de mentir sur son header pour faire porter le chapeau à un pauvre
innocent !

### YOU wa SOCKET 🤜
_Ai de sora ga ochite kuru_

La méthode la plus élégante est de passer par un Unix Socket 😍

En plus d'avoir une exposition relativement limitée, elle est aussi très
discrète, vu qu'elle n'ouvre pas de port, mais un socket Unix. Ce qui pour un
administrateur est tout de même moins voyant qu'un nouveau port qui pop...

Malheureusement, même si c'est la méthode la plus élégante, elle n'est pas
beaucoup plus efficace contre les voyeurs et harceleurs. Des outils comme
`strace`, permettent à un utilisateur avec suffisamment de privilèges de voir, 
entre autres, ce qui se passe sur un socket Unix.

## Finissons bons amis 🫂
Sur le test de 6 hébergements mutualisés, tous avaient
- Une isolation de mon environnement d'exécution
- Une isolation de l'espace de travail
- Une isolation du réseau (type sandbox)

C'est une pratique qui me fut utile et j'aime faire joujou avec les possibilités.
Dans la 3ᵉ partie de cette série, nous aborderons une alternative bien connue
et pourtant oublié, voir méprisée.

{{% warning `Les hébergements mutualisés ne sont pas toujours très transparents
sur ce qu'ils acceptent ou pas. Il est donc nécessaire d'être prudent sur les
déploiements que vous entreprendrez` %}}

Ce fut un plaisir de vous partager ce maigre savoir, que j'ai acquis à la force
mes aventures numériques.

**À plus dans l'bus**