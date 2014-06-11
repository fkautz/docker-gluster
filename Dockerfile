FROM centos


RUN yum -y update
RUN yum -y install wget
RUN wget http://download.gluster.org/pub/gluster/glusterfs/3.5/3.5.0/CentOS/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo
RUN yum -y install glusterfs glusterfs-server

ADD start-gluster.sh /

CMD /bin/sh start-gluster.sh

EXPOSE 22 111 245 443 24007 2049 8080 6010 6011 6012 38465 38466 38468 38469 49152 49153 49154 49156 49157 49158 49159 49160 49161 49162
