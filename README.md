# Rawgraphs for docker
[![build](https://github.com/hvalev/rawgraphs-docker/actions/workflows/build.yml/badge.svg)](https://github.com/hvalev/rawgraphs-docker/actions/workflows/build.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/hvalev/rawgraphs)
![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/hvalev/rawgraphs)

[Rawgraphs](https://rawgraphs.io/) in a docker container! You can use this container to run rawgraphs locally and generate beautiful visualizations of your data for your projects. To see some sample visualization of what is possible, you can visit the [rawgraphs gallery](https://rawgraphs.io/gallery).

## How to run this
As a docker run command use the following ```docker run -d -p 8080:80 --name rawgraphs hvalev/rawgraphs``` and then navigate to ```http://your-ip:8080/```. As a docker-compose script, use the following snippet:
```
version: "3.8"
services:
  rawgraphs:
    image: hvalev/rawgraphs:latest
    container_name: rawgraphs
    ports:
      - 8080:80
    restart: always
```

## Build it yourself
```
git clone https://github.com/hvalev/rawgraphs-docker.git/
cd rawgraphs-docker
docker build -t raw-graphs .
docker run -p 8080:80 raw-graphs
```

## Improvements
Used a multi-stage build to decrease the size of the final image by a factor of 10! and upgraded it to use Nginx.

## Aknowledgements
To rawgraphs for making this incredible library and to the original repository.
