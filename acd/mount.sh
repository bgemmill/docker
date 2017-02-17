#! /bin/bash

acd_cli sync
acd_cli mount /mnt/amazon
cat /input/gocryptfs.secrets | gocryptfs -fg -noprealloc /mnt/amazon/backup /mnt/decrypted > /root/.cache/gocryptfs.log 2>&1 &
