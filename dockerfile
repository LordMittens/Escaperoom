FROM --platform=i386 i386/debian:buster
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y apt-utils nano less gnupg-utils procps acl rng-tools zip man sudo mcrypt

# Make the rooms and assign groups
RUN useradd -s /bin/bash -m room2 && echo "room2:room2" | chpasswd && \
	useradd -s /bin/bash -G room2 -m room3 && echo "room3:4mAz1ngH4X0R" | chpasswd && \
	useradd -s /bin/bash -G room2,room3 -m room4 && echo "room4:B4s3d64??" | chpasswd && \
	useradd -s /bin/bash -G room2,room3,room4 -m room5 && echo "room5:0nly1m0r3R00M<<" | chpasswd && \
	useradd -s /bin/bash -m admin && echo "admin:admin" | chpasswd

# Copy local docs and put them in the escaperoom
COPY --chown=room2:room2 ./Documents/Room2Docs /home/room2/
COPY --chown=room3:room3 ./Documents/Room3Docs /home/room3/
COPY --chown=room4:room4 ./Documents/Room4Docs /home/room4/
COPY --chown=room5:room5 ./Documents/Room5Docs /home/room5/

# RUN zip --password 4mAz1ngH4X0R -r ./home/room3.zip ./home/room3 && \
# 	zip --password B4s3d64?? -r ./home/room4.zip ./home/room4 && \
# 	zip --password 0nly1m0r3R00M<< -r ./home/room5.zip ./home/room5 && \
# 	rm -r ./home/room3/Documents && \
# 	rm -r ./home/room4/Documents && \
# 	rm -r ./home/room5/Documents

# Encrypts room directories since normal linux permissions do not work
#  RUN gpgtar --encrypt --symmetric --output ./home/room3.gpg --gpg-args="--passphrase=4mAz1ngH4X0R --batch" ./home/room3/Documents/flag3.txt && \
#  	#rm -r ./home/room3/Documents && \
#  	gpgtar --encrypt --symmetric --output ./home/room4.gpg --gpg-args="--passphrase=B4s3d64?? --batch" ./home/room4/Documents && \
#  	#rm -r ./home/room4/Documents && \
#  	gpgtar --encrypt --symmetric --output ./home/room5.gpg --gpg-args="--passphrase=0nly1m0r3R00M<< --batch" ./home/room5
#  	#rm -r ./home/room5/Documents

# Adding file to be executed on start up. This file changes various ownerships to prevent low rooms from accessing higher rooms.
COPY ./Documents/sus ./usr/bin
COPY ./Documents/startup.sh ./root
COPY ./Documents/room2startup.sh ./home/room2
RUN chmod +x /root/startup.sh && \
 	chmod +x /home/room2/room2startup.sh && \
 	echo "/root/startup.sh" >> ./root/.bashrc && \
 	echo "/home/room2/room2startup.sh" >> /home/room2/.bashrc
	

# When Docker fixes "docker cp -a" the following can be enabled again.

# Changing directory permissions to prevent low rooms from accessing higher rooms. Then change file and command permissions	
	# chmod -R 770 home/* && \
	# chown admin:admin ./bin/less && \
	# chmod u+s /bin/less && \
	# chown room3:room3 usr/bin/find && \
	# chmod 770 usr/bin/find && \
	# chown admin:admin ./home/room5/Documents/script.sh && \
	# chmod 774 ./home/room5/Documents/script.sh && \
	# chmod u+s ./home/room5/Documents/script.sh

# Change root pass, set user and location on start-up
ENV HOME="/home/room2" TERM="xterm" USER="room2" SHELL="/bin/bash" EDITOR="nano" LANG="en_US.UTF-8" LC_ALL="C"
RUN echo 'root:password' | chpasswd
CMD ["/bin/bash"]
WORKDIR /home
USER room2
