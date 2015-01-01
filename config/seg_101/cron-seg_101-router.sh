#!/bin/bash -x
#
# 2015/01/01

# Difine directory
Dir='/deploy/mrtg/config/seg_101'
htmlDir='/deploy/mrtg/app/views/seg_101'

# setting config-filename
array=("192_168_101_1-aucfan-humax-1"   # array[0]
       ) 


num=0
while [ $num -ne 1 ]                # array[ i + 1 ]
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    num=`expr $num + 1`
  done
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
