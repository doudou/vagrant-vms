#! /bin/sh -ex

cd /home/vagrant
rm -rf dev
mkdir dev
cd dev
if ! which ruby; then
    sudo apt install -y ruby
fi
AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR=1 ruby ../autoproj_bootstrap git https://github.com/rock-core/buildconf \
    --gemfile=/vagrant/autoproj_bootstrap/Gemfile \
    --seed-config=/vagrant/autoproj_bootstrap/config.yml

