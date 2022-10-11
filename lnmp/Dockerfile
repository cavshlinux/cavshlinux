#基础镜像
FROM centos:7

#维护该镜像的用户信息
MAINTAINER Crushlinux <crushlinux@163.com> 

#配置Nginx 的YUM 源
RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm 

#安装nginx
RUN yum -y install nginx

#安装mysql 和php
RUN rpm --rebuilddb && yum -y install mariadb-devel mariadb-server mariadb php php-fpm

#修改nginx 配置文件，使之支持PHP
RUN sed -i '/^user/s/nginx/nginx\ nginx/g' /etc/nginx/nginx.conf
RUN sed -i '10cindex index.php index.html index.htm ;' /etc/nginx/conf.d/default.conf
RUN sed -i '30,36s/#//' /etc/nginx/conf.d/default.conf
RUN sed -i '31s/html/\/usr\/share\/nginx\/html/' /etc/nginx/conf.d/default.conf
RUN sed -i '/fastcgi_param/s/scripts/usr\/share\/nginx\/html/' /etc/nginx/conf.d/default.conf


#修改php-fpm 配置文件允许nginx 访问
RUN sed -i '/^user/s/apache/nginx/g' /etc/php-fpm.d/www.conf
RUN sed -i '/^group/s/apache/nginx/g' /etc/php-fpm.d/www.conf

#mysql 数据库授权
ADD db_init.sh /root/db_init.sh
RUN chmod 775 /root/db_init.sh
RUN /root/db_init.sh

#添加测试页面
ADD index.php /usr/share/nginx/html/index.php

#定义时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#分别开启80 端口，443 端口，9000 端口，3360 端口
EXPOSE 80
EXPOSE 9000
EXPOSE 3306

#复制脚本，设置权限，启动容器时启动该脚本
ADD run.sh /run.sh
RUN chmod 775 /run.sh
CMD ["/run.sh"]

