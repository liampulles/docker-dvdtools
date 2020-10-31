#!/usr/bin/env bash
TITLE="$1"
IN="$2"
OUT="$3"
mkdir -p "$OUT"/extract
cd "$OUT"/extract
dvdbackup -n dvd -t "$TITLE" -i "$IN" -o .
cd ./*/VIDEO_TS
FIRST_VOB=$(echo *.VOB | cut -f 1 -d ' ')
BASE=$(echo $FIRST_VOB | cut -b -6)
cp $(realpath $IN)/VIDEO_TS/$BASE*.IFO VTS_01_1.IFO
cp $(realpath $IN)/VIDEO_TS/$BASE*.BUP VTS_01_1.BUP
cat `echo *.VOB` > JOINED.VOB
rm `echo VTS*.VOB`
mv JOINED.VOB VTS_01_1.VOB
FINAL="$(realpath .)"
cd ../../..
mv "$FINAL"/* "$OUT"
rm -r extract
chmod a+rw "$OUT"/*.*
