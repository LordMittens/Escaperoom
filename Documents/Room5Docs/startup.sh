#!/bin/bash

# General escaperoom setup
chmod -R 770 ../../../home/*

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
#su room2