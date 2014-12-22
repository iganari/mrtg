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
       "192_168_2_151-aucuniv02"      # array[]
       "192_168_2_55-jfk"             # array[]
       "192_168_2_155-ssl10"          # array[]
       "192_168_2_156-jfk02"          # array[]
       "192_168_2_157-ws33"           # array[]
       "192_168_2_147-sfo"            # array[]
       "192_168_2_247-sfo01"          # array[]
       "192_168_2_248-sfo02"          # array[10]
       "192_168_2_249-sfo03"          # array[10]
       "192_168_2_158-ps-host"        # array[10]
       "192_168_2_133-ps52"           # array[10]
       "192_168_2_123-wsapi02"        # array[10]
       "192_168_2_125-ssapi02"        # array[10]
       "192_168_2_122-wsapi01"        # array[10]
       "192_168_2_115-wspf02"         # array[10]
       "192_168_2_119-dspf02"         # array[10]
       "192_168_2_145-cr04"           # array[10]
       "192_168_2_117-sspf02"         # array[20]
       "192_168_2_124-ssapi01"        # array[20]
       "192_168_2_84-ss14"            # array[20]
       "192_168_2_68-cs02"            # array[20]
       "192_168_2_61-cs01"            # array[20]
       "192_168_2_70-se02"            # array[20]
       "192_168_2_69-se01"            # array[20]
       "192_168_2_143-cr02"           # array[27]
       "192_168_2_224-img02a"         # array[28]
       ) 


num=0
while [ $num -ne 29 ]                # array[ i + 1 ]
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
