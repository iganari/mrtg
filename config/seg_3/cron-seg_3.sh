#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_3'
htmlDir='/deploy/mrtg/app/views/seg_3'

# setting config-filename
array=("192_168_3_31-R610_1"          # array[0]
       "192_168_3_45-pdb03"           # array[1]
       "192_168_3_48-R410_16"         # array[2]
       "192_168_3_49-R410_17"         # array[3]
       "192_168_3_50-R410_18"         # array[4]
       "192_168_3_51-R410_19"         # array[5]
       "192_168_3_53-R410_21"         # array[6]
       "192_168_3_54-R410_22"         # array[7]
       "192_168_3_55-pdb04"           # array[8]
       "192_168_3_56-R410_24"         # array[9]
       "192_168_3_57-R410_25"         # array[10]
       "192_168_3_59-R410_27"         # array[11]
       "192_168_3_60-R410_28"         # array[12]
       "192_168_3_41-pws06"           # array[13]
       "192_168_3_42-pws07"           # array[14]
       "192_168_3_43-pws08"           # array[15]
       "192_168_3_46-pws01"           # array[16]
       "192_168_3_47-pws02"           # array[17]
       ) 


num=0
while [ $num -ne 18 ]                # array[ i + 1 ]
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
