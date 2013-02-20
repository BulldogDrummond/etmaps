#!/bin/sh

echo "<html>"
echo "<head>"
echo "<title>Redstar:ET Downloads</title>"
echo "</head>"
echo "<body>"
echo "<h3>Map Archive</h3>"
echo "<hr>"
echo "<br>"
echo "<center>"
echo "<table>"
echo "<tr><td>Map ID</td><td>Name</td><td>Map Name</td><td>Region</td><td>Conditions</td><td>Filename</td></tr>"

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
  echo "<tr><td>${REGION_CODE}-${ORDER}</td><td>"
  echo "<td>${MAP_LNAME}</td><td>"
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    echo "${MAP_NAME}"
  else
    echo "<a href=${MAP_NAME}.html>${MAP_NAME}</a>"
  fi
  echo "</td><td>${REGION_NAME} / ${COMPASS}</td><td>${MTIME}/${WEATHER}</td><td>"
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    echo "${FILE_NAME}"
  else
    echo "<a href=${FILE_NAME}>${FILE_NAME}</a>"
  fi
  echo "</td></tr>"
  DNUM=$NEXTD
done

echo "</table>"
echo "</center>"
echo "<br>"
echo "<hr>"
echo "<center>Redstar:ET</center>"
echo "</body>"
echo "</html>"

# EOF
