FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt -y update \
    && apt install -y locales software-properties-common supervisor \
    && locale-gen en_US.UTF-8 \
    #&& LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php \
    && apt -y update && apt install -y \
       apache2=2.4.41* php7.4=7.4.3* libapache2-mod-php \
       php-bcmath php-bz2 php-cli php-common php-curl \
       php-cgi php-dev php-gd php-gmp php-imap php-intl \
       php-json php-ldap php-mbstring php-mysql \
       php-odbc php-pgsql php-phpdbg php-pspell \
       php-readline php-soap php-sqlite3 \
       php-tidy php-xml php-xmlrpc php-zip \
       php-tideways \
    && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443

CMD apachectl -D FOREGROUND 

