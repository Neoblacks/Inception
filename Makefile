all:
	sudo mkdir -p /home/amugnier/data/wordpress
	sudo mkdir -p /home/amugnier/data/mariadb

	sudo chmod 777 /home/amugnier/data/wordpress
	sudo chmod 777 /home/amugnier/data/mariadb

	sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

stop:
	sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: stop

	sudo rm -rf /home/amugnier/data
	sudo docker system prune -af
	sudo docker volume prune -af
	sudo docker volume rm wordpress
	sudo docker volume rm mariadb

re:	fclean all
