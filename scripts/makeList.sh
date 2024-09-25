#!/bin/bash
dir="$1"
id="$2"

if [ "$dir" == "" -o "$id" == "" -o ! -d "$dir" ]; then
  echo "Usage: makeList.sh <directory> <cardId>"
  exit 1
fi

find "$dir" -maxdepth 1 -type f | sort > "$id".lst
