service mysql start
chown -R www-data /var/www/*
chmod -R 755 var/www/*
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES" | mysql -u root --skip-password
mkdir /var/www/jondeflo
mkdir /etc/nginx/ssl
mv ./tmp/ssl/* /etc/nginx/ssl
mv ./tmp/nginx.conf /etc/nginx/sites-available/jondeflo
ln -s /etc/nginx/sites-available/jondeflo /etc/nginx/sites-enabled/jondeflo
tar -xf /tmp/wordpress.tar.gz -C /var/www/jondeflo
mv ./tmp/index.html /var/www/jondeflo
mv ./tmp/ft_server.jpg /var/www/jondeflo
mv ./tmp/wp-config.php var/www/jondeflo/wordpress
mkdir /var/www/jondeflo/phpmyadmin
tar -xf /tmp/phpMyAdmin.tar.gz --strip-components 1 -C /var/www/jondeflo/phpmyadmin
cp ./tmp/config.inc.php /var/www/jondeflo/phpmyadmin
service php7.3-fpm start
service nginx start
bash