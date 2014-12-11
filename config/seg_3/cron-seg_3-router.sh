#!/bin/bash
#
# 2014/12/04

# Difine directory
Dir='/deploy/mrtg/config/seg_3'
htmlDir='/deploy/mrtg/app/views/seg_3'

# setting config-filename
array=("192_168_3_1-aucfan-idcf-1"   # array[0]
       "192_168_3_2-aucfan-idcf-4"   # array[1]
       "192_168_3_3-aucfan-idcf-3"   # array[2]
       "192_168_3_4-aucfan-idcf-4"   # array[3]
       ) 


num=0
while [ $num -ne 4 ]                # array[ i + 1 ]
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    num=`expr $num + 1`
  done
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
