FROM debian:bullseye

RUN apt update \
&& apt upgrade -y \
&& apt install mariadb-server -y \
&& echo "\033[1;32m MARIADB success install ! \033[0m"

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY tools/script_SQL.sh .

RUN chmod 755 script_SQL.sh

CMD ["sh", "script_SQL.sh"]
