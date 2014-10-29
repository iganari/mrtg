#!/bin/bash -x
#
# 20140421

Dir='/deploy/mrtg/config/seg_4/la'
cfg='-la.cfg'
env LANG=C /usr/bin/mrtg $Dir/192_168_4_43-cmb$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_46-pws09$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_47-nrt$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_143-cmb01$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_32-R420-2$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_33-R420-3$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_34-R420-4$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_35-R420-5$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_36-R420-6$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_37-R420-7$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_38-R420-8$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_39-R420-9$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_40-R420-10$cfg
env LANG=C /usr/bin/mrtg $Dir/192_168_4_41-R420-11$cfg
