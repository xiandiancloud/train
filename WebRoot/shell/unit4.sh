#!/bin/bash

#set -x

ANSWER="True"
unset OS_USERNAME
unset OS_PASSWORD
unset OS_TENANT_NAME
unset OS_AUTH_URL
export ADMIN_TOKEN=`openstack-config --get /etc/keystone/keystone.conf DEFAULT admin_token`
export OS_SERVICE_TOKEN=$ADMIN_TOKEN
export OS_SERVICE_ENDPOINT=http://$HOSTNAME:35357/v2.0

#1.user
USER="`keystone user-list | awk '/admin/'`"
USER1="`keystone user-list |awk '{if ($4 == \"admin\") {print}}'`"
echo "The user list in keystone is: "
echo "`keystone user-list |sed -n '1,3p'`"
echo "$USER1"
echo "`keystone user-list |sed -n '$p'`"
echo ""
DEFU="admin@example.com "
for i in $DEFU
do
echo "$USER" |grep -q "$i"
if [ $? -eq 1 ];
then
ANSWER="False"
break
fi
done

#2.tenant
TENANT="`keystone tenant-get demo`"
echo "The tenant list in keystone is: "
echo "$TENANT"
echo ""
DEFT="Tenant Demo"

echo "$TENANT" |grep -q "$DEFT"
if [ $? -eq 1 ];
then
ANSWER="False"
fi

#3.role
ROLE="`keystone role-list | awk '/badrole/'`"
echo "The role list in keystone is:"
echo "`keystone role-list |sed -n '1,3p'`"
echo "$ROLE"
if [ $? -eq 1 ];
then
ANSWER="False"
fi
echo "`keystone role-list |sed -n '$p'`"
echo ""

#4.services
USERROLE="`keystone user-role-list --user admin --tenant admin |awk '/admin/'`"
echo "The user-role list in keystone is: "
echo "`keystone user-role-list --user admin --tenant admin |sed -n '1,3p'`"
echo "$USERROLE"
if [ $? -eq 1 ];
then
ANSWER="False"
fi
echo "`keystone user-role-list --user admin --tenant admin |sed -n '$p'`"
echo ""

#5.endpoint
ENDPOINT="`keystone endpoint-list | head -n -1|sed -n '4,$p'`"
echo "The endpoint list in keystone is: "
echo "`keystone endpoint-list |sed -n '1,3p'`"
echo "$ENDPOINT"
if [ $? -eq 1 ];
then
ANSWER="False"
fi
echo "`keystone endpoint-list |sed -n '$p'`"
echo ""

echo "&&&&&&"
echo "$ANSWER"
