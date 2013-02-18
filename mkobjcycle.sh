#!/bin/sh

MAPLIMIT="d61"

echo "/////////////////////////////////////////////////////////////////////////"
echo "//"
echo "//   RedStar:ET"
echo "//   Objective Cycle Configuration  --  Map Rotation"
echo "//"
echo "/////////////////////////////////////////////////////////////////////////"
echo "//"
echo "// Data Source   : Generated from mapindex.dat"
echo "//"
echo "// Region Codes  : 00 - Unknown"
echo "//                 01 - North Africa"
echo "//                 02 - Central Europe"
echo "//                 03 - Northern Europe"
echo "//"
echo "// Compass Codes : 0  - Lower"
echo "//                 1  - Upper"
echo "//"
echo "// Daylight Codes: 0  - Day"
echo "//                 1  - Night"
echo "//"
echo "/////////////////////////////////////////////////////////////////////////"
echo ""

DNUM=1
for MAPIDX in `cat mapindex.dat | grep -v _CODE`
do
  ZF=""
  NEXTD=`expr $DNUM + 1`
  if [ $NEXTD -lt 11 ]; then
    ZF="0"
  fi
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
  echo "// Map        : ${REGION_CODE}-${ORDER}"
  echo "// Region     : ${REGION_NAME} / ${COMPASS}"
  echo "// Conditions : ${WEATHER} / ${DAYLIGHT}"
  echo "// Map Source : ${MAP_NAME} / ${FILE_NAME}"
  THIS_OM="d${ZF}${DNUM}"
  NEXT_OM="d${ZF}${NEXTD}"
  if [ $NEXT_OM = "d010" ]; then
    NEXT_OM="d10"
  fi
  if [ $NEXT_OM = $MAPLIMIT ]; then
    NEXT_OM="d01"
  fi
  echo "set ${THIS_OM} \"set g_gametype 2 ; map ${MAP_NAME} ; set nextmap vstr ${NEXT_OM}\""
  echo ""
  DNUM=$NEXTD
done
echo "vstr d01"
echo ""
echo "// End of File"
echo ""

# EOF

