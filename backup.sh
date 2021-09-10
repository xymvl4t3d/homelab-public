#!/bin/bash

set -e

#Exclude file/folder backup locations
EXCLUDE1=/mnt/ServerData/
EXCLUDE2=/home/user/VMs

#Backup location
LOCATION=/mnt/ServerData/Backups/Server/Tar/

#Backup filename
FILENAME=backup-$(date +%d%m%Y).tar.gz

#Mail body message
MESSAGE="Backup complete. Encrypt and copy to cloud."
MESSAGE2="Backup failed. Check server logs."

#Backup command
tar --warning='no-file-ignored' -cpzf $LOCATION$FILENAME \
--exclude=$EXCLUDE1 --exclude=$EXCLUDE2 --one-file-system / | progress -m

#Encrypt backup
#gpg --cipher-algo AES256 $LOCATION$FILENAME 
#| progress -m

#Remove unencrypted backup
#rm -rf $LOCATION$FILENAME

#Return success/failure status upon job completion
if [ $? -eq 0 ]
then
	echo "Backup complete"
	echo $MESSAGE | mail -s "Server backup completed" "my-email-here"
	exit 0
else
	echo "Backup failed" >&2
	echo $MESSAGE2 | mail -s "Backup failed" "my-email-here" >&2
	exit 1
fi
