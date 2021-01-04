#!/bin/bash

echo "Will apply high-pass filter to all files in the current directory:"
pwd
echo "Continue? (Ctrl+C to abort)"
read || exit 1
mkdir -p original
for i in * ; do
  if [ ! -f "$i" ]; then
    continue
  fi
  echo $i
  if [ -f "original/$i" ]; then
    echo "Already converted, using original file as source"
  else
    mv "$i" "original/$i"
  fi
  sox "original/$i" "$i" vol 0.1 treble 5 1000
done
echo "Done."

