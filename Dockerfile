FROM debian:latest

# Update OS
RUN apt-get update -y && apt-get upgrade -y

# Install php
RUN apt-get install -y php5 git php5-curl curl php5-cli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Install drush
RUN php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > drush
RUN php drush core-status
RUN chmod +x drush
RUN mv drush /usr/local/bin
RUN drush init -y
RUN drush -h