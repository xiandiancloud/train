#!/bin/bash

#set -x
#1.yum
ADDRESS="`cat /etc/yum.repos.d/*.repo |grep 192.168.2.10`"
echo "The all baseurl of the yum is: "
echo "------------------------------"
echo "$ADDRESS"
echo "------------------------------"
echo ""
REPO="centos6.5 epel6 foreman openstack-havana puppetlabs "
ANSWER="True"
for i in $REPO
do
echo "$ADDRESS" |grep -q "$i" 
if [ $? -eq 1 ];
then 
ANSWER="False"
break
fi
done

#2.mysql
mysqlrpm="`rpm -qa |grep mysql`"
echo "The installed rpms for mysql is: "
echo "------------------------------"
echo "$mysqlrpm"
echo "------------------------------"
echo ""
if [ -z "$mysqlrpm" ] ;
then
ANSWER="False"
fi

mysqllogin="`mysql -uroot -p000000 -Dmysql -e\"show tables;\" 2>/dev/null`"
if [ -z "$mysqllogin" ];
then
ANSWER="False"
fi

#3.qpid
qpidrpm="`rpm -qa |grep qpid`"
echo "The installed rpms for qpid is: "
echo "------------------------------"
echo "$qpidrpm"
echo "------------------------------"
echo ""
if [ -z "$qpidrpm" ] ;
then
ANSWER="False"
fi

#4.keystone
keystonerpm="`rpm -qa |grep openstack-keystone`"
echo "The installed rpms for keystone is: "
echo "------------------------------"
echo "$keystonerpm"
echo "------------------------------"
echo ""
if [ -z "$keystonerpm" ] ;
then
ANSWER="False"
fi

#5.keystone db
keystoneconf="`grep \"connection = mysql://keystone:000000@$HOSTNAME/keystone\" /etc/keystone/keystone.conf`"
echo "The config of keystone for mysql is: "
echo "------------------------------"
echo "$keystoneconf"
echo "------------------------------"
echo ""
if [ -z "$keystoneconf" ];
then
ANSWER="False"
fi

keystonedb="`mysql -uroot -p000000 -Dkeystone -e\"show tables;\" 2>/dev/null`"
echo "The database of keystone is: "
echo "------------------------------"
echo "$keystonedb"
echo "------------------------------"
echo ""
if [ -z "$keystonedb" ];
then
ANSWER="False"
fi

echo "&&&&&&"
echo "$ANSWER"
