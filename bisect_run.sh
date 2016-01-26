#!/usr/bin/env bash

ln -sf ../nunchaku/_build/src/

rm -f bisect*.out

# run nunchaku on every file
find -name '*.nun' -print | while read i ; do
  echo "run on $i...";
  nunchaku --timeout 5 "$i" --print-all > /dev/null ;
done

TARGET_DIR=bisect

bisect-ppx-report -html "$TARGET_DIR" report bisect*.out
firefox "file:///$PWD/$TARGET_DIR.html/index.html"

