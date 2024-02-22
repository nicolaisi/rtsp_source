FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install required build dependencies


RUN apt-get update && apt-get install -y \
    software-properties-common
RUN apt-get -y install g++ cmake git
RUN apt-get -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN apt-get -y install libgstrtspserver-1.0-dev gstreamer1.0-rtsp
RUN apt-get -y install libcairo2-dev

RUN apt-get -y install mc

RUN apt install python3 python3-pip -y

WORKDIR /usr/src/app
COPY src ./src
COPY coord.txt data.txt requirements.txt gateway.py start.sh ./


RUN pip install -r requirements.txt

# Run cmake configure & build process
RUN cmake src
RUN make

# Launch built application
CMD ["./start.sh"]

ENV GST_DEBUG 3
