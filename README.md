# Docker  practice
### Project structure
- `./nginx` Dockerfile + extra files to build `linder/custom-alpine-nginx:0.1` [image](https://hub.docker.com/repository/docker/linder/custom-alpine-nginx)
- `./python` Dockerfile + extra files to build `linder/custom-alpine-python38:0.1` [image](https://hub.docker.com/repository/docker/linder/custom-alpine-python38)
- `docker-compose.yml` config to up sanic + nginx 

# How to run
0) Ensure that you have installed `docker` and `docker-compose`
```
$ docker --version
Docker version 17.05.0-ce, build 89658be
$ docker-compose --version
docker-compose version 1.23.1, build b02f1306
```
1) Run project
```
$ docker-compose up --build 
Creating network "09_docker_default" with the default driver
Building sanic
Step 1/8 : FROM linder/custom-alpine-python38:0.1
 ---> 3b0d0683b057
...
```
2) Go to [http://localhost:8000/](http://localhost:8000/) and you will see:
![screenshot](https://raw.githubusercontent.com/ligain/docker/master/screenshot.png)
# Project Goals 
The code is written for educational purposes.