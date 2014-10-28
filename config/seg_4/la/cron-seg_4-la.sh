#!/bin/bash -x
#
# 20140421

Dir='/deploy/mrtg/config/seg_4/la'
env LANG=C /usr/bin/mrtg $Dir/192_168_4_43-cmb-la.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_46-pws09-la.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_47-nrt-la.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_143-cmb01-la.cfg
