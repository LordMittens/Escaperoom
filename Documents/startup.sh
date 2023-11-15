#!/bin/bash

# General escaperoom setup
chmod -R 770 ../../../home/*
chown room2:room2 ../../../home/room2/
chown room2:room2 ../../../home/room2/*
chown room3:room3 ../../../home/room3.gpg
chown room4:room4 ../../../home/room4.gpg
chown room5:room5 ../../../home/room5.gpg

chown room3:room3 ../../../home/room3/
chown room3:room3 ../../../home/room3/*
chown room4:room4 ../../../home/room4/
chown room4:room4 ../../../home/room4/*
chown room5:room5 ../../../home/room5/
chown room5:room5 ../../../home/room5/*

zip --password 4mAz1ngH4X0R -r ./home/room3.zip ./home/room3
zip --password B4s3d64?? -r ./home/room4.zip ./home/room4
zip --password 0nly1m0r3R00M<< -r ./home/room5.zip ./home/room5
rm -r ./home/room3/Documents
rm -r ./home/room4/Documents
rm -r ./home/room5/Documents

# Room 3 setup
chown room3:room3 ../../../usr/bin/find
chmod 770 ../../../usr/bin/find

# Room 4 setup
#chown admin:admin ../../../home/room4/Documents/flag4.txt
chown admin:admin ../../../bin/less
chmod u+s ../../../bin/less

# Room 5 setup
#chown admin:admin ../../../home/room5/Documents/script.sh
#chmod 774 ../../../home/room5/Documents/script.sh
#chmod u+s ../../../home/room5/Documents/script.sh

# Remove evidence
rm ../../../home/room2/room2startup.sh
rm ../../../root/startup.sh
sed -i '$d' ../../../home/room2/.bashrc
sed -i '$d' ../../../root/.bashrc
su room2
