#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_4'
htmlDir='/deploy/mrtg/app/views/seg_4'

# setting config-filename
array=("192_168_4_32-R420-2"     # array[0]
       "192_168_4_33-R420-3"     # array[1]
       "192_168_4_34-R420-4"     # array[2]
       "192_168_4_35-R420-5"     # array[3]
       "192_168_4_36-R420-6"     # array[4]
       "192_168_4_37-R420-7"     # array[5]
       "192_168_4_38-R420-8"     # array[6]
       "192_168_4_39-R420-9"     # array[7]
       "192_168_4_40-R420-10"    # array[8]
       "192_168_4_41-R420-11"    # array[9]
       "192_168_4_42-sin"        # array[10]
       "192_168_4_43-cmb"        # array[11]
       "192_168_4_46-pws09"      # array[12]
       "192_168_4_47-nrt"        # array[13]
       "192_168_4_44-R420-14"    # array[14]
       "192_168_4_45-R420-15"    # array[15]
       "192_168_4_48-R420-18"    # array[16]
       "192_168_4_49-R420-19"    # array[17]
       "192_168_4_50-R420-20"    # array[18]
       "192_168_4_55-ceb"        # array[19]
       "192_168_4_56-kvm01"      # array[20]
       "192_168_4_131-ssl03"     # array[21]
       "192_168_4_133-ps03b"     # array[22]
       "192_168_4_132-ps31"      # array[23]
       "192_168_4_134-ps35"      # array[24]
       "192_168_4_135-ps37"      # array[25]
       "192_168_4_136-ps39"      # array[26]
       "192_168_4_137-ps40"      # array[27]
       "192_168_4_138-ps41"      # array[28]
       "192_168_4_143-cmb01"     # array[29]
       ) 


num=0
while [ $num -ne 30 ]
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
