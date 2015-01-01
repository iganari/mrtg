#!/bin/bash
#
# 2014/12/04

# Difine directory
Dir='/deploy/mrtg/config/seg_2'
htmlDir='/deploy/mrtg/app/views/seg_2'

# setting config-filename
array=("192_168_2_14-afn-bitisle-14"   # array[0]
       "192_168_2_13-afn-bitisle-13"   # array[0]
       "192_168_2_3-afn-bitisle-3"     # array[0]
       "192_168_2_4-afn-bitisle-4"     # array[0]
       "192_168_2_1-afn-bitisle-1"     # array[4]
       ) 


num=0
while [ $num -ne 5 ]                # array[ i + 1 ]
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    num=`expr $num + 1`
  done
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
