#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage:"
  echo "makeManifest.sh <directory>"
  exit 1
fi
cd "$1" || exit 1
TMPFILE=`mktemp`
find -mindepth 1 -maxdepth 2 -type f -name \*.mp3 -o -name \*.lst | sed -e 's_^./__' > "$TMPFILE"
while read i ; do stat -c '%s %n' "$i" ; done < "$TMPFILE" > "manifest"
rm "$TMPFILE"
