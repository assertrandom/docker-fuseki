FROM ubuntu:precise

MAINTAINER mlk007

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install perl
RUN apt-get -y install perl
RUN apt-get -y install tar
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install vim
RUN apt-get -y install openjdk-7-jdk


RUN mkdir /apps
RUN mkdir /apps/scripts
RUN mkdir /apps/installs
RUN mkdir /apps/data
RUN mkdir /apps/data/logs
RUN mkdir /apps/data/fuseki
RUN mkdir /apps/data/www
RUN chmod 777 -R /apps

ADD scripts/start-services.sh /apps/scripts/start-services.sh
RUN chmod +x /apps/scripts/start-services.sh

WORKDIR /apps/installs

RUN wget  https://www.apache.org/dist/jena/binaries/jena-fuseki-1.1.0-distribution.tar.gz  -O- | tar -zx -C /apps/installs jena-fuseki-1.1.0

RUN wget  http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz  -O- | tar -zx -C /apps/installs apache-tomcat-7.0.55


EXPOSE 8080

CMD ["/apps/scripts/start-services.sh"]
