#!/bin/bash

#set -x
#1.conf
ADMIN_TOKEN="`openstack-config --get /etc/keystone/keystone.conf DEFAULT admin_token`"
STAT="`service openstack-keystone status`"
echo "The admin token is: "
echo "------------------------------"
echo "$ADMIN_TOKEN"
echo "------------------------------"
echo ""
echo "The service stat of keystone is: "
echo "------------------------------"
echo "$STAT"
echo "------------------------------"
echo ""
ANSWER="True"
if [ -z "$ADMIN_TOKEN" ];
then
ANSWER="False"
fi
echo "$STAT" |grep -q "stop"
if [ $? -eq 0 ];
then
ANSWER="False"
fi

echo "&&&&&&"
echo "$ANSWER"
