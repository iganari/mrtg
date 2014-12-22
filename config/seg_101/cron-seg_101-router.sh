#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_4'
htmlDir='/deploy/mrtg/app/views/seg_4'

# setting config-filename
array=("192_168_4_1-aucfan-esu2-1"   # array[0]
       "192_168_4_2-aucfan-esu2-2"   # array[1]
       ) 


num=0
while [ $num -ne 2 ]                # array[ i + 1 ]
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    num=`expr $num + 1`
  done
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
