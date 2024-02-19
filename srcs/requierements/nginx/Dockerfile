FROM debian:bullseye

#INSTALL NGINX
RUN apt update \
&& apt install vim --no-install-recommends --no-install-suggests -y \
	wget \
	curl \
	nginx \
&& echo "\033[1;32mVIM, CURL, WGET NGINX success install ! \033[0m"

RUN mkdir -p /etc/nginx/ssl \
&& apt install openssl --no-install-recommends --no-install-suggests -y \
&& echo "\033[1;32mOpenSSL success install ! \033[0m"

# -x509		= type of certif
# -nodes	=  no password requires
# -out		=output cert directories
# -keyout	= output key directories
# -subj		auto completion of country, state, location (city) etc
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=amugnier.42.fr/UID=amugnier"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
	# root                      #user standard
RUN chmod 755 /var/www/html && chown -R www-data:www-data /var/www/html

# RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html

CMD [ "nginx", "-g", "daemon off;" ]
