#!/bin/sh

if [ ! -d unpacked ]; then
  mkdir unpacked
else
  rm -rf unpacked
  mkdir unpacked
fi

cd unpacked

for MAPIDX in `cat ../mapindex.dat | grep -v _CODE | grep -v BUILTIN`
do
  REGION_CODE=`echo $MAPIDX | awk -F: '{print $1}'`
  ORDER=`echo $MAPIDX | awk -F: '{print $2}'`
  REGION_NAME=`echo $MAPIDX | awk -F: '{print $3}' | tr "_" " "`
  COMPASS=`echo $MAPIDX | awk -F: '{print $4}'`
  NIGHT=`echo $MAPIDX | awk -F: '{print $6}'`
  WEATHER=`echo $MAPIDX | awk -F: '{print $7}'`
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $8}'`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  if [ $NIGHT = "1" ]; then
    DAYLIGHT="NIGHT"
  else
    DAYLIGHT="DAY"
  fi
  MAPID="${REGION_CODE}-${ORDER}"
  mkdir ${MAP_NAME}
  cd ${MAP_NAME}
  unzip -o ../../${FILE_NAME}
  # Write arena file to map dir as MAPNAME.desc
  cat scripts/${MAP_NAME}.arena > ../../${MAP_NAME}.desc
  # Parse the desc file
  MAP_LONGNAME=`cat ../../${MAP_NAME}.desc | grep longname | awk -F\" '{print $2}' | tr -d '"'` 
  MAP_BRIEFING=`cat ../../${MAP_NAME}.desc | grep briefing | awk -F\" '{print $2}' | tr -d '"' | sed -e "s/\n/<br>/g"`
  MAP_HTML="../../${MAP_NAME}.html"
  # Create html file
  echo "<html>" > ${MAP_HTML}
  echo "<head>" >> ${MAP_HTML}
  echo "<title>RedStar:ET - Map: ${MAP_LONGNAME}</title>" >> ${MAP_HTML}
  echo "</head>" >> ${MAP_HTML}
  echo "<body>" >> ${MAP_HTML}
  echo "<h3>Map: ${MAPID} - ${MAP_LONGNAME}</h3>" >> ${MAP_HTML}
  echo "<hr>" >> ${MAP_HTML}
  echo "<br>" >> ${MAP_HTML}
  echo "<center>" >> ${MAP_HTML}
  echo "<table width=90%>" >> ${MAP_HTML}
  echo "<tr><td>ID: ${MAPID}</td><td>${MAP_LONGNAME} / ${MAP_NAME}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td>Region:</td><td>${REGION_NAME} (${REGION_CODE}) / ${COMPASS}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td>Conditions:</td><td>${DAYLIGHT} / ${WEATHER}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>&nbsp;</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>Briefing:</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>${MAP_BRIEFING}</td></tr>" >> ${MAP_HTML} 
  echo "</table>" >> ${MAP_HTML}
  echo "</center>" >> ${MAP_HTML}
  echo "<br>" >> ${MAP_HTML}
  echo "<hr>" >> ${MAP_HTML}
  echo "<center>RedStar:ET</center>" >> ${MAP_HTML}
  echo "</body>" >> ${MAP_HTML}
  echo "</html>" >> ${MAP_HTML}
  # Remove the desc file
  rm ../../${MAP_NAME}.desc
  cd ..
done

# EOF
