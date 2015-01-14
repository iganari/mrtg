#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_101'
htmlDir='/deploy/mrtg/app/views/seg_101'

###  # setting config-filename
###  array=("192_168_101_21-uranus"         # array[0]
###         "192_168_101_22-saturn"         # array[1]
###         "192_168_101_23-jupiter"        # array[2]
###         "192_168_101_24-io"             # array[3]
###         "192_168_101_25-europa"         # array[4]
###         "192_168_101_135-localhost"     # array[5]
###         "192_168_101_235-development2"     # array[5]
###         ) 
###  

LIST='serverlist-seg_101'


while read SERVER_LIST 
  do     
#    # for trafic
#    env LANG=C /usr/bin/mrtg ${Dir}/tr/${array[${num}]}-tr.cfg
    # for la
    env LANG=C /usr/bin/mrtg ${Dir}/la/${SERVER_LIST}-la.cfg
    # for mem
    env LANG=C /usr/bin/mrtg ${Dir}/mem/${SERVER_LIST}-mem.cfg
    # for hdd
    env LANG=C /usr/bin/mrtg ${Dir}/hdd/${SERVER_LIST}-hdd.cfg
    
  done < ${LIST}
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
