#! /bin/bash

# remount within docker with acd logging enabled to debug problems
#umount /mnt/acd-decrypted
fusermount -u /mnt/acd-decrypted
fusermount -u /mnt/acd-raw; rm ~/.cache/acd_cli/acd_cli.log*; rm ~/.cache/acd_cli/nodes*
acd_cli sync
acd_cli mount /mnt/acd-raw
#mount -t ecryptfs -o no_sig_cache /mnt/acd-raw /mnt/acd-decrypted
cat /root/.cryfs.secrets | cryfs /mnt/acd-raw/ /mnt/acd-decrypted/
