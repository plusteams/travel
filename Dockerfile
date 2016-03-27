FROM ubuntu:14.04.3

MAINTAINER Nguyen Minh Hieu <hieunguyenminh.93@gmail.com>

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

# Timezone
RUN echo "Asia/Bangkok" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata


# install nginx

RUN apt-get update && apt-get install -y nginx

# config nginx

COPY deploy/scripts/files/config/nginx/nginx.conf /etc/nginx/nginx.conf
RUN service nginx restart

# install php7 
RUN apt-get -y install locales \
      language-pack-de \
      re2c \
      libgmp-dev \
      libicu-dev \
      libmcrypt-dev \
      libtidy-dev \
      libenchant-dev \
      libaspell-dev \
      libpspell-dev \
      librecode-dev \
      libsasl2-dev \
      libxpm-dev \
      libt1-dev \
      automake \
      autoconf \
      libtool \
      re2c \
      flex \
      bison \
      git \
      make \
      libxml2-dev \
      libssl-dev \
      build-essential \
      zlib1g-dev \
      libbz2-dev \
      libcurl4-openssl-dev \
      libcurl3 \
      libcurlpp-dev \
      libjpeg-dev \
      libpng12-dev \
      libwebp-dev \
      libfreetype6-dev \
      libgmp-dev \
      libpqxx-dev \
      libpq-dev \
      libreadline-dev \
      libxslt1-dev 

RUN git clone https://github.com/php/php-src.git 

#RUN 
RUN git config --global user.email "hieunguyenminh.93@gmail.com"
RUN git config --global user.name "Nguyen Minh Hieu"
RUN cd php-src && git checkout PHP-7.0.4 && git pull
COPY deploy/scripts/compile-php.sh /php-src/compile-php.sh
RUN chmod a+x /php-src/compile-php.sh
RUN cd /php-src && ./compile-php.sh

# install some extension
#
#RUN /bin/bash pecl install mongodb

COPY deploy/scripts/files/config/nginx/vhost/server-*.conf /etc/nginx/sites-availables/
RUN ln -s /etc/nginx/sites-availables/server-dev.conf /etc/nginx/sites-enabled/server-dev.conf

RUN ln -s /etc/nginx/sites-availables/server-prod.conf /etc/nginx/sites-enabled/server-prod.conf

COPY deploy/scripts/files/config/php/fpm/php-fpm.conf /usr/local/etc/php-fpm.conf
RUN /usr/local/sbin/php-fpm
RUN service nginx restart
# build mysql
ADD deploy/scripts/start.sh /start.sh
RUN chmod a+x /start.sh
EXPOSE 80 443
CMD ["/start.sh"]