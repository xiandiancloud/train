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
USER="`keystone user-list`"
echo "The keystone users are: "
echo "$USER"
echo ""
DEFU="admin demo "
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
TENANT="`keystone tenant-list`"
echo "The keystone tenants are: "
echo "$TENANT"
echo ""
DEFT="admin demo service "
for i in $DEFT
do
echo "$TENANT" |grep -q "$i"
if [ $? -eq 1 ];
then
ANSWER="False"
break
fi
done

#3.role
ROLE="`keystone role-list`"
echo "The keystone roles are: "
echo "$ROLE"
echo ""
DEFR="admin "
for i in $DEFR
do
echo "$ROLE" |grep -q "$i"
if [ $? -eq 1 ];
then
ANSWER="False"
break
fi
done

#4.services
SERVICES="`keystone service-list`"
echo "The keystone services are: "
echo "$SERVICES"
echo ""
DEFS="keystone "
for i in $DEFS
do
echo "$SERVICES" |grep -q "$i"
if [ $? -eq 1 ];
then
ANSWER="False"
break
fi
done

#5.endpoint
ENDPOINT="`keystone endpoint-list`"
echo "The keystone endpoints are: "
echo "$ENDPOINT"
echo ""
DEFE="35357 5000 "
for i in $DEFE
do
echo "$ENDPOINT" |grep -q "$i"
if [ $? -eq 1 ];
then
ANSWER="False"
break
fi
done


echo "&&&&&&"
echo "$ANSWER"
