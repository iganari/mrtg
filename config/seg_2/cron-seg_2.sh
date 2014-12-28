#!/bin/bash -x
#
# 2014/11/06

# Difine directory
Dir='/deploy/mrtg/config/seg_2'
htmlDir='/deploy/mrtg/app/views/seg_2'

# setting config-filename
array=("192_168_2_159-mad"            # array[0]
       "192_168_2_160-bcn"            # array[]
       "192_168_2_150-aucuniv01"      # array[]
       "192_168_2_151-aucuniv02"      # array[]
       "192_168_2_55-jfk"             # array[]
       "192_168_2_155-ssl10"          # array[]
       "192_168_2_156-jfk02"          # array[]
       "192_168_2_157-ws33"           # array[]
       "192_168_2_147-sfo"            # array[]
       "192_168_2_247-sfo01"          # array[]
       "192_168_2_248-sfo02"          # array[10]
       "192_168_2_249-sfo03"          # array[10]
       "192_168_2_158-ps-host"        # array[10]
       "192_168_2_133-ps52"           # array[10]
       "192_168_2_123-wsapi02"        # array[10]
       "192_168_2_125-ssapi02"        # array[10]
       "192_168_2_122-wsapi01"        # array[10]
       "192_168_2_115-wspf02"         # array[10]
       "192_168_2_119-dspf02"         # array[10]
       "192_168_2_145-cr04"           # array[10]
       "192_168_2_117-sspf02"         # array[20]
       "192_168_2_124-ssapi01"        # array[20]
       "192_168_2_84-ss14"            # array[20]
       "192_168_2_68-cs02"            # array[20]
       "192_168_2_61-cs01"            # array[20]
       "192_168_2_70-se02"            # array[20]
       "192_168_2_69-se01"            # array[20]
       "192_168_2_143-cr02"           # array[20]
       "192_168_2_224-img02a"         # array[20]
       "192_168_2_211-img01"          # array[20]
       "192_168_2_222-img02"          # array[30]
       "192_168_2_223-img03a"         # array[30]
       "192_168_2_134-ws11"           # array[30]
       "192_168_2_135-ws12"           # array[30]
       "192_168_2_136-ws13"           # array[30]
       "192_168_2_137-ws14"           # array[30]
       "192_168_2_138-ws15"           # array[30]
       "192_168_2_139-ws16"           # array[30]
       "192_168_2_140-ws17"           # array[30]
       "192_168_2_103-dp01"           # array[30]
       "192_168_2_231-f01udb01"       # array[40]
       "192_168_2_232-f01udb02"       # array[40]
       "192_168_2_235-bk05"           # array[40]
#       "192_168_2_41-lb05"            # array[40]
       "192_168_2_42-lb06"            # array[40]
       "192_168_2_101-ts01"           # array[40]
       "192_168_2_116-sspf01"         # array[40]
       "192_168_2_118-dspf01"         # array[40]
       "192_168_2_144-cr03"           # array[40]
       "192_168_2_183-f01ws02"        # array[49]
       ) 


num=0
while [ $num -ne 50 ]                # array[ i + 1 ]
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
