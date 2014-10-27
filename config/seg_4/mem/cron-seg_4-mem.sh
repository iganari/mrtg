#!/bin/bash -x
#
# 20140421

Dir='/deploy/mrtg/config/seg_4/mem'
env LANG=C /usr/bin/mrtg $Dir/192_168_4_47-nrt-mem.cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_143-cmb01-mem.cfg
