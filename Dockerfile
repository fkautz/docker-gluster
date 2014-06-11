FROM centos


RUN yum -y update ; yum clean all
RUN yum -y install wget ; yum clean all
RUN wget http://download.gluster.org/pub/gluster/glusterfs/3.5/3.5.0/CentOS/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo
RUN yum -y install glusterfs glusterfs-server ; yum clean all

ADD start-gluster.sh /

CMD /bin/sh start-gluster.sh

EXPOSE 111 24007 24008 24009 24010 24011 24012 24013 24014 24015 24016 24017 24018 24019 24020 24021 24022 24023 24024 24025 24026 24027 24028 24029 24030 24031 24032 24033 24034 24035 24036 24037 24038 24039 24040 24041 24042 24043 24044 24045 24046 24047 38465 38466 38467

