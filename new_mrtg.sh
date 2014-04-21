#!/bin/bash -x
#
# 20140421

echo 'renew files ?'

read ans
env LANG=C /usr/bin/mrtg /etc/mrtg/$ans
