#! /bin/sh

sed -i 's/us.archive.ubuntu/br.archive.ubuntu/g' /etc/apt/sources.list
apt update
