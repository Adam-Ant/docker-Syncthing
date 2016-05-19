FROM debian:wheezy
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

#Configure Base
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -qy\
	&& useradd --system -m -u 998 --shell /usr/sbin/nologin syncthing

# Install software
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy curl\
	&& curl -s https://syncthing.net/release-key.txt | apt-key add - \
	&& echo "deb http://apt.syncthing.net/ syncthing release" | tee /etc/apt/sources.list.d/syncthing-release.list\
	&& apt-get update -q\
	&& apt-get -qy install syncthing

USER syncthing
CMD ["syncthing"]