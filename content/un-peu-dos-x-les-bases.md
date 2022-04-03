+++
title = "Un peu d'OS X (les bases)"
slug = "un-peu-dos-x-les-bases"
date = 2012-01-16T10:30:00Z
updated = 2013-08-06T15:50:49Z
tags = ["OS X"]
blogimport = true
+++

Il est rare pour moi d'avoir a toucher a un terminal de l'Os a la pomme.
L'Os a la pomme (pourie) et les "Linux" on beaucoup de commandes en commun. Pourquoi ? Car ils sont tout deux basé sur "UNIX" et vous le savez (oui oui).
Au passage il n'est plus correcte de parler de "MAC" pour désigner cette l'Os, la ligné "MAC" n’étant pas "UNIX" comparé a "MAC OS X"

### Les bases

- `man` : Cette commande est la plus importante ! Elle vous indique à quoi correspond une commande et ses options. Ex : **man ls** vous indiquera à quoi correspond la commande ls
- `ls` : La liste des fichiers et dossiers installés dans votre dossier utilisateur apparaît.
- `ls -a` : La liste de TOUS les éléments du dossier utilisateur, y compris les éléments invisibles, apparaît.
- `cd` : Pour ce déplacer des la repertoires. Ex pour aller dans user toto : `cd /Users/Toto`
- `cp` : Sert à copier un fichier (a na pas confondre sur /b/). Ex déplacer tata de doc a sav : `cp /Users/Toto/Documents/tata.doc Users/Toto/Documents/Sav/tata.doc`
- `mv` : Pour déplacer un fichier. La même chose que cp
- `rm` : Pour supprimer un fichier. Ex : `rm texte.doc`
- `rmdir` : Et la pour un dossier. Ex : `rmdir tartampion`
- `top` : Voir les process en cours.
- `df -h` : Affiche la liste des volumes montés
- `chown` : Pour changer le propriétaire d'un fichier.
- `mkdir` : Pour créer un répertoire.

### Un peu plus

- `rm -R` : Pour supprimer un dossier avec tout ce qu'il y a dedans (peut nécessiter d'utiliser `sudo`). Ex : `sudo rm -R /Users/Toto/tata`
- `./` : Pour lancer un exécutable. Ex : `./tata`
- `--help` : Pour avoir juste les informations rudimentaires d'une commande. Ex : `ls --help</b>`
- `history -c` : Utilisé pour vidé l'historique du terminal
- `ifconfig` : Affiche les informations des interfaces réseau

Petit post sur demande, que je développerais peut être plus tard.

**éa, les amis.**
