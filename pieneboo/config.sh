#!/bin/bash
# Update server
apt-get update
apt-get upgrade -y 
# Install essentials
apt-get -y install build-essential binutils-doc git -y

# Dependencias de pieneboo
apt-get install python3-lxml -y
apt-get install python3-psycopg2 -y
apt-get install python3-pyqt4 -y
apt-get install python3-ply
#Pineboo
cd /git
git clone git://github.com/deavid/pineboo.git
# FLParser
cd /git
git clone git://github.com/deavid/flscriptparser.git
ln -s /git/flscriptparser/test/flscriptparser /usr/local/bin/flscriptparser
ln -s /git/flscriptparser/flscriptparser2 /usr/local/bin/flscriptparser2

