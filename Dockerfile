FROM centos:centos6

MAINTAINER mlk007

#ENV DEBIAN_FRONTEND noninteractive

RUN yum -y update
RUN yum -y update device-mapper-libs
RUN yum -y install java-1.7.0-openjdk-src.x86_64

RUN yum -y install wget
RUN yum -y install tar

RUN yum -y install which

RUN yum -y install ruby

RUN set JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64/

RUN mkdir /data
RUN mkdir /data/app
RUN mkdir /data/ttl
RUN mkdir /data/app/fuseki
RUN mkdir /data/scripts
RUN chmod 777 -R /data
RUN mkdir /var/data
RUN mkdir /var/data/ticks
RUN mkdir /var/data/ticks/tdb
RUN chmod 777 -R /var/data

ADD http://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new uuid

ADD scripts /data/scripts

RUN chmod +x /data/scripts/*.sh

RUN /bin/bash /data/scripts/install-fuseki.sh

ADD config/config-tdb.ttl /data/app/fuseki/config-tdb.ttl

RUN chmod +x /data/app/fuseki/fuseki-server /data/app/fuseki/s-*

WORKDIR /data/scripts

#Fix this to add the whole directory
ADD ttl /data/ttl

EXPOSE 3030

#VOLUME ["/data"]

CMD ["/data/scripts/start-fuseki.sh"]
