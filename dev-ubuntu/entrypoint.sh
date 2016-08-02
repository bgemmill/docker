#! /bin/bash

# add a user to run commands with
USER_NAME=${USER_NAME:=docker}
USER_PASS=${USER_PASS:=docker}
USER_GROUPS=${USER_GROUPS:=audio,sudo}
USER_ID=${USER_ID:=1000}

# create that user
useradd -m $USER_NAME -u $USER_ID -G $USER_GROUPS > /dev/null 2>&1
chpasswd <<< "$USER_NAME:$USER_PASS"
chown $USER_NAME /home/$USER_NAME
touch /home/$USER_NAME/.Xauthority; chown $USER_NAME /home/$USER_NAME/.Xauthority # gksu needs this file, even if empty

# run command as user
gosu $USER_NAME "$@"

# Since su has problems starting up a shell with -c without screwing up signal handling (try quitting top with ctrl-c), we detect the docker zero-argument case and just drop the user into bash.
# We could use gosu here, but that would both make the dockerfiles complex as well as make the images bigger.

# note that docker's "zero argument" case starts up the dockerfile's CMD with sh
#if [[ "$@" == "/bin/sh -c bash" ]]
#then
#  # No arguments passed to docker run, so drop the user into a shell
#  exec su $USER_NAME
#else
#  # Forward any passed arguments on
#  exec su $USER_NAME -c "$@"
#fi

