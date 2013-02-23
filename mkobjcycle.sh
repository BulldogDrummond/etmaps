#!/bin/sh

OBJFILE="objectivecycle.cfg"

IDXROWS=`cat mapindex.dat | wc -l`
MAPLIMIT="d${IDXROWS}"

echo "/////////////////////////////////////////////////////////////////////////" > $OBJFILE
echo "//" >> $OBJFILE
echo "//   RedStar:ET" >> $OBJFILE
echo "//   Objective Cycle Configuration  --  Map Rotation" >> $OBJFILE
echo "//" >> $OBJFILE
echo "/////////////////////////////////////////////////////////////////////////" >> $OBJFILE
echo "//" >> $OBJFILE
echo "// Data Source   : Generated from mapindex.dat" >> $OBJFILE
echo "//" >> $OBJFILE
echo "// Region Codes  : 00 - Unknown" >> $OBJFILE
echo "//                 01 - North Africa" >> $OBJFILE
echo "//                 02 - Central Europe" >> $OBJFILE
echo "//                 03 - Northern Europe" >> $OBJFILE
echo "//" >> $OBJFILE
echo "// Compass Codes : 0  - Lower" >> $OBJFILE
echo "//                 1  - Upper" >> $OBJFILE
echo "//" >> $OBJFILE
echo "// Daylight Codes: 0  - Day" >> $OBJFILE
echo "//                 1  - Night" >> $OBJFILE
echo "//" >> $OBJFILE
echo "/////////////////////////////////////////////////////////////////////////" >> $OBJFILE
echo "" >> $OBJFILE

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
  MTIME=`echo $MAPIDX | awk -F: '{print $7}'`
  WEATHER=`echo $MAPIDX | awk -F: '{print $8}'`
  MAP_NAME=`echo $MAPIDX | awk -F: '{print $9}'`
  MAP_LNAME=`echo $MAPIDX | awk -F: '{print $10}' | tr "_" " "`
  FILE_NAME=`echo $MAPIDX | awk -F: '{print $11}'`
  TLIMIT=`echo $MAPIDX | awk -F: '{print $12}'`
  DEFEND=`echo $MAPIDX | awk -F: '{print $13}'`
  echo "// Name       : ${MAP_LNAME}" >> $OBJFILE
  echo "// Defending  : ${DEFEND}" >> $OBJFILE
  echo "// Time Limit : ${TLIMIT} min." >> $OBJFILE
  echo "// Map ID     : ${REGION_CODE}-${ORDER}" >> $OBJFILE
  echo "// Region     : ${REGION_NAME} / ${COMPASS}" >> $OBJFILE
  echo "// Conditions : ${WEATHER} / ${MTIME}" >> $OBJFILE
  echo "// Map Source : ${MAP_NAME} / ${FILE_NAME}" >> $OBJFILE
  THIS_OM="d${ZF}${DNUM}"
  NEXT_OM="d${ZF}${NEXTD}"
  if [ $NEXT_OM = "d010" ]; then
    NEXT_OM="d10"
  fi
  if [ $NEXT_OM = $MAPLIMIT ]; then
    NEXT_OM="d01"
  fi
  echo "set ${THIS_OM} \"set g_gametype 2 ; map ${MAP_NAME} ; set nextmap vstr ${NEXT_OM}\"" >> $OBJFILE
  echo "" >> $OBJFILE
  DNUM=$NEXTD
done
echo "vstr d01" >> $OBJFILE
echo "" >> $OBJFILE
echo "// End of File" >> $OBJFILE
echo "" >> $OBJFILE

# EOF

