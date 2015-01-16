#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_2'
htmlDir='/deploy/mrtg/app/views/seg_2'
LIST='serverlist-seg_2'


while read SERVER_LIST 
  do     
    # for trafic
    env LANG=C /usr/bin/mrtg ${Dir}/tr/${SERVER_LIST}-tr.cfg
    # for la
    env LANG=C /usr/bin/mrtg ${Dir}/la/${SERVER_LIST}-la.cfg
    # for mem
    env LANG=C /usr/bin/mrtg ${Dir}/mem/${SERVER_LIST}-mem.cfg
    # for hdd
    env LANG=C /usr/bin/mrtg ${Dir}/hdd/${SERVER_LIST}-hdd.cfg
    
  done < ${Dir}/${LIST}
nkf -w --overwrite `find $htmlDir/ -name "*.html"`

exit
