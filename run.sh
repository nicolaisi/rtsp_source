#! /bin/bash

podman image build -t rtsp_docker .
podman stop $(podman ps | grep rtsp_docker | awk '{ print $1 }')
podman run --net=host -v ./src:/usr/src/app/src -d rtsp_docker
