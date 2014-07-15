memory-low-notifier
===================

Controlla periodicamente la memoria libera di una partizione, segnala via mail se la memoria residua e' inferiore alla soglia scelta.

Configurazione di sendmail
===========================
Per configurare il comando sendmail, di modo che invii email a nome del vostro account gmail, seguite questa guida

http://linuxconfig.org/configuring-gmail-as-sendmail-email-relay

Usage
===============
Per l'esecuzione interattiva è sufficiente l'esecuzione del seguente comando

    bash freespace.sh rootfs 512

Se si vuole notificare il superamento della soglia occorre definire un file contente la lista delle mail:

	nano recipient
	email@dominio.com
	email@altro.dominio.it

Il comando da eseguire cambierà in:
	
	bash freespace.sh rootfs 512 recipient

Per automatizzare la rilevazione e la segnalazione, è possibile eseguire il segguente script, il quale inizializza un nuovo crontab:

	bash init_crontab.sh rootfs 3000 $(pwd)/recipient

Nota: eseguire il comando precedente nella cartella del progetto, per rispettare i riferimenti tra script
