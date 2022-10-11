#!/bin/bash
#为了防止虚拟机误操作导致无法使用或者需要新机来做实验而诞生的脚本，自定义SeLinux、Firewalld,自动安装本地yum仓库,并自动配置IP地址,安装必须的软件包。




#——————————————————————————————————该脚本执行完毕后机器会自动重启！———————————————————————————————————





#定义各种变量，执行脚本时根据需求自行配置---------------------------------------------------------------
read -p '网卡名称是(如:ens32)' NN
read -p '理想的IP地址是(如:192.168.250.250)' IP
read -p '子网掩码(如:8、16、24)' MASK
read -p '是否关闭SeLniux(Y或N)' SL
read -p '开机关闭防火墙(Y或N)' FR
read -p '请选择挂载目录(以根起始)' MOUNT
#装新机最先要做的就是连终端，所以从配置IP地址开始-------------------------------------------------------
echo "TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
BOOTPROTO="static"
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
NAME="$NN"
UUID="aa2e26e6-6eb8-47e8-a5cd-a825a48f91ce"
DEVICE="$NN"
ONBOOT="yes"
IPADDR=$IP" > /etc/sysconfig/network-scripts/ifcfg-$NN

case $MASK in
8)
	echo "NETMASK=255.0.0.0" >> /etc/sysconfig/network-scripts/ifcfg-$NN
;;

16)
	echo "NETMASK=255.255.0.0" >> /etc/sysconfig/network-scripts/ifcfg-$NN
;;

24)
        echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-$NN
;;

*)
	echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-$NN
esac
#-------------------------------------------------------------------------------------------------------
#关闭或打开Selinux--------------------------------------------------------------------------------------
if [ $SL -eq Y ] > /dev/null 2>&1
then
	echo "# This file controls the state of SELinux on the system.
     	      # SELINUX= can take one of these three values:
	      #     enforcing - SELinux security policy is enforced.
	      #     permissive - SELinux prints warnings instead of enforcing.
	      #     disabled - No SELinux policy is loaded.
	      SELINUX=disabled
	      # SELINUXTYPE= can take one of three two values:
	      #     targeted - Targeted processes are protected,
	      #     minimum - Modification of targeted policy. Only selected processes are protected. 
	      #     mls - Multi Level Security protection.
	      SELINUXTYPE=targeted" > /etc/selinux/config
else
        echo "# This file controls the state of SELinux on the system.
              # SELINUX= can take one of these three values:
              #     enforcing - SELinux security policy is enforced.
              #     permissive - SELinux prints warnings instead of enforcing.
              #     disabled - No SELinux policy is loaded.
              SELINUX=enforcing
              # SELINUXTYPE= can take one of three two values:
              #     targeted - Targeted processes are protected,
              #     minimum - Modification of targeted policy. Only selected processes are protected. 
              #     mls - Multi Level Security protection.
              SELINUXTYPE=targeted" > /etc/selinux/config
fi
#-------------------------------------------------------------------------------------------------------#关闭或打开防火墙--------------------------------------------------------------------------------------
if [ $FR -eq Y ] > /dev/null 2>&1
then
	systemctl disable firewalld > /dev/null 2>&1
else
        systemctl enable  firewalld > /dev/null 2>&1
fi
#-------------------------------------------------------------------------------------------------------
#创建本地YUM仓库、挂载光盘-----------------------------------------------------------------------------
mkdir -p $MOUNT > /dev/null 2>&1
mount /dev/sr0 $MOUNT > /dev/null 2>&1
mkdir /etc/yum.repos.d/bak > /dev/null 2>&1 && mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/bak > /dev/null 2>&1
echo "[local]
name=local
baseurl=file://$MOUNT
gpgcheck=0
enabled=1" > /etc/yum.repos.d/yum.repo
yum clean all > /dev/null 2>&1 && yum makecache fast > /dev/null 2>&1
#------------------------------------------------------------------------------------------------------------
#安装新机必备软件--------------------------------------------------------------------------------------------
echo '正在安装软件，请稍后.......'
yum -y install tree elinks parted gcc gcc-c++ make cmake ntsysv lrzsz openssh* openssl* unzip > /dev/null 2>&1
#------------------------------------------------------------------------------------------------------------
#以字符界面启动---------------------------------------------------------------------------------------------
systemctl set-default multi-user.target > /dev/null 2>&1
init 6
#-----------------------------------------------------------------------------------------------------------



