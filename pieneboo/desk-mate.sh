#!/bin/bash
#Instala Desktop
apt-add-repository ppa:ubuntu-mate-dev/ppa -y
apt-add-repository ppa:ubuntu-mate-dev/trusty-mate -y
apt-get update
apt-get upgrade
apt-get install --no-install-recommends ubuntu-mate-core -y