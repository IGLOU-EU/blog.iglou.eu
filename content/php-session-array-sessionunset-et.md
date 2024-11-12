+++
title = "[PHP] $_SESSION = array(), session_unset et session_destroy()"
slug = "php-session-array-sessionunset-et"
date = 2015-03-24T18:30:00Z
lastmod = 2015-03-24T19:59:36Z
tags = ["programmation"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

### Session my PHP

Aidant de temps en temps sur des forums ou en IRC, je tombe par moment sur des personnes qui mélangent, confondes et font des mélimélo perso. Mais pas seulement, il arrive que ce soit les "helpers" qui induisent en erreur (et là, c'est le drame) ...

![Image de presentation](/images/php.jpg "")

Dans ce post nous allons parler des sessions avec PHP, et plus particulièrement de leurs destruction.

#### Croisé sur le net
1. session_unset() ne doit pas étre utilisé car il détruira également la super globale $_SESSION qui deviendra inutilisable.
2. On doit utiliser $_SESSION = array() puis session_unset() avant de "destroy"
3. Il est inutile de vider $_SESSION si on fait un session_destroy()
4. $_SESSION = array() et session_unset() font exactement la même chose

 #### Alors que
1. Bien sur c'est faux. session_unset va entre autre vider $_SESSION, en revanche si l'on indique session_unset($_SESSION) on rigole jaune. C'est au passage indiqué sur le man de PHP ...
2. Encore une idée étrange. Les deux vont faire une chose, c'est vider $_SESSION. Alors hors idée perverse d'utiliser le double de ressources c'est pas utile.
3. session_destroy() vas détruire le fichier de session, mais ne vide pas la mémoire. On peut donc toujours accéder aux données.
4. C'est pas si faux que ça et en vulgarisation c'est le cas. La seul différence est que session_unset(), va vérifier si ce qui est passé en arguments correspond bien à une "php_session_active".

 #### Exemples et sources
Je vois déjà des "c'est bien beau, mais comment on peut savoir si toi aussi tu racontes pas des conneries ?"   
Pour le 1er et 2eme points il est simple de vérifier : [http://php.net/manual/fr/function.session-unset.php](http://php.net/manual/fr/function.session-unset.php)

Pour le 2eme point on peut tout de même vérifier :
```php
<?php
session_start();

$_SESSION['time'] = time();

session_unset();
var_dump($_SESSION);

$_SESSION = array();
var_dump($_SESSION);
```

Le 3eme points est très simple à tester :
```php
<?php
session_start();

$_SESSION['time'] = time();
$a = &$_SESSION;

session_destroy();
var_dump($a);
```

Le 4eme points ce trouve dans la [source de php](https://github.com/php/php-src/blob/663074b6b1fa4534fbbb65462aeef40f2c983ad5/ext/session/session.c#L2267) :
```c
static PHP_FUNCTION(session_unset)
{
    if (PS(session_status) != php_session_active)
    {
        RETURN_FALSE;
    }

    IF_SESSION_VARS() 
    {
        HashTable *ht_sess_var = Z_ARRVAL_P(Z_REFVAL(PS(http_session_vars)));

        /* Clean $_SESSION. */
        zend_hash_clean(ht_sess_var);
    }
}
```

_Pour faire le ménage du client `_setcookie(session_name(),'',0,'/');` ce qui supprime le cookie utilisateur de sa session._

**éa, les amis.**
