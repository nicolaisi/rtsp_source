FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 8554

# Install required build dependencies

RUN apt-get -y update && apt-get install -y
RUN apt-get -y install g++ cmake git
RUN apt-get -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
RUN apt-get -y install libgstrtspserver-1.0-dev gstreamer1.0-rtsp
RUN apt-get -y install libcairo2-dev


WORKDIR /usr/src/app
COPY . .

# Run cmake configure & build process
RUN cmake .
RUN make
# Launch built application
CMD ["./rtsp"]
