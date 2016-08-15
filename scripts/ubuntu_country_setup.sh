#! /bin/sh

sed -i "s/$1/$2/g" /etc/apt/sources.list
apt update
