#!/bin/sh

echo "<html>"
echo "<head>"
echo "<title>RedStar:ET Downloads</title>"
echo "</head>"
echo "<body>"
echo "<h3>Map Archive</h3>"
echo "<hr>"
echo "<br>"
echo "<center>"
echo "<table>"
echo "<tr><td>Map ID</td><td>Map Name</td><td>Region</td><td>Conditions</td><td>Filename</td></tr>"

DNUM=1
for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  REGION_CODE=`echo $MAPIDX | awk -F: '{print $1}'`
  ORDER=`echo $MAPIDX | awk -F: '{print $2}'`
  REGION_NAME=`echo $MAPIDX | awk -F: '{print $3}' | tr "_" " "`
  COMPASS=`echo $MAPIDX | awk -F: '{print $4}'`
  COMP_CODE=`echo $MAPIDX | awk -F: '{print $5}'`
  NIGHT=`echo $MAPIDX | awk -F: '{print $6}'`
  WEATHER=`echo $MAPIDX | awk -F: '{print $7}'`
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $8}'`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  if [ $NIGHT = "1" ]; then
    DAYLIGHT="NIGHT"
  else
    DAYLIGHT="DAY"
  fi
  echo "<tr><td>${REGION_CODE}-${ORDER}</td><td>"
  if [ ${FILE_NAME} = "BUILTIN" ]; then
    echo "${MAP_NAME}"
  else
    echo "<a href=${MAP_NAME}.html>${MAP_NAME}</a>"
  fi
  echo "</td><td>${REGION_NAME} / ${COMPASS}</td><td>${DAYLIGHT}/${WEATHER}</td><td>"
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
echo "<center>RedStar:ET</center>"
echo "</body>"
echo "</html>"

# EOF
