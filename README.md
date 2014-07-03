memory-low-notifier
===================

Controlla periodicamente la memoria libera di una partizione, e invia una segnalazione quando la memoria scende sotto una soglia

Configurazione di sendmail
===========================
Per configurare il comando sendmail, di modo che invii email a nome del vostro account gmail, seguite questa guida

http://linuxconfig.org/configuring-gmail-as-sendmail-email-relay

Usage
===============
Momentaneamente inserite l'indirizzo del destinatario della mail alla riga 93 del file freespace.sh; prossimamente questo elemento sarà gestito attraverso un file di configurazione.
Terminata la configurazione eseguite il seguente comando
    bash freespace.sh rootfs 512
