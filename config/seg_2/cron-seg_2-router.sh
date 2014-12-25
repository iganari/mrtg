#!/bin/bash
#
# 2014/12/04

# Difine directory
Dir='/deploy/mrtg/config/seg_2'
htmlDir='/deploy/mrtg/app/views/seg_2'

# setting config-filename
array=("192_168_2_14-afn-bitisle-14"   # array[0]
       "192_168_2_13-afn-bitisle-13"   # array[0]
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
