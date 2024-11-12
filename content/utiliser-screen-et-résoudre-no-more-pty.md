+++
title = "Utiliser Screen et résoudre \"No more PTY\""
slug = ""
date = 2013-01-22T16:07:00Z
lastmod = 2013-08-06T16:05:43Z
tags = ["linux", "memo"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

### Un Screen vaut mieux que deux tu l'auras

Après avoir combattu lamentablement pour utiliser "dtach", je me suis résigné devant mes maigres réussites. Et est donc opté pour le plus simple et le plus rependu "Screen".

![Image de presentation](/images/lh3.ggpht.com-CXvIZ0OWmnY-UP6csWhQwsI-AAAAAAAAAcc-BL73NPmm6U4-s400-Sans-titre.png "")

Après ce screen de l'utilisation de "screen", passons à une rapide vue de son fonctionnement. Sans oublier de l'installer au besoin ...

- Créer un screen : **$ screen -S *nom_du_screen***
- Sortir d'un screen : **Ctrl + A** puis **D**
- Lister les screen : **$ screen -ls**
- Reprendre un screen : **$ screen -r *nom_du_screen***

---

### Ho my error

```sh
[ERROR] No more PTY. Sorry, could not find a PTY !!!
```

Ho my ... Une erreur, c'est grave docteur ? Si vous optenez l'erreur suivante, ce n'est probablement rien, et l'utilisateur n'a pas les droit pour réaliser un screen. Les droits sont normalement definie sur `crw-rw-rw-`, verifions ensemble.

```bash
$ ls -l /dev/ptmx
crw-r--r-- 1 root tty 5, 2 Mar 29 00:24 /dev/ptmx
```

Si vous optenez un resultat semblable (w voulant dire write), c'est qu'il manque effectivement des droits en ecriture. Rien de plus simple a arranger.

```bash
$ sudo chmod a+w /dev/ptmx
$ ls -l /dev/ptmx
crw-rw-rw- 1 root tty 5, 2 Mar 29 00:24 /dev/ptmx
```

**éa, les amis.**
