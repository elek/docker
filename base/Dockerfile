FROM phusion/baseimage:0.9.16
MAINTAINER Elek, Marton <level2@anzix.net>
LABEL version="1.0"
LABEL date="15.8.8"

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install pwgen curl git unzip mc emacs24-nox rssh wget
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Budapest /etc/localtime
