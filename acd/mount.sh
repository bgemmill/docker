#! /bin/bash

acd_cli sync
acd_cli mount /mnt/amazon
cat /input/gocryptfs.secrets | gocryptfs -nosyslog /mnt/amazon/backup /mnt/decrypted
