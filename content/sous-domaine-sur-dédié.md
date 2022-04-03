+++
title = "Sous domaine sur dédié"
slug = ""
date = 2012-11-29T14:03:00Z
updated = 2013-08-06T15:57:42Z
tags = ["Serveur"]
blogimport = true
+++

Lors de me première installation/configuration d'un serveur dédié, j'ai ramé.

J’étais un habitué des système G/Linux comme utilisateur depuis déjà un moment, mais je n'imaginais pas le monde du serveur web. (Au passage, je ne voulais de base pas faire de serveur sous un Linux mais BSD, ayant débuté sur du serveur virtualisé mon hébergeur donnait que très peu de choix)

![Image de presentation](/images/serveur-linux.png "")

Après avoir bravement combattu apache et une partie de sécurisation. Je me suis heurté à une stupidité, en voulant réaliser des sous-domaines (avec honte je vous avoue avoir passé plus de 5jours pour trouver la 2eme étape). La marche à suivre est pourtant si simple.

1ere étape :

- Créer un `host` dans `sites-available` et [opérer comme d'habitude](/apache2-et-ssh-mini-memo/)
- On `a2ensite` et restart `apache2`

2eme étape :

- Se rendre chez votre fournisseur de `nom de domaines`
- Trouver le manager DNS et éditer le `Zone DNS`
- Ajouter un type `A` avec votre IPV4 ex: `blog.toto.com  A 209.85.229.94`
- Et un CNAME si besoin ex: `www  CNAME  blog.toto.com`
- Pour une IPV6 utiliser **AAAA** à la place de **A**

```dns
blog        A       209.85.229.94
blog        AAAA    2a00:1450:4007:804::1017
www.blog    CNAME   blog.toto.com.
```

Tout simple, mais lorsque l'on ne connaît rien il faut y penser !   
Pour plus d'infos je vous conseil fortement d'aller sur [Wikipedia](http://fr.wikipedia.org/wiki/Domain_Name_System).

**éa, les amis.**
