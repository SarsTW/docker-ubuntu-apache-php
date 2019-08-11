FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean && apt-get -y update \
    && apt-get install -y locales software-properties-common supervisor \
    && locale-gen en_US.UTF-8 \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get -y update && apt-get install -y \
       apache2=2.4.18* php7.3=7.3.8* libapache2-mod-php \
       php-bcmath php-bz2 php-cli php-common php-curl \
       php-cgi php-dev php-gd php-gmp php-imap php-intl \
       php-json php-ldap php-mbstring php-mysql \
       php-odbc php-pgsql php-phpdbg php-pspell \
       php-readline php-recode php-soap php-sqlite3 \
       php-tidy php-xml php-xmlrpc php-zip \
       php-tideways \
    && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443

CMD apachectl -D FOREGROUND 

