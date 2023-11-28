#!/bin/bash

# General escaperoom setup
chown -R room2:room2 ../../../home/room2/
chown -R room3:room3 ../../../home/room3/
chown -R room4:room4 ../../../home/room4/
chown -R room5:room5 ../../../home/room5/

# Room 4 setup
chown room4:room4 ../../../usr/bin/find
chmod 750 ../../../usr/bin/find
chmod 4751 ../../../usr/bin/galf

# Room 5 setup
chown root:root ../../../home/room5/script.sh
chmod 776 ../../../home/room5/script.sh
chmod 754 ../../../usr/bin/unzip
chmod 754 ../../../usr/bin/funzip
chmod 755 ../../../usr/bin/sus

# Remove evidence
rm ../../../home/room2/room2startup.sh
rm ../../../root/startup.sh
sed -i '$d' ../../../home/room2/.bashrc
sed -i '$d' ../../../root/.bashrc
su room2
