#!/usr/bin/env bash
TITLE="$1"
IN="/in"
mkdir "extract_$TITLE"
cd "extract_$TITLE"
dvdbackup -n dvd -t "$TITLE" -i "$IN" -o .
cd ./*/VIDEO_TS
FIRST_VOB=$(echo *.VOB | cut -f 1 -d ' ')
BASE=$(echo $FIRST_VOB | cut -b -6)
cp $(realpath $IN)/VIDEO_TS/$BASE*.IFO .
cp $(realpath $IN)/VIDEO_TS/$BASE*.BUP .
cat `echo *.VOB` > JOINED.VOB
rm `echo VTS*.VOB`
mv JOINED.VOB "$BASE"_1.VOB
FINAL="$(realpath .)"
cd ../../..
mv "$FINAL"/* /out
rm -r "extract_$TITLE"
chmod a+rw /out/*.*
