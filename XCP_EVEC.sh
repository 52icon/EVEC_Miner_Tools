#!/bin/bash
clear
name=XCP_EVEC.sh
cd /root
echo -e "\033[34m===========================================================\033[0m"
echo
echo -e "\033[36m        XMRig CentOS6 Patch\033[0m"
echo
echo
echo -e "\033[36m    1.Install libmicrohttpd\033[0m"
echo
echo -e "\033[36m    2.Update Of Glibc-2.14\033[0m"
echo
echo -e "\033[36m    3.Download XMRig for CentOS6 (CryptoNight)\033[0m"
echo
echo -e "\033[36m    4.Download XMRig for CentOS6 (CryptoNight v7)\033[0m"
echo
echo -e "\033[36m    0.Exit Patch \033[0m"
echo
echo -e "\033[36m                                  Http://EVEC.CC \033[0m"
echo -e "\033[34m=========================================================\033[0m"
echo -e -n "Please select a step："
read mode
if [[ $mode == "1" ]]     
then     
	echo -e "Type：\033[32m Install libmicrohttpd \033[0m"; 
	sleep 1
yum install libmicrohttpd -y
bash $name
fi

if [[ $mode == "2" ]]     
then     
	echo -e "Type：\033[32m Update Of Glibc-2.14 \033[0m"; 
	sleep 1
	cd /root
wget http://origin.evec.cc/github/xmr/centos6/glibc-2.14.tar.gz
tar -xzvf glibc-2.14.tar.gz
cd glibc-2.14
mkdir build
cd build
../configure --prefix=/opt/glibc-2.14
make && make install
mv /lib64/libc.so.6 /lib64/libc.so.6.backup
LD_PRELOAD=/opt/glibc-2.14/lib/libc-2.14.so ln -s /opt/glibc-2.14/lib/libc-2.14.so /lib64/libc.so.6
ln -s /opt/glibc-2.14/lib/libc-2.14.so /lib64/libc.so.6
strings /lib64/libc.so.6 |grep GLIBC_
cd
bash $name
fi

if [[ $mode == "3" ]]     
then     
	echo -e "Type：\033[32m Download XMRig for CentOS6 (CryptoNight)\033[0m"; 
	sleep 1
	cd /root
wget http://origin.evec.cc/github/xmr/xmrig/xmrig.tar.gz
bash $name
fi

if [[ $mode == "4" ]]     
then     
	echo -e "Type：\033[32m Download XMRig for CentOS6 (CryptoNight v7)\033[0m"; 
	sleep 1
	cd /root
wget http://origin.evec.cc/github/xmr/xmrig/xmrig_v7.tar.gz
bash $name
fi

if [[ $mode == "0" ]]     
then
echo -e "Type：\033[32m Exit Patch \033[0m"; 
echo -e “Good Bye！”     
exit
fi

exit 0
