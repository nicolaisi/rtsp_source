```sh
$ docker image build -t rtsp_docker .
$ docker run --expose 8554 -p 8554:8554 -d rtsp_docker
```
  
