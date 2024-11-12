+++
title = "[PHP] Utiliser ncurse pour des petits projets php"
slug = "php-utiliser-ncurse-pour-des-petits"
date = 2015-11-30T09:00:00Z
lastmod = 2015-11-30T09:00:11Z
tags = ["programmation"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

### ⚡️ Je détiens la Curse toute puissante ⚔️

Alors oui, la curse ce n'est pas vraiment aimé, puis on en croise de moins en moins. N’empêche que j'aime bien moi, c'est classe et faire du curse en PHP c'est rigolo.

![Image de presentation](/images/_Screenshot_DwarfFortressThree.png "Envie d'un Dwarf Fortress en PHP ?")

La lib Ncurse pour PHP est "standard" et le man Ncurse peut du coup être utilisé.

#### Pourquoi faire ce petit article ?

Pour présenter la lib en PHP, faire une petite introduction du fonctionnement…

Finalement, cet article est peut-être plus pour moi qu'autre chose.

#### ATTENTION !
Les programmes écrits en C ont généralement deux fonctionnements True/False.
.1 Ceux qui utilisent -1 en cas d'erreur et sinon 0 (plus répandus)
.2 Ceux qui font l'inverse (plus classique)

Ncurse est le 1er cas, ne l'oubliez pas dans vos structures de testes.

### Installation
- Installer Ncurse
- Installe PECL
- $ svn checkout http://svn.php.net/repository/pecl/ncurses/ ncurses
- $ cd ncurses/tags/ncurses-1.0.2/trunk/

// J'ai un problème avec cette extension et PECL du coup…
- $ pecl build

// Sois je copie à la main (crade)
- $ sudo cp <LienRetournéParPecl> /usr/lib/php/modules/

// Sois-je compile, puis, installe
- $ ./configure && make
- $ sudo make install #ou make install

**Les pages à garder sous la main :**
- [Les couleurs prés définies](http://php.net/manual/en/ncurses.colorconsts.php)
- [Les Clés du clavier (les clés sont des int 8bit)](http://php.net/manual/en/ncurses.keyconsts.php)
- [Les actions de souris](http://php.net/manual/en/ncurses.mouseconsts.php)
- [La liste des fonctions de Ncurse (à utiliser avec un ctrl+f)](http://php.net/manual/en/ref.ncurses.php)

### Les bases

**Initialiser ncurse puis le détruire.**   
_Je vous donne le contenu de mes fonctions, la source à la fin._
```php
// Initialisation de la lib
// [ncurses_init](http://php.net/manual/fr/function.ncurses-init.php)
ncurses_init();

// Désactivation de la souris
// [ncurses_curs_set](http://php.net/manual/fr/function.ncurses-curs-set.php)
ncurses_curs_set(0);

// Vérifier si les couleurs sont supporté et les activer
// [ncurses_start_color](http://php.net/manual/fr/function.ncurses-start-color.php)
if ( ncurses_start_color() === -1) {
    exit('ERR : ncurses_newwin => Color not supported !');
}

// On enregistre la nouvelle window; // (0, 0, 0, 0) = Nombre de rangés, de colonnes, position x, y
// [ncurses_newwin](http://php.net/manual/fr/function.ncurses-newwin.php)
$this->window = (0, 0, 0, 0);

// On check si la fenêtre est bien initialisé
if ($this->window !== -1) {
    [ncurses_refresh](http://php.net/manual/fr/function.ncurses-refresh.php)
    ncurses_refresh();

    // Taille de la fenêtre,  STDSCR = default window, retourne height/width
    // [ncurses_getmaxyx](http://php.net/manual/fr/function.ncurses-getmaxyx.php)
    ncurses_getmaxyx(STDSCR, $this->size['height'], $this->size['width']);

    [ncurses_noecho](http://php.net/manual/fr/function.ncurses-noecho.php)
    ncurses_noecho(); // Ne rien afficher d'exterieur
} else {
    exit('ERR : ncurses_newwin => FAIL !');
}
```

**Afin d'utiliser exit() proprement, on utilise ici __destruct()**
```php
private function __destruct() {
$this->envSound();

// [ncurses_end](http://php.net/manual/fr/function.ncurses-end.php)
ncurses_end();
}
```

 **Pour check les inputKey** c'est simple, à savoir que les fonctions de ncurses sont bloquantes, donc pas vraiment intéressantes… L'astuce est tout simplement d'ouvrir stdin en lecture, le définir comme non bloquant, puis de le lire ... Easy ! Il ne reste qu'à faire un switch pour gérer l'action de vos inputs.
```php
private function getStdin() {
    // [fopen](http://php.net/manual/fr/function.fopen.php)
    $stdin = fopen('php://stdin', 'r');

    // [stream_set_blocking](http://php.net/manual/fr/function.stream-set-blocking.php)
    stream_set_blocking($stdin, false);

    // [fread](http://php.net/manual/fr/function.fread.php)
    $this->usedKey = fread($stdin, 1);
}
```

En gros voici la base, après, il y a deux trois fonctions utiles qu'il peut être compliqué à comprendre ou trouver.

**Ma fonction de "d'affichage"** se compose de :
- [ncurses_wclear](http://php.net/manual/fr/function.ncurses-wclear.php) // Vide la fenêtre
- [ncurses_wrefresh](http://php.net/manual/fr/function.ncurses-wrefresh.php) // Rafraichir la fenêtre
- [ncurses_getmaxyx](http://php.net/manual/fr/function.ncurses-getmaxyx.php) // Reprendre la taille de la fenêtre pour s'adapter à un resize
- [ncurses_border](http://php.net/manual/fr/function.ncurses-border.php) // Retirer toutes bordures

pour ce qui concerne le petit coup de nettoyage avant affichage,
- [ncurses_wattron](http://php.net/manual/fr/function.ncurses-wattron.php) // Remplace les attributs de la fenêtre, taille de police, couleur de fond…
- [ncurses_wattroff](http://php.net/manual/fr/function.ncurses-wattroff.php) // Retour a la normale
- [ncurses_wcolor_set](http://php.net/manual/fr/function.ncurses-wcolor-set.php) // Changer les couleurs, dépends des couleurs déclarées avec [ncurses_init_pair](http://php.net/manual/fr/function.ncurses-init-pair.php)

voilà ce qui concerne la partie mise en forme, puis un petit coup de rafraichissement
- [ncurses_wmove](http://php.net/manual/fr/function.ncurses-wmove.php) // Sortir le curseur du champ (dans ce cas précis)
- [ncurses_wrefresh](http://php.net/manual/fr/function.ncurses-wrefresh.php) // Rafraichir la fenêtre

**Pour gérer l'affichage de char** on utilise juste
- [ncurses_wmove](http://php.net/manual/fr/function.ncurses-wmove.php) // Bouger le curseur où l'on veut afficher le char
- [ncurses_waddstr](http://php.net/manual/fr/function.ncurses-waddstr.php) // Ajouter un char a l'emplacement du curseur

Il suffit de faire une boucle pour afficher une string

---

### À vous de jouer

Ba rien qu'avec cette minibase-là, il est possible de faire tout ce que l'on désire ou presque, que ce soit du jeu comme des logiciels. C'est vraiment super simple et pour les personnes qui ne font que du PHP ça fait le boulot !

La lib n'est pas vraiment lourde, elle ne bloque pas PHP (contrairement à php-gtk)
et est simple d'utilisation. En même temps cette lib a toujours était génial, PHP ou pas.

Voici la source de mon petit snake, bien sûr il y a beaucoup d’améliorations possibles, je ne fais notamment que très rarement du PHP OO, là, ce fut un choix pour le porté des variables principalement et la volonté de faire ça "propre" mais en un seul fichier.

C'est codé pas trop salement et en quelque heures sur deux jours
[http://inuit.iglou.eu/iglou.adrien/Snake/blob/master/snake](http://inuit.iglou.eu/iglou.adrien/Snake/blob/master/snake)

Prochaine fois **petit** tour sur PHP-GTK histoire de pas trop en chi*r si vous voulez débuter avec, je n'ai pas fini mon projet avec et ne le finirais jamais…
C'est insupportable (pour moi) de ne pas gérer mes boucles et interactions à la main.

**éa, les amis.**