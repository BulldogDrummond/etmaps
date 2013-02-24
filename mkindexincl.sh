#!/bin/sh

IDXHTML="mapindex.inc.php"

echo "    <br>" > $IDXHTML
echo "    <table class=\"center\">" >> $IDXHTML
echo "      <tr><th>ID</th><th>Name</th><th>Map Name</th><th>Region</th><th>Conditions</th><th>Filename</th></tr>" >> $IDXHTML

DNUM=1
for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  REGION_CODE=`echo $MAPIDX | awk -F: '{print $1}'`
  ORDER=`echo $MAPIDX | awk -F: '{print $2}'`
  REGION_NAME=`echo $MAPIDX | awk -F: '{print $3}' | tr "_" " "`
  COMPASS=`echo $MAPIDX | awk -F: '{print $4}'`
  COMP_CODE=`echo $MAPIDX | awk -F: '{print $5}'`
  NIGHT=`echo $MAPIDX | awk -F: '{print $6}'`
  MTIME=`echo $MAPIDX | awk -F: '{print $7}'`
  WEATHER=`echo $MAPIDX | awk -F: '{print $8}'`
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  MAP_LNAME=`echo $MAPIDX | awk -F: '{print $10}' | tr "_" " "`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  TLIMIT=`echo $MAPIDX | awk -F: '{print $12}'`
  DEFEND=`echo $MAPIDX | awk -F: '{print $13}'`
  echo "      <tr><td>${REGION_CODE}-${ORDER}</td><td>" >> $IDXHTML
  echo "      ${MAP_LNAME}</td><td>" >> $IDXHTML
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    echo "      <a href=maps/BUILTIN/${MAP_NAME}.html>${MAP_NAME}</a>" >> $IDXHTML
  else
    echo "      <a href=maps/${MAP_NAME}/${MAP_NAME}.html>${MAP_NAME}</a>" >> $IDXHTML
  fi
  echo "      </td><td>${REGION_NAME} / ${COMPASS}</td><td>${MTIME}/${WEATHER}</td><td>" >> $IDXHTML
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    echo "      ${FILE_NAME}" >> $IDXHTML
  else
    echo "      <a href=maps/${MAP_NAME}/${FILE_NAME}>${FILE_NAME}</a>" >> $IDXHTML
  fi
  echo "      </td></tr>" >> $IDXHTML
  DNUM=$NEXTD
done

echo "      </table>" >> $IDXHTML
echo "      <br>" >> $IDXHTML

# EOF
