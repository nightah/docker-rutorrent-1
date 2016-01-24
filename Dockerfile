FROM linuxserver/baseimage.nginx

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV APTLIST="byobu php5-geoip rtorrent unzip unrar mediainfo ffmpeg git-core"

# install packages
RUN add-apt-repository ppa:byobu/ppa && \
add-apt-repository ppa:kirillshkrogalev/ffmpeg-next && \
apt-get update -q && \
apt-get install $APTLIST -qy && \

# cleanup
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
# ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

