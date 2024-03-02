# посмотреть все образы
check_images:
	docker images

# посмотреть все запущеные контейнеры
check_containers:
	docker ps

# собрать образ из Dockerfile. Точка в конце команды говорит, что Dockerfile лежит на том же уровне, что и запуск этой команды
# те все запускаем из корня проета
build:
	docker build --tag=my_service:latest .

# созать и запустить контейнер из образа с пробросом портов (ключ -p) из контейнера на хост-машину (-p 8080:8080)
# левый порт 8080 - порт хоста локальной тачки
# правый порт 8080 - порт, на котором в контейнере поднялся и виден сервис
# можно написать (-p 5000:8080), тогда надо будет стучаться на 5000 и будет проброс на 8080 в контейнер
run:
	docker run -d --name=my_service -p 8080:8080 my_service:latest

# остановить и удалить контейнер
stop:
	docker stop my_service && docker rm my_service

# удалить образ (-f - forсe, принудительно, если что то не так )
remove:
	docker rmi -f my_service:latest

# запушить образ
push:
	docker push dockerhub_login/my_service:latest
