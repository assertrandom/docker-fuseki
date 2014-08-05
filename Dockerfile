FROM ubuntu:precise

MAINTAINER mlk007


#RUN echo "deb http://archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install perl tar wget curl openjdk-7-jre-headless
RUN apt-get -y install perl
RUN apt-get -y install tar
RUN apt-get -y install wget
RUN apt-get -y install curl
