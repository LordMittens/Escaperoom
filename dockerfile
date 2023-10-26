FROM --platform=i386 i386/debian:buster
ARG DEBIAN_FRONTEND=noninteractive

# Update and install packages
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y apt-utils nano

# Make a rooms and assign groups
RUN useradd -s /bin/bash -m room1 && echo "room1:password" | chpasswd && \
	useradd -s /bin/bash -G room1 -m room2 && echo "room2:4mAz1ngH4X0R" | chpasswd && \
	useradd -s /bin/bash -G room1,room2 -m room3 && echo "room3:room3" | chpasswd && \
	useradd -s /bin/bash -G room1,room2,room3 -m room4 && echo "room4:room4" | chpasswd && \
	useradd -s /bin/bash -G room1,room2,room3,room4 -m room5 && echo "room5:room5" | chpasswd

# Copy local docs and put them in the escaperoom
COPY --chown=room1:room1 ./Documents/Room1Docs /home/room1/Documents/
COPY --chown=room2:room2 ./Documents/Room2Docs /home/room2/Documents/
COPY --chown=room3:room3 ./Documents/Room3Docs /home/room3/Documents/
COPY --chown=room4:room4 ./Documents/Room4Docs /home/room4/Documents/
COPY --chown=room5:room5 ./Documents/Room5Docs /home/room5/Documents/

# Changing directory permissions to prevent low rooms from accessing higher rooms 
RUN chmod 770 home/room1 && \
	chmod 770 home/room2 && \
	chmod 770 home/room3 && \
	chmod 770 home/room4 && \
	chmod 770 home/room5

# Change root pass, set user and location on start-up
RUN echo 'root:password' | chpasswd
CMD [ "/bin/bash" ]
WORKDIR /home/room1
USER room1
