#!/bin/sh

/bin/echo -ne "Enter the path where the omni-bot directory is installed: "
read OMNIPATH

for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    tar -xzvf maps/BUILTIN/BUILTIN-omnibot.tgz -C ${OMNIPATH}
  else
    tar -xzvf maps/${MAP_NAME}/${MAP_NAME}-omnibot.tgz -C ${OMNIPATH}
  fi
done

