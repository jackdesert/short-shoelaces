#! /bin/bash

echo 'Starting watcher'

# Run COMMAND on startup, and notify if changed

GENERATED_FILE=index.html

if [ -e $GENERATED_FILE ]; then
  MD5_BEFORE=`md5sum $GENERATED_FILE`
else
  MD5_BEFORE='some-random-string-lalala'
fi

plimc src/index.slim > index.html

MD5_AFTER=`md5sum $GENERATED_FILE`

if [ "$MD5_BEFORE" != "$MD5_AFTER" ];then
  echo 'changed src/index.slim'
fi

# Start watcher to check for future changes
watchmedo shell-command --pattern 'src/index.slim' --command 'plimc src/index.slim > index.html; echo "changed ${watch_src_path}"'
