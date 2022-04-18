---
title: "[Alpha I] Reverse Proxy Sur Hébergement Mutualisé"
date: 2022-04-07T00:42:19+02:00
tags: ["alpha", "Serveur"]
draft: false
---

{{% warning `Cette série "Alpha" tourne autour du thème de l'exécution de code
non prévu par les fournisseurs d'hébergement mutualisé. Et ce, affin de passer
outre les limitations comme le support de langages de script ou binaires` %}}

# 🎤 Viens chez mon :27039, j'habite chez :443
_Sur les bords au milieu c'est vrai qu'je crains un peu._

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

## Reverse proxy dans ton .htaccess
Je ne sais pas si vous avez déjà entendu parlé d'un fichier du nom de 
`.htaccess`. C'est un fichier très peu utilisé, et très peu répandu sur les
hébergements mutualisés 😏 Celui-ci, quand il est supporté, permet un tas de 
choses sympa vu qu'il permet de modifier la configuration du serveur au niveau du
répertoire courant. C'est notamment lui qui permet d'avoir du `Pretty URLs`.

Tiens, cela tombe bien de parler des jolies URL, car pour notre reverse proxy,
nous allons utiliser le même mécanisme. Il y a donc de très grandes chances que
cette méthode fonctionne pour tous, `mod_rewrite` étant "toujours" disponible.

Mettons l'hypothèse suivante, nous disposons d'une app locale écoutant sur
`127.0.0.1:27039`, et nous désirons "rediriger" tout le flux arrivant vers celui-
ci. Attention, c'est vraiment complexe, accrochez-vous bien les yeux.
```dracula
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
La seule solution pour exploiter un Socket avec apache serait de ce fait de 
passer par une instruction `proxypass`, mais celle-ci n'est pas disponible 
via un .htaccess.

{{% warning `Pour exploiter cette solution, le serveur doit mettre à disposition
'mod_rewrite', mais aussi 'mod_proxy' pour le flag P|proxy` %}}

## Reverse proxy dans ton PHP
Il est ironique de passer par un langage de script pour exploiter du natif,
voire traumatisant pour certains (dont moi).

Un proxy, basiquement, a pour seule mission de transférer les informations reçues
sur un point A vers un point B. Il est possible de faire cela avec n'importe quel
langage, et pour le coup nous allons exploiter le support de PHP par le
serveur. Comme je ne suis bien sûr pas le seul à avoir exploité ce genre de
choses, il y a un script PHP mis à disposition par une gentille personne 
[ici sur github](https://github.com/michaelfranzl/no.php/blob/master/no.php).
Ce script utilise la lib Curl, il est envisageable de faire du plus bas niveau 
avec par exemple l'usage de `php://input` ainsi que `fsockopen`. Cette technique 
entraîne, cependant, quelques limitations, comme les connexions persistantes…

L'hypothèse, nous avons un domaine `minsc.boo` qui "pointe" vers un dossier
`~/minsc.boo/` et une application qui écoute `127.0.0.1:27039`
- Mise en place de no.php sous `~/minsc.boo/index.php`
- Configuration `$backend_url = "http://127.0.0.1:27039"` et `$uri_rel =
  "index.php"`

Et… Ba voilà, c'est tout.

### Avec ton Socket tu m'Unix
Avec cette autre approche de reverse via PHP, il est aussi envisageable d'utiliser
des Unix Socket. En modifiant no.php il faudrait, entre autre, ajouter des
directives curl comme `CURLOPT_UNIX_SOCKET_PATH`, ne pas initialiser curl avec
une url, avoir un buffersize...

## Les EPI de ton proxy
_Équipement de Protection Individuelle_

### Le voisin est un mateur 😭
Comme vous avez pu le constater, tout le trafic de notre reverse proxy passant
par un port, se fait sur le protocole `http`. Il n'est effectivement pas
possible de passer des instructions comme `SSLProxyCACertificateFile` via le
fichier .htaccess. La confidentialité tout comme l'intégrité des données ne
peuvent donc pas être assurées. 

Il y a cependant quelques solutions viables et passionnantes à mettre en place, 
comme :
- Le chiffrement de bout en bout, cela fera les pieds au mec du milieu
- Transmissions des informations de connexions via des hash uniquement
- Implémenter un système comparable à `Auth Digest` avec `qop=auth-int` mais
bidirectionnel
- Instaurer un contrat de confiance SSL avec la solution en PHP

### Subir du harcèlement 🦟
Suivant la sécurité mise en place par votre hébergeur, il est probable que
vous n'ayez aucune protection sur l'exploitation d'un port local. Il
est possible que votre voisin frappe à votre :27039 plusieurs fois par
jour, que ce soit pour voir qui répond, ce qu'il en ressort, voler des mots de
passe... Avec une sensibilité accrue aux brute-force.

Dans le cas présent, impossible de se protéger efficacement à notre niveau.
Tout repose uniquement sur la politique de sécurité de l'hébergeur. Si votre
application se limite bien à l'adresse locale, c'est déjà ça, toutes les 
requêtes seront émises localement, mais toutes auront la même origine 🤷.

### YOU wa SOCKET 🤜
_Ai de sora ga ochite kuru_

La méthode la plus sécurisée étant de passer par un Unix Socket. Bien que vous 
devriez être chroot et que cette mesure peut être inutile, limiter son accès
exclusivement à votre utilisateur.

En plus d'avoir une exposition relativement limitée, elle est aussi très
discrète, vu qu'elle n'ouvre pas de port. Ce qui pour un administrateur système
est tout de même moins voyant qu'un nouveau port qui pop...

Cela me donne très envie de faire un proxy PHP pour les Unix Socket, mais vu le
nombre de projets déjà en cours…

## Finissons bons amis 🫂
Sur le test de 6 hébergements mutualisés, tous avaient
- Une isolation de mon environnement d'exécution
- Une isolation de mon espace de travail `cat /proc/<ENV>/mountinfo` contient une ligne `/<ID> /home/<ID>`
- Pas d'offuscation ou isolation des ports

C'est une pratique qui me fut utile et j'aime partager un savoir, que j'ai acquis
avec le temps. Celui-ci n'est malheureusement pas très utile ou recommandé :)

Je ne saurais que trop vous conseiller d'apprendre à faire du déploiement 
ServeurLess, même si détourner ces hébergements est intrigant et pratique.

{{% warning `Les hébergements mutualisés ne sont pas toujours très transparents
sur ce qu'ils acceptent ou pas. Il est donc nécessaire d'être prudent sur les
déploiements que vous entreprendrez` %}}

Comme dit l'adage
>THERE IS NO CLOUD. It’s just someone else’s computer



**À plus dans l'bus**