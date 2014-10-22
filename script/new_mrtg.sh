#!/bin/bash -x
#
# 20140421

Dir='/deploy/mrtg/config'


echo 'renew files ?'

read ans
echo '1st'
env LANG=C /usr/bin/mrtg $Dir/$ans

echo '2st'
env LANG=C /usr/bin/mrtg $Dir/$ans

echo '3st'
env LANG=C /usr/bin/mrtg $Dir/$ans
