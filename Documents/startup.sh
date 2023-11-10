#!/bin/bash

# General escaperoom setup
chmod -R 770 ../../../home/*
chown room2:room2 ../../../home/room2/
chown room3:room3 ../../../home/room3/
chown room4:room4 ../../../home/room4/
chown room5:room5 ../../../home/room5/

# Room 3 setup
chown room3:room3 ../../../usr/bin/find
chmod 770 ../../../usr/bin/find

# Room 4 setup
chown admin:admin ../../../home/room4/Documents/flag4.txt
chown admin:admin ../../../bin/less
chmod u+s ../../../bin/less

# Room 5 setup
chown admin:admin ../../../home/room5/Documents/script.sh
chmod 774 ../../../home/room5/Documents/script.sh
chmod u+s ../../../home/room5/Documents/script.sh

# Remove evidence
rm ../../../home/room2/room2startup.sh
sed -i '$d' ../../../home/room2/.bashrc
su room2