#! /bin/bash

echo 'Starting watcher'

# Run COMMAND on startup, and notify if changed

GENERATED_FILE=generated/index.html

if [ -e $GENERATED_FILE ]; then
  MD5_BEFORE=`md5sum $GENERATED_FILE`
else
  MD5_BEFORE='some-random-string-lalala'
fi

plimc index.slim > generated/index.html

MD5_AFTER=`md5sum $GENERATED_FILE`

if [ "$MD5_BEFORE" != "$MD5_AFTER" ];then
  echo 'changed index.slim'
fi

# Start watcher to check for future changes
watchmedo shell-command --pattern '*.slim' --command 'plimc index.slim > generated/index.html; echo "changed ${watch_src_path}"'
