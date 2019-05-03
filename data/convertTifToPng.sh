#!/bin/bash
#  last update 4/21/19

if [[ ! $# -eq 2 ]] ; then
    printf 'usage: ./convertTifToPng.sh <inputdir> <outputdir>\n Convert all tif files in <inputdir> to png and write them to <outputdir>\n'
    exit 1
fi

if [[ ! -d "$2" ]]; then
    mkdir ./$2
fi

for f in $1/*.tif; do
    f=$(basename -- $f)
    echo "Converting $f"
    gdal_translate -of PNG $1/$f $2/${f%.*}.png > /dev/null 
done

# cleanup
rm $2/*.aux.xml

