FROM debian:bullseye

# RUN apt update \
# && apt upgrade -y \
# && apt install wget -y && apt-get install php7.3 php7.4 php-fpm php-mysql -y \
# && apt install mariadb-client -y

# # RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client -y

# # RUN wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www \
# # && cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz

# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# && chmod +x wp-cli.phar \
# && mv wp-cli.phar /usr/local/bin/wp

# RUN mkdir -p /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# RUN chmod -R 755 /var/www/html

# COPY tools/WP-Install.sh /usr/local/bin/WP-Install.sh
# RUN chmod 755 /usr/local/bin/WP-Install.sh

# WORKDIR /var/www/html

RUN apt update -y && apt upgrade -y && apt-get -y install wget

RUN apt-get install -y \
    php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client

RUN mkdir -p /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

COPY tools/WP-Install.sh /usr/local/bin/WP-Install.sh
RUN chmod 755 /usr/local/bin/WP-Install.sh

WORKDIR /var/www/html

EXPOSE 9000

CMD ["sh", "/usr/local/bin/WP-Install.sh"]
