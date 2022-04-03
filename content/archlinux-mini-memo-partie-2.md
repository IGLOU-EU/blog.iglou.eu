+++
title = "Archlinux mini memo (partie 2)"
slug = "archlinux-mini-memo-partie-2"
date = 2012-01-12T17:17:00Z
updated = 2013-08-06T16:08:59Z
tags = ["linux", "memo"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## Âprés le mémos d'installation...

Il est tellement génial  de s’amuser sur arch.

**/etc/Inittab utilisation :**   
Il est tres simple d'utiliser Cron pour planifier une tache, mais lorsque l'on aimerait avoir un script aven tout le reste ... utiliser inittab c'est cool (même si j'en entend me dire "c'est pas propre").

Globalement son utilisation ce résume en une ligne " **_id_: _runlevels_: _action_: _process_**"

- ID, est l'identificateur d'entrée, il est aussi UNIQUE
- Runlevels, indique le mode de démarrage pour l'action qui doit étre executé
  - 0, Halt
  - 1(S), Single-user
  - 2, Not used
  - 3, Multi-user
  - 4, Not used
  - 5, X11
  - 6, Reboot
- Action, donne l'action a faire pour activer le process
  - Wait
  - Once
  - Boot
  - Bootwait
  - Off
  - Ondemand
  - Initdefault
  - Sysinit
  - Powerwait
  - Powerfail
  - Powerokwait
  - Powerfailnow
  - Ctrlaltdel
  - Kbrequest
- Process, spécifie ce qui doit être exécuté

Exemple pour faire embeter un ami :   
**rb::bootwait:/sbin/shutdown -t3 -r now**

Pas besoin de toujours spécifier le runlevels, comme ici avec une action de type "boot".

**éa, les amis.**
