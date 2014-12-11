#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_2'
htmlDir='/deploy/mrtg/app/views/seg_2'

# setting config-filename
array=("192_168_2_159-mad"            # array[0]
       "192_168_2_160-bcn"            # array[]
       "192_168_2_150-aucuniv01"      # array[]
       "192_168_2_55-jfk"             # array[]
       "192_168_2_155-ssl10"          # array[]
       "192_168_2_156-jfk02"          # array[]
       "192_168_2_157-ws33"           # array[]
       "192_168_2_147-sfo"            # array[]
       "192_168_2_247-sfo01"          # array[]
       "192_168_2_248-sfo02"          # array[]
       "192_168_2_249-sfo03"          # array[10]
       ) 


num=0
while [ $num -ne 11 ]                # array[ i + 1 ]
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    # for la
    env LANG=C /usr/bin/mrtg ${Dir}/la/${array[${num}]}-la.cfg
    # for mem
    env LANG=C /usr/bin/mrtg ${Dir}/mem/${array[${num}]}-mem.cfg
    # for hdd
    env LANG=C /usr/bin/mrtg ${Dir}/hdd/${array[${num}]}-hdd.cfg
    
    num=`expr $num + 1`
  done
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
