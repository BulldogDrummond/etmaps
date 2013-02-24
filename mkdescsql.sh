#!/bin/sh

for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  if [ $FILE_NAME = "BUILTIN" ]; then
    cd maps/BUILTIN
  else
    cd maps/${MAP_NAME}
  fi
  MAP_BRIEFING=`cat ${MAP_NAME}.desc`
  echo "UPDATE map_data SET md_briefing = \"${MAP_BRIEFING}\" WHERE md_mapname = \"${MAP_NAME}\";"
  cd ../..
done

# EOF
