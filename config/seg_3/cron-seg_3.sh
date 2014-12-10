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
       "192_168_3_61-ps09"            # array[12]
       "192_168_3_62-ps10"            # array[12]
       "192_168_3_63-ps11"            # array[12]
       "192_168_3_41-pws06"           # array[13]
       "192_168_3_42-pws07"           # array[14]
       "192_168_3_43-pws08"           # array[15]
       "192_168_3_46-pws01"           # array[16]
       "192_168_3_47-pws02"           # array[17]
       "192_168_3_33-bt02"            # array[18]
       "192_168_3_34-R410_2"          # array[19]
       "192_168_3_35-R410_3"          # array[20]
       "192_168_3_36-R410_4"          # array[21]
       "192_168_3_37-R410_5"          # array[22]
       "192_168_3_38-R410_6"          # array[23]
       "192_168_3_39-R410_7"          # array[24]
       "192_168_3_165-ws19"           # array[25]
       "192_168_3_166-ws20"           # array[26]
       "192_168_3_167-ws21"           # array[27]
       "192_168_3_168-ws22"           # array[28]
       "192_168_3_169-ws23"           # array[29]
       "192_168_3_170-ws24"           # array[30]
       "192_168_3_171-ws25"           # array[31]
       "192_168_3_176-ws26"           # array[32]
       "192_168_3_177-ws27"           # array[33]
       "192_168_3_178-ws28"           # array[34]
       "192_168_3_179-ws29"           # array[35]
       "192_168_3_180-ws30"           # array[36]
       "192_168_3_181-ws31"           # array[37]
       "192_168_3_182-ws32"           # array[38]
       "192_168_3_65-R410_33"         # array[39]
       "192_168_3_66-R410_34"         # array[39]
       "192_168_3_67-R410_35"         # array[39]
       "192_168_3_68-R410_36"         # array[39]
       "192_168_3_69-R410_37"         # array[39]
       "192_168_3_70-R410_38"         # array[39]
       "192_168_3_71-R410_39"         # array[39]
       "192_168_3_76-R410_44"         # array[39]
       "192_168_3_77-R410_45"         # array[39]
       "192_168_3_78-R410_46"         # array[39]
       "192_168_3_79-R410_47"         # array[39]
       "192_168_3_80-R410_48"         # array[39]
       "192_168_3_81-R410_49"         # array[39]
       "192_168_3_82-R410_50"         # array[55]
       "192_168_3_72-lb07"            # array[56]
       "192_168_3_73-lb08"            # array[57]
       "192_168_3_83-R410_51"         # array[55]
       "192_168_3_84-R410_52"         # array[55]
       "192_168_3_87-R410_55"         # array[55]
       "192_168_3_88-R410_56"         # array[55]
       "192_168_3_89-R410_57"         # array[62]
       "192_168_3_74-pdb01"           # array[57]
       "192_168_3_75-pdb02"           # array[57]
       "192_168_3_85-pws03"           # array[65]
       "192_168_3_86-pws04"           # array[66]
       "192_168_3_148-ss15"           # array[25]
       "192_168_3_149-ss16"           # array[25]
       "192_168_3_150-ss17"           # array[25]
       "192_168_3_151-ss18"           # array[25]
       "192_168_3_153-ss19"           # array[25]
       "192_168_3_154-ss20"           # array[72]
       ) 


num=0
while [ $num -ne 73 ]                # array[ i + 1 ]
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
