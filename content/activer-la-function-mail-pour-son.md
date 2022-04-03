+++
title = "Activer la function mail() pour son serveur php"
slug = "activer-la-function-mail-pour-son"
date = 2012-08-02T20:13:00Z
updated = 2013-08-06T16:08:23Z
tags = ["Serveur", "memo"]
blogimport = true
+++

{{% warning `Cet article est issu d'une importation historique.<br>Il fut fait sans correcteur orthographique et grammaticale, il est aussi fort probable que des images et liens soient indisponible.` %}}

## PHP, Ho my mail() !

Serveur dédié (ou pas), si nous n'avons pas l’utilité d'un véritable serveur mail (genre l'usine postfix) pour quoi s’embêter. Voyons comment envoyer des email son pouvoir en recevoir sous Debian.

**On install Sendmail qui ce chargera de ça.**
- # sendmail_path =/usr/sbin/sendmail -t -i

**On config dans le php.ini.**
- # nano /etc/php5/apache2/php.ini

**On recherche la partie sendmail.**
- Ctrl+w sendmail

**Remplacer :**
- ;sendmail_path =
**Par :**
- sendmail_path =/usr/sbin/sendmail -t -i

**Sav :**
```
Ctrl+x
Y
Entrée
```

**On redémarre apache (ou ce qui gère votre php - serveur web)**
- # /etc/init.d/./apache2 restart

**Testons avec un petit script php, envoyons nous un email.**
```php
<?php
$email = 'votre e-mail';
$subject = 'E-mail de teste';
$message = 'Bonjour,'. "\r\n" .'vous venez de vous envoyer un e-mail';
$headers = 'From: teste-no1' . "\r\n" .
  'Reply-To: reload@e-mail-test' . "\r\n" .
  'X-Mailer: PHP/' . phpversion();

if (mail($email, $subject, $message, $headers)) {
   echo = 'l email est envoyé.';
   header( "refresh:3;url=/" );
} else {
   echo = 'Une erreur est survenue lors de l\'envoi de l\'email.';
}
```

Et voila, vous pouvez envoyez des e-mail ... Simple, non ?!

Il est possible d'avoir une erreur comme quoi le mail n'est pas envoyé ou de ne pas le recevoir. Vérifiez le fichier log :
- `cat /var/log/mail.log`

Si ça ne donne rien ou que le fichier "mail.log" n'existe pas. Verifiez les log apache2 (/var/log/apache2/) et si Sendmail est bien installé avec cette commande :
- `dpkg -l | grep sendmail`

**éa, les amis.**
