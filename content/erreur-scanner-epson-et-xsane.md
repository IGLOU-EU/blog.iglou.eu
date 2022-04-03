+++
title = "Erreur scanner Epson et Xsane"
slug = "erreur-scanner-epson-et-xsane"
date = 2013-04-16T13:56:00Z
updated = 2013-08-06T16:02:15Z
tags = ["software"]
blogimport = true
+++

## [epson2] e2_ext_read: cancel request received

Avec cette erreur, il y avait un moment que je n'avais pas touché a mon scanner. Lors d'une numérisation, il débutait et s’arrêtait directement. A l’époque j'avais réalisé des recherches sur quelques centaines de forum qui au final disait qu'il y avait un bug avec les pilotes epson...

Mais en cette journée grisâtre, je voulant modifier un fichier de conf sur systemd (j'ai cherché avec find). Je me suis trompé et suis tombé sur "/etc/sane.d/dll.conf", en cherchant à comprendre ce que je regardais, j'ai vue deux lignes "#epson", "epson2".J'ai voulu essayer de les inter changé, juste comme ca pour voir, et hop mon scanner fonctionnait.

Après cette trouvaille, j’eu envie de la partager en éditant le wiki de ArchLinux, et là, c'est le drame...   
Il donnait déjà la solution dans ces pages, il y à trois mois que j'aurais pu régler ce problème.

Résultat a retenir :
- Les forum c'est rarement bon
- Tester les autres pilotes dans la conf de sane
- Voir le pilote utilisé depuis le site epson

![Image de presentation](/images/blog.france5.fr-le-vinvinteur-files-2013-02-537449_456626714392585_1789428117_n1.png "")

**éa, les amis.**
