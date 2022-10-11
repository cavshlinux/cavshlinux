ifconfig
ifcfig
ifconfig
cd /etc/sysconfig/network-scripts/
ls
vim ifcfg-ens37
vim ifcfg-ens34
rm -rf ifcfg-ens34
ls
vim ifcfg-ens37
cd
systemctl restart network
rz -E
bash NewLinux_.sh 
cd /etc/yum.repos.d/
ls
vim yum.repo
cd
mount /dev/cdrom /mnt/
cd /etc/yum.repos.d/
wget http://mirrors.aliyun.com/repo/Centos-7.repo
cd
yum -y install mariadb mariadb-devel mariadb-server
systemctl start mariadb
netstat -lnpt | grep 3306
ifconfig 
reboot
# cat << EOF >> /etc/hosts
192.168.200.111 k8s-master
192.168.200.112 k8s-node01
192.168.200.113 k8s-node02
vi /etc/hosts
scp /etc/hosts 192.168.200.112:/etc/
scp /etc/hosts 192.168.200.113:/etc/
yum -y install vim wget net-tools lrzsz
swapoff -a
sed -i '/swap/s/^/#/' /etc/fstab
vi /etc/sysctl.conf 
cd /etc/yum.repos.d/
ls
 yum install -y yum-utils device-mapper-persistent-data lvm2
cd
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/dpcker.repo
cd /etc/yum.repos.d/
ls
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/dpcker.repo
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/dpcker.repo
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/
history 
mv mirrors.aliyun.com_docker-ce_.repo docker-ce.repo
yum clean all && yum makecache fast
history sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
yum clean all && yum makecache fast
yum -y install docker-ce
ls
cat yum.repo 
rm -rf yum.repo 
ls
cat CentOS-Base.repo 
ls
cat Centos-7.repo 
ls
yum clean all && yum makecache fast
ping www.aliyun.com
 yum -y install docker-ce
yum makecache fast
ls
rm -rf docker-ce.repo 
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
ls
sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
yum makecache fast
  yum -y install docker-ce
cd
systemctl start docker
systemctl enable docker
vim /etc/docker/daemon.json 
systemctl daemon-reload
systemctl restart docker
cd /etc/yum.repos.d/
vim kubernetes.repo
setenforce 0
top
cd
cd /etc/yum.repos.d/
ls
cd
setenforce 0
iptables -F
systemctl stop firewalld
systemctl disable firewalld
systemctl stop NetworkManager
systemctl disable NetworkManager
sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config 
hostname k8s-master
bash
cat /etc/hosts
yum -y install docker
ping www.aliyun.com
cd /etc/sysconfig/network-scripts/
ls
cat ifcfg-ens37
ping www.aliyun.com
cat ifcfg-ens33
ping www.aliyun.com
cd /etc/yum.repos.d/
ls
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
cd /etc/sysconfig/network-scripts/
ls
cat ifcfg-ens33
systemctl restart network
systemctl status  network.service
systemctl stop network.service
systemctl start network.service
journalctl -xe network.service
journalctl -xe network
journalctl -xe | grep network.service
ls
vi ifcfg-ens33
vi ifcfg-ens37
systemctl restart network.service
journalctl -xe
ifconfig 
mv ifcfg-ens37 ifcfg-ens34
systemctl restart network.service
vi ifcfg-ens34
systemctl restart network.service
cdl
cd
systemctl status network
ping www.aliyun.com
ifconfig 
ping www.aliyun.com
cd /etc/sysconfig/network-scripts/
ls
cat ifcfg-ens33
vi ifcfg-ens33
cat ifcfg-ens34
systemctl status network
systemctl restart network.service
ping www.baidu.com
cd /etc/yum.repos.d/
ls
rm -rf CentOS-Base.repo 
ls
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
cd
yum -y install docker
systemctl status docker
systemctl restart docker
systemctl enable docker
systemctl enable docker.service
docker images
mkdir lnmp/
cd lnmp/
vim Dockerfile
vim db_init.sh
vim  index.php
vim run.sh
docker build -t lnmp:new 
docker build -t lnmp:new .
docker-compose version
cd
ls
systemctl status docker-compose
systemctl status docker-compose.service
cd lnmp/
ls
cat db_init.sh 
docker images lnmp
 docker run -d -p 80:80 -p 3306:3306 -p 9000:9000 --name lnmp-test --restart=always lnmp:new
 docker rm -f $(docker ps -aq)
 docker run -d -p 80:80 -p 3306:3306 -p 9000:9000 --name lnmp-test --restart=always lnmp:new
 iptables -F
setenforce 0
systemctl stop firewalld
netstat -lnpt | grep 3306
cd
rz
chmod +x docker-compose 
bash ./docker-compose /usr/sbin/
mv docker-compose /usr/bin/
docker-compose version
systemctl status mysql
systemctl status mysql.service
mysql
systemctl status nginx
docker-compose ps
 cd lnmp/
ls
 cat Dockerfile 
rz

cd
ps -ef | grep nginx
nginx
yum -y install nginx
netstat -lnpt 
docker image
docker images
cd lnmp/
docker-compose up -d
ls
ifconfig 
systemctl start ssh
systemctl start ssh.service
ping 192.168.200.112
cat /etc/hosts
systemctl status network
systemctl start network
cd /etc/sysconfig/network-scripts/
ls
ifconfig -s
cat ifcfg-ens33
cat ifcfg-ens34
ifconfig -s
systemctl start network
systemctl status network
systemctl start network
systemctl stop NetworkManager
systemctl start network
setenforce 0
cd /etc/yum.repos.d/
ls
iptables -F
systemctl stop firewalld
systemctl disable firewalld
 systemctl stop NetworkManager
systemctl disable NetworkManager
sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config
yum install -y kubelet kubeadm kubectl
ls
ping www.aliyun.com
ls
rm -rf kubernetes.repo 
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

setenforce 0
yum install -y kubelet kubeadm kubectl
yum clean all && yum makecache fast
yum install -y --nogpgcheck kubelet kubeadm kubectl
systemctl enable kubelet
cd
kubeadm config print init-defaults > init-config.yaml
vim init-config.yaml 
kubeadm config images list --config init-config.yaml
 kubeadm config images pull --config=init-config.yaml
kubeadm config images pull --config=init-config.yaml
kubeadm config images pull --config=init-config.yaml --v=5
kubeadm config images list --config init-config.yaml
cat init-config.yaml 
kubeadm version
vim init-config.yaml 
kubeadm config images list --config init-config.yaml
 kubeadm config images pull --config=init-config.yaml
kubeadm config images list --kubernetes-version
kubeadm  config images list  --image-repository registry.aliyuncs.com/google_containers
docker login harbor.raymonds.cc
kubeadm config images list --kubernetes-version v1.25.0
docker image
docker images
kubeadm  config images list  --image-repository registry.aliyuncs.com/google_containers
kubeadm  config images pull  --image-repository registry.aliyuncs.com/google_containers
vim init-config.yaml 
kubeadm  config images pull  --image-repository registry.aliyuncs.com/google_containers
vim init-config.yaml 
kubeadm  config images pull  --image-repository registry.aliyuncs.com/google_containers
vim init-config.yaml 
kubeadm  config images pull  --image-repository registry.aliyuncs.com/google_containers
kubeadm config images list --kubernetes-version 1.25.0
docker tag registry.k8s.io/kube-apiserver:v1.25.0
kubeadm  config images list  --image-repository registry.aliyuncs.com/google_containers
vim initial-setup-ks.cfg 
ls
vim init-config.yaml 
kubeadm  config images list  --image-repository registry.aliyuncs.com/google_containers
ping www.aliyun.com
reboot
ifconfig -s
systemctl status network
