#!/bin/bash -x
#
# 20140421

echo 'renew files ?'

read ans
echo '1st'
env LANG=C /usr/bin/mrtg /etc/mrtg/$ans

echo '2st'
env LANG=C /usr/bin/mrtg /etc/mrtg/$ans

echo '3st'
env LANG=C /usr/bin/mrtg /etc/mrtg/$ans
