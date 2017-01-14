#! /bin/bash

fusermount -u /mnt/decrypted
fusermount -u /mnt/amazon; rm ~/.cache/acd_cli/acd_cli.log*
