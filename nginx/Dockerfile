FROM anzix/base
MAINTAINER Elek, Marton <level2@anzix.net>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# Basic Requirements
RUN apt-get -y install pwgen curl git unzip nginx

# nginx config
RUN sed -i -e"s/keepalive_timeout\s*65/keepalive_timeout 2/" /etc/nginx/nginx.conf
RUN sed -i -e"s/keepalive_timeout 2/keepalive_timeout 2;\n\tclient_max_body_size 100m/" /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir /host
RUN mkdir /host/htdocs

RUN mkdir /etc/service/nginx
ADD nginx /etc/service/nginx/run

ADD ./nginx-site.conf /etc/nginx/sites-available/default

EXPOSE 80


