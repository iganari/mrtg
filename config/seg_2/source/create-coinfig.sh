#!/bin/bash
#
# create 2014/10/28

echo "private ip ?"
read ansip
echo "hostname ?"
read anshost
echo "what's rack? (e.g. M01, i08)"
read ansrackspace
echo "rack no? (e.g. 21, 08)"
read ansracknum
echo -e "hostOS ? or kvmOS ?""\n""[HOST/KVM]"
read ansos

echo -e "\n\n""Are you sure ??"
echo -e "# private IP""\n"" ${ansip}""\n""# hostname""\n"" ${anshost}""\n""# rack number""\n"" no.${ansracknum}""\n""# OS""\n"" ${ansos}"

echo -e "\n\n""It is match with this ?"
echo "[y/N]"
read key
    if [ "${key}" = "N" ]; then
        echo "Agaain !"
        sh create-coinfig.sh
    elif [ "${key}" = "y" ]; then 
        PRIIP=`echo ${ansip} | sed -e "s/\./_/g"`
        HOST="${anshost}"
        cp -a ./PRIVATEIP-HOSTNAME-hdd.cfg ./${PRIIP}-${HOST}-hdd.cfg
        cp -a ./PRIVATEIP-HOSTNAME-mem.cfg ./${PRIIP}-${HOST}-mem.cfg
        cp -a ./PRIVATEIP-HOSTNAME-la.cfg ./${PRIIP}-${HOST}-la.cfg
        cp -a ./PRIVATEIP-HOSTNAME-tr.cfg ./${PRIIP}-${HOST}-tr.cfg

    for CFG in ./$PRIIP-$HOST-{hdd,mem,la,tr}.cfg
        do
            sed -i "s/PRIVATEIP/${ansip}/g" ./$CFG
            sed -i "s/HOSTNAME/${anshost}/g" ./$CFG
            sed -i "s/RNUM/${ansracknum}/g" ./$CFG
            sed -i "s/RACK/${ansrackspace}/g" ./$CFG
            sed -i "s/HOSTOS/${ansos}/g" ./$CFG
        done
    else
        echo "See you !!"    
    fi

break 0
