#! /bin/bash

rm ~/.cache/acd_cli/acd_cli.log* > /dev/null 2>&1
rm ~/.cache/rsyncd.log > /dev/null 2>&1
rm ~/.cache/gocryptfs.log > /dev/null 2>&1

acd_cli sync
acd_cli mount /mnt/amazon
cat /input/gocryptfs.secrets | gocryptfs -fg -noprealloc /mnt/amazon/backup /mnt/decrypted > /root/.cache/gocryptfs.log 2>&1 &
