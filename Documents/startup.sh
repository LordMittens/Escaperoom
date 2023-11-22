#!/bin/bash

# General escaperoom setup
#chmod -R 770 ../../../home/*
chown -R admin:admin ../../../home/admin/
chown -R room2:room2 ../../../home/room2/
chown -R room3:room3 ../../../home/room3/
chown -R room4:room4 ../../../home/room4/
chown -R room5:room5 ../../../home/room5/

# Room 3 setup
chown room3:room3 ../../../usr/bin/find
chmod 770 ../../../usr/bin/find

# Room 4 setup
chown admin:admin ../../../home/room4/flag4.txt
chmod 4751 ../../../usr/bin/galf

# Room 5 setup
chown admin:admin ../../../home/room5/script.sh
chmod 4770 ../../../home/room5/script.sh
chmod 755 ../../../usr/bin/sus

# Remove evidence
rm ../../../home/room2/room2startup.sh
rm ../../../root/startup.sh
sed -i '$d' ../../../home/room2/.bashrc
sed -i '$d' ../../../root/.bashrc
su room2
