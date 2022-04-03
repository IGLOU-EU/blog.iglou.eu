+++
title = "[PHP] Benchmark a base de XDebug et graphiques by kcachegrind"
slug = "php-benchmark-base-de-xdebug-et"
date = 2015-11-28T09:00:00Z
updated = 2018-06-05T11:14:22Z
tags = ["programmation"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

### Des bench, des bench, oui mais des bench xdbug 🍝

![Image de presentation](/images/2.bp.blogspot.com-z_JKWn_h10o-WvS7zjloRAI-AAAAAAAAAxU-nnT9pNi6mjYf_wNtvH0ztYPKjVoGtuAHwCLcBGAs-s400-wp_xdebug.png "")

Alors on trouve des Bench PHP partout sur le net, mais de deux choses l'une (ou plus) :
- Ils ne sont pas actualisés
- La version PHP et les infos serveurs ne sont pas indiqués
- Chaque bench en contredit d'autres
- Ils utilisent time() et microtime()(plus rarement), n'utilisent pas les fonctions de math ... et presque jamais $_SERVER['REQUEST_TIME']
- Le temps d’exécution est en variation constante, il est donc logique de faire des résultats relatifs (%)

Débutons donc avec ces bench qui sont peut-être complétement débiles, mais tester par soi-même avec des approches différentes c'est sympa :)

Toutes les sources et images sont disponibles ici : https://git.iglou.eu/adrien/benchmark_php/tree/master

#### Méthode

J'ai volontairement fait des scripts simples avec beaucoup de répétitions, j'ai tenté d'équilibrer le plus possible entre les entités à tester.

Pour tester les entités avec XDB et KCG, chaque entité est dans une fonction.

Les loop sont de 100.000 et ils sont externes à la fonction de l'entité testée, afin de ne pas la prendre en compte dans le résultat.

On obtient la moyenne par fonction "TempsPour100.000/100.000" tout simplement… TP100k étant le résultat de la définissions de main par les fonctions

##### Infos serveur
- Serveur virtuel utilisé uniquement en teste
- 8Go ram
- 4core 3Ghz

##### Infos logicielles
- Archlinux kernel 4.2.4
- Apache 2.4.17-2
- XDebug 2.3.3-1
- PHP 5.6.14-1

##### Infos PHP
- Cache désactivé
- GC activé
- Xdebug seulement le profileur est activé

#### Résultats

**Parcourir un tableau,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_arrayLoop.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_arrayLoop.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_arrayLoop.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_arrayLoop.php)

k = key; v = value; Pv = pointer to value;

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_arrayLoop.png "")

**Opérateurs de comparaison (égal et n'est pas égal),**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_comparisonOperators.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_comparisonOperators.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_comparisonOperators.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_comparisonOperators.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_comparisonOperators.png "")

**Définir un array,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_deffineArray.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_deffineArray.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_deffineArray.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_deffineArray.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_deffineArray.png "")

**Utilisation de echo,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_echo.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_echo.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_echo.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_echo.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_echo.png "")

**Utilisation de echo pour plusieurs variables (concat),**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_echo_multiVar.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_echo_multiVar.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_echo_multiVar.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_echo_multiVar.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_echo_multiVar.png "")

**Définir des variables globales,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_globalVariables.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_globalVariables.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_globalVariables.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_globalVariables.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_globalVariables.png "")

**Is array ?**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_isArray.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_isArray.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_isArray.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_isArray.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_isArray.png "")

**Afficher une chaine,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_outputAString.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_outputAString.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_outputAString.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_outputAString.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_outputAString.png "")

**Concaténation d'une chaine,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_stringConcat%C3%A9nation.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_stringConcat%C3%A9nation.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_stringConcatenation.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_stringConcatenation.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_stringConcat%C3%A9nation.png "")

**If ou Switch ?**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_switch.png](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_switch.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_switch.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_switch.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_switch.png "")

**Unset me,**

img : [inuit.iglou.eu/adrien/benchmark_php/raw/master/php_unset.png](/images/php_unset.png)

source : [https://git.iglou.eu/adrien/benchmark_php/blob/master/php_unset.php](https://git.iglou.eu/adrien/benchmark_php/blob/master/php_unset.php)

![Image de presentation](/images/git.iglou.eu-adrien-benchmark_php-raw-master-php_unset.png "")

Pour ce qui est des licences, vu que quand on partage un truc, c'est obligatoire, sinon vous ne pourrez pas réutiliser quoi que ce soit...

Je conserve la paternité, c'est obligatoire en France.   
**Donc pour le code :**
```c
/*
 * Copyright 2015 Kara adrien
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 ```

**Pour les images :**

[**Attribution (BY)**](http://creativecommons.org/licenses/by/3.0/fr/): Le titulaire des droits autorise toute exploitation de l’œuvre, y compris à des fins commerciales, ainsi que la création d’œuvres dérivées, dont la distribution est également autorisée sans restriction, à condition de l’attribuer à son l’auteur en citant son nom. Cette licence est recommandée pour la diffusion et l’utilisation maximale des œuvres.

Comme toujours, si vous relevez des erreurs, merci de m'en faire part, ça compte dans mes remises en question quotidiennes =D

Si je fais d'autres bench ils seront ajoutés ici, peu probable de pondre un autre sujet pour ça. Sauf si les prochains bench sont sous PHP7.

**éa, les amis.**