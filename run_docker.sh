#! /bin/bash

docker image build -t rtsp_docker .
#docker stop $(docker ps | grep rtsp_docker | awk '{ print $1 }')
docker run --net=host -v ./src:/usr/src/app/src -d rtsp_docker
