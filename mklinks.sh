#!/bin/sh

if [ ! -d download ]; then
  mkdir download
fi

cd download

for MAPIDX in `cat ../mapindex.dat | grep -v _CODE | grep -v BUILTIN`
do
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  ln -s ../maps/${MAP_NAME}/${FILE_NAME}
done

# EOF
