# Official image from PHP on Dockerhub. This contain Apache and Debian Buster.
FROM php:7.4.14-apache-buster
# Enabling REWRITE Apache module.
RUN a2enmod rewrite && service apache2 restart
# Installing libs for PHP modules dependencies and VIM for editing.
RUN apt update && apt install -y zlib1g-dev libpng-dev libzip-dev vim
# Installing and enabling PHP modules.
RUN docker-php-ext-install gd mysqli zip
# Create the volumes for maintaining the PHP and Apache configuration, and the application as well.
VOLUME ['/var/www/html', '/usr/src/php', '/usr/local/etc/php', '/etc/apache2', '/usr/local/apache2']
# Expose port 80 for the environment.
EXPOSE 80/tcp
