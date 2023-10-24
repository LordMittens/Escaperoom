FROM --platform=i386 i386/debian:buster
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y apt-utils nano
#	beef bsdgames bsdmainutils ca-certificates clang \
# 	cowsay cpio cron curl dmidecode dmsetup g++ gcc gdbm-l10n git  \
# 	hexedit  ifupdown init logrotate lsb-base lshw lua50 luajit lynx make \
# 	nano netbase nodejs openssl procps python3 python3-cryptography \
# 	python3-jinja2 python3-numpy python3-pandas python3-pip python3-scipy \
# 	python3-six python3-yaml readline-common rsyslog ruby sensible-utils \
# 	ssh systemd systemd-sysv tasksel tasksel-data udev vim wget whiptail \
# 	xxd iptables isc-dhcp-client isc-dhcp-common kmod less netcat-openbsd

# Make a user, then copy over the /example directory
RUN useradd -s /bin/bash -m room1 && echo "room1:password" | chpasswd
RUN useradd -s /bin/bash -m room2 && echo "room2:4mAz1ngH4X0R" | chpasswd
USER room1
COPY --chown=room1:user ./Documents/Room1Docs /home/room1/Documents
USER root
RUN chmod 700 home/room1
RUN chmod 700 home/room2
RUN echo 'root:password' | chpasswd
CMD [ "/bin/bash" ]
WORKDIR /home/room1

