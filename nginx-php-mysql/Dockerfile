FROM anzix/nginx-php
MAINTAINER Elek, Marton <level2@anzix.net>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y install mysql-server mysql-client php5-mysql

EXPOSE 3306
EXPOSE 80

RUN ln -s /etc/php5//mods-available/mcrypt.ini /etc/php5/fpm/conf.d/20-mcrypt.ini
RUN mkdir /etc/service/mysql
ADD mysql /etc/service/mysql/run

ADD reset_mysql.sh /usr/bin/reset_mysql.sh
