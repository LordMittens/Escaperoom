FROM --platform=i386 i386/debian:buster
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y apt-utils nano zip man sudo

# Make the rooms and assign groups
RUN useradd -s /bin/bash -m room2 && echo "room2:room2" | chpasswd && \
	useradd -s /bin/bash -m room3 && echo "room3:room3" | chpasswd && \
	useradd -s /bin/bash -m room4 && echo "room4:room4" | chpasswd && \
	useradd -s /bin/bash -G sudo -m room5 && echo "room5:room5" | chpasswd

# Copy local docs and put them in the escaperoom
COPY ./Documents/Room2Docs /home/room2/
COPY ./Documents/Room3Docs /home/room3/
COPY ./Documents/Room4Docs /home/room4/
COPY ./Documents/Room5Docs /home/room5/

# Adding file to be executed on start up, and general escaperoom setup
COPY ./Documents/sus ./usr/bin
COPY ./Documents/galf ./usr/bin
COPY ./Documents/startup.sh ./root
COPY ./Documents/room2startup.sh ./home/room2
RUN chmod +x /root/startup.sh && \
 	chmod +x /home/room2/room2startup.sh && \
 	echo "/root/startup.sh" >> ./root/.bashrc && \
 	echo "/home/room2/room2startup.sh" >> /home/room2/.bashrc && \
	echo "room5 ALL=(ALL:ALL) NOPASSWD: /home/room5/script.sh" >> /etc/sudoers && \
	zip -q -j -P ZmxhZzU= ../../../home/room5/flag5.zip ../../../home/room5/flag5.txt && \
	rm ../../../home/room5/flag5.txt

# Change root pass, set user and location on start-up
ENV HOME="/home/room2" TERM="xterm" USER="room2" SHELL="/bin/bash" EDITOR="nano" LANG="en_US.UTF-8" LC_ALL="C"
RUN echo 'root:password' | chpasswd
CMD ["/bin/bash"]
WORKDIR /home
USER room2
