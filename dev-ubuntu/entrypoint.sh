#! /bin/bash

# add a user to run commands with
USER_NAME=${USER_NAME:=docker}
USER_ID=${USER_ID:=1000}
useradd -m $USER_NAME -u $USER_ID > /dev/null 2>&1
usermod -a -G audio $USER_NAME > /dev/null 2>&1
chown $USER_NAME /home/$USER_NAME

# run commands as user
# Since su has problems starting up a shell with -c without screwing up signal handling (try quitting top with ctrl-c), we detect the docker zero-argument case and just drop the user into bash.
# We could use gosu here, but that would both make the dockerfiles complex as well as make the images bigger.

# note that docker's "zero argument" case starts up bash with sh
if [[ "$@" == "/bin/sh -c bash" ]]
then
  # No arguments passed to docker run, so drop the user into a shell
  exec su $USER_NAME
else
  # Forward any passed arguments on
  exec su $USER_NAME -c "$@"
fi
