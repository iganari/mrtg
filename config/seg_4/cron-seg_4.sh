#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_4'
htmlDir='/deploy/mrtg/app/views/seg_4'

# setting config-filename
array=("192_168_4_32-R420-2"         # array[0]
       "192_168_4_33-R420-3"         # array[1]
       "192_168_4_34-R420-4"         # array[2]
       "192_168_4_35-R420-5"         # array[3]
       "192_168_4_36-R420-6"         # array[4]
       "192_168_4_37-R420-7"         # array[5]
       "192_168_4_38-R420-8"         # array[6]
       "192_168_4_40-R420-10"        # array[7]
       "192_168_4_42-sin"            # array[8]
       "192_168_4_43-cmb"            # array[9]
       "192_168_4_46-pws09"          # array[10]
       "192_168_4_47-nrt"            # array[10]
       "192_168_4_44-R420-14"        # array[10]
       "192_168_4_45-R420-15"        # array[10]
       "192_168_4_55-ceb"            # array[10]
       "192_168_4_133-ps03b"         # array[10]
       "192_168_4_132-ps31"          # array[10]
       "192_168_4_134-ps35"          # array[10]
       "192_168_4_135-ps37"          # array[10]
       "192_168_4_136-ps39"          # array[10]
       "192_168_4_137-ps40"          # array[20]
       "192_168_4_138-ps41"          # array[20]
       "192_168_4_142-sin01"         # array[20]
       "192_168_4_143-cmb01"         # array[20]
       "192_168_4_144-ssl01c"        # array[20]
       "192_168_4_145-ps33"          # array[20]
       "192_168_4_201-nrt01"         # array[20]
       "192_168_4_202-nrt02"         # array[20]
       "192_168_4_204-ceb01"         # array[20]
       "192_168_4_205-ceb02"         # array[20]
       "192_168_4_205-ceb02"         # array[30]
       ) 


num=0
while [ $num -ne 31 ]                # array[ i + 1 ]
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
