#!/bin/sh

if [ $# -lt 1 ]; then
  echo "usage: unpackmap MAPFILENAME"
  exit 1
fi

MAPFILE=${1}

MAPBASE=`echo $MAPFILE | awk -F. '{print $1}'`

echo "Processing $MAPBASE..."

mkdir -p working/$MAPBASE
cd working/$MAPBASE

unzip ../../map-source/$MAPFILE

echo "Map has been unpacked to working/$MAPBASE"

# EOF
