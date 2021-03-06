
#!/bin/bash
# Install Apache
apt-get install apache2 -y
#Install PHP
apt-get install php5 libapache2-mod-php5 php5-cli php5-mysql -y
# Install MySQL
echo "mysql-server mysql-server/root_password password eneboo" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password eneboo" | sudo debconf-set-selections
apt-get install mysql-client mysql-server -y
# Install PhpMyAdmin
echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/app-password-confirm password eneboo' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/admin-pass password eneboo' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/mysql/app-pass password eneboo' | debconf-set-selections
echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
apt-get install phpmyadmin -y

# Restart Apache service
service apache2 restart