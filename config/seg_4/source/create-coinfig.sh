#!/bin/bash
#
# create 2014/10/28

echo "private ip ?"
read ansip
echo "hostname ?"
read anshost
echo "rack no? (e.g. i08, A01)"
read ansrack
echo -e "hostOS ? or kvmOS ?""\n""[HOST/KVM]"
read anskvm

echo -e "\n\n""Are you sure ??"
echo -e "# private IP""\n"" $ansip""\n""# hostname""\n"" $anshost""\n""# rack number""\n"" $ansrack""\n""# OS""\n"" $anskvm"

echo -e "\n\n""It is match with this ?"
echo "[y/N]"
read key
    if [ "$key" = "N" ]; then
        echo "Agaain !"
        sh create-coinfig.sh
    elif [ "$key" = "y" ]; then 
        echo "iine"
        PRIIP=`echo $ansip | sed -e "s/\./_/g"`
        HOST="$anshost"
        cp -a ./PRIVATEIP-HOSTNAME-hdd.cfg ./$PRIIP-$HOST-hdd.cfg
        cp -a ./PRIVATEIP-HOSTNAME-mem.cfg ./$PRIIP-$HOST-mem.cfg
        cp -a ./PRIVATEIP-HOSTNAME-la.cfg ./$PRIIP-$HOST-la.cfg
        cp -a ./PRIVATEIP-HOSTNAME-tr.cfg ./$PRIIP-$HOST-tr.cfg


    else
        echo "See you !!"    
    fi

break 0
