Vagrant configuration to create libvirt-based VMs for flat fish front/back builds

Vagrant, Chef and libvirt install
===========================

 - Install the vagrant deb (http://vagrantup.com)
 - Install the ChefDK (https://downloads.chef.io/chef-dk/)
 - Install the vagrant-berkshelf plugin
   `vagrant plugin install vagrant-berkshelf`

~~~
# Install the vagrant-libvirt plugin https://github.com/pradels/vagrant-libvirt
sudo apt install qemu-kvm
# You might have to remove the liblzma shipped with vagrant and replace by
# symlinks to the system's
# 
# Don't do it unless you start seeing symbol resolution problems
#
# Reference: https://github.com/mitchellh/vagrant/issues/5787
sudo -i
cd /opt/vagrant/embedded
rm -f lib/liblzma.*
ln -s /lib/x86_64-linux-gnu/liblzma.so.* lib/
# Install the libvirt-bin package.
sudo apt install libvirt-bin
# Make sure the local user is a member of the libvirtd group by running
# 'id'. If it is not, run "adduser YOURUSER libvirtd" and log out / log in to
# apply to the current login shell

# Install the vagrant plugins
vagrant plugin install vagrant-libvirt

# At this point, vagrant should be operational

Libvirt images
==============
I'm pushing some libvirt images to the Hashicorp atlas. Check out
https://atlas.hashicorp.com/sylvainjoyeux.

Converting a virtualbox image into a libvirt image
==================================================

If you need other libvirt images, you can use the vagrant mutate plugin to
convert them

# Download the ubuntu/trusty64 box and convert it to a libvirt box
# Needed for mutate
sudo apt install qemu-utils
vagrant box add ubuntu/trusty64
vagrant plugin install vagrant-mutate
vagrant mutate ubuntu/trusty64 libvirt

# You're good to go
~~~

Additional Vagrant plugins
==========================

Those are a list of vagrant plugins that are not required, but are generally
useful

- [cachier](http://fgrehm.viewdocs.io/vagrant-cachier) caches the various
  packages, allowing to re-provision a VM that much faster
- [sahara](https://github.com/jedi4ever/sahara) provides a sandbox (save current
  state and allows to rollback to it)

Starting one of the VMs
Troubleshooting
===============

~~~
Error while creating domain: Error saving the server: Call to virDomainDefineXML
failed: unknown OS type hvm
~~~

Assuming you installed qemu-kvm as instructed above, restart libvirt-bin with
`systemctl restart libvirt-bin.service`

