#!/usr/bin/env bash

# Contraseña de postgres
PASSWORD='eneboo'

# update / upgrade
apt-get update -y
apt-get -y upgrade

# Install Apache
apt-get install apache2 -y
#Install PHP
apt-get install php5 libapache2-mod-php5 php5-cli php5-mysql -y

# postgres
apt-get install -y postgresql postgresql-contrib -y

POSTGRE_VERSION=9.3

# listen for localhost connections
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/$POSTGRE_VERSION/main/postgresql.conf

# identify users via "md5", rather than "ident", allowing us to make postgres
# users separate from system users. "md5" lets us simply use a password
echo "host    all             all             0.0.0.0/0               md5" | tee -a /etc/postgresql/$POSTGRE_VERSION/main/pg_hba.conf
service postgresql start

# create new user "root" with defined password "root" not a superuser
-u postgres psql -c "CREATE ROLE root LOGIN UNENCRYPTED PASSWORD '$PASSWORD' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;"
service postgresql restart

# install Composer
cd /tmp
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install phppgadmin
apt-get install phppgadmin -y
ln -s /usr/share/phppgadmin /var/www/html/

#Restart apache
service apache2 restart