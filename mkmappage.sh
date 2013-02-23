#!/bin/sh

for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  REGION_CODE=`echo $MAPIDX | awk -F: '{print $1}'`
  ORDER=`echo $MAPIDX | awk -F: '{print $2}'`
  REGION_NAME=`echo $MAPIDX | awk -F: '{print $3}' | tr "_" " "`
  COMPASS=`echo $MAPIDX | awk -F: '{print $4}'`
  NIGHT=`echo $MAPIDX | awk -F: '{print $6}'`
  MTIME=`echo $MAPIDX | awk -F: '{print $7}'`
  WEATHER=`echo $MAPIDX | awk -F: '{print $8}'`
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  MAP_LONGNAME=`echo $MAPIDX | awk -F: '{print $10}' | tr "_" " "`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  TLIMIT=`echo $MAPIDX | awk -F: '{print $12}'`
  DEFEND=`echo $MAPIDX | awk -F: '{print $13}'`
  MAPID="${REGION_CODE}-${ORDER}"
  if [ $FILE_NAME = "BUILTIN" ]; then
    cd maps/BUILTIN
  else
    cd maps/${MAP_NAME}
  fi
  MAP_BRIEFING=`cat ${MAP_NAME}.desc | tr -d "\n"`
  MAP_HTML="${MAP_NAME}.html"
  MAP_IMG="${MAP_NAME}.jpg"
  MAP_CCIMG="${MAP_NAME}_cc.jpg"
  MAP_FILE="${MAP_NAME}.pk3"
  MAP_BOTS="${MAP_NAME}-omnibot.tgz"
  # Create html file
  echo "<html>" > ${MAP_HTML}
  echo "<head>" >> ${MAP_HTML}
  echo "<title>Redstar:ET - Map: ${MAP_LONGNAME}</title>" >> ${MAP_HTML}
  echo "</head>" >> ${MAP_HTML}
  echo "<body>" >> ${MAP_HTML}
  echo "<center>" >> ${MAP_HTML}
  echo "<table width=800>" >> ${MAP_HTML}
  echo "<tr><td colspan=2 align=center><h3>Map: ${MAPID} - ${MAP_LONGNAME}</h3></td></tr>" >> ${MAP_HTML}
  echo "<tr><td align=right><IMG SRC=${MAP_IMG}></td><td><IMG SRC=${MAP_CCIMG}></td></tr>" >> ${MAP_HTML}
  echo "</table>" >> ${MAP_HTML}
  echo "<table width=800>" >> ${MAP_HTML}
  echo "<tr><td>ID: ${MAPID}</td><td>${MAP_LONGNAME} (${MAP_NAME})</td></tr>" >> ${MAP_HTML}
  echo "<tr><td>Region:</td><td>${REGION_NAME} (${REGION_CODE}) / ${COMPASS}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td>Conditions:</td><td>${MTIME} / ${WEATHER}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td>Defending:</td><td>${DEFEND}</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>&nbsp;</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>Briefing:</td></tr>" >> ${MAP_HTML}
  echo "<tr><td colspan=2>${MAP_BRIEFING}</td></tr>" >> ${MAP_HTML} 
  echo "<tr><td colspan=2><br>Time Limit: ${TLIMIT} minutes<br>&nbsp;</td></tr>" >> ${MAP_HTML}
  if [ $FILE_NAME = "BUILTIN" ]; then
    echo "<tr><td colspan=2>This map is included.</td></tr>" >> ${MAP_HTML}
    echo "<tr><td>Omni-Bot File:</td><td><a href=BUILTIN-omnibot.tgz>BUILTIN-omnibot.tgz</a></td></tr>" >> ${MAP_HTML}
  else
    echo "<tr><td>Map File:</td><td><a href=${MAP_FILE}>${MAP_FILE}</a></td></tr>" >> ${MAP_HTML}
    echo "<tr><td>Omni-Bot File:</td><td><a href=${MAP_BOTS}>${MAP_BOTS}</a></td></tr>" >> ${MAP_HTML}
  fi
  echo "<tr><td colspan=2 align=center><br>Redstar:ET</a></td></tr>" >> ${MAP_HTML}
  echo "</table>" >> ${MAP_HTML}
  echo "</center>" >> ${MAP_HTML}
  echo "</body>" >> ${MAP_HTML}
  echo "</html>" >> ${MAP_HTML}
  cd ../..
done

# EOF
