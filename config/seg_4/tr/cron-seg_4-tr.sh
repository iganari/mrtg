#!/bin/bash -x
#
# 20140421

Dir='/deploy/mrtg/config/seg_4/tr'
env LANG=C /usr/bin/mrtg $Dir/192_168_4_43-cmb-tr.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_46-pws09-tr.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_47-nrt-tr.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_143-cmb01-tr.cfg
