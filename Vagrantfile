# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box_check_update = false
  config.vm.define :devstack do |devstack|
    devstack.vm.box = 'generic/ubuntu1804'
    # Sync required source dirs. If your host OS support nfs, uncomment as required.
    #devstack.vm.synced_folder './', '/vagrant', type: 'nfs', mount_options: ['vers=3', 'tcp', 'nolock', 'rw']
    devstack.vm.synced_folder './', '/vagrant'
    #devstack.vm.synced_folder '~/src', '/home/vagrant/src', type: 'nfs', mount_options: ['vers=3', 'tcp', 'nolock', 'rw']
    devstack.vm.synced_folder '~/src', '/home/vagrant/src'
    # For libvirt:
    devstack.vm.provider :libvirt do |lv|
      lv.cpus = 4
      # Customize the amount of memory on the VM:
      lv.memory = '16384'
      # Enable nested virtualization
      lv.nested = true
    end
    # And for virtualbox:
    devstack.vm.provider :virtualbox do |vb|
      vb.cpus = 4
      vb.memory = '16384'
      vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
    end
    devstack.vm.network "private_network", ip: "192.168.56.2" # default vboxnet
    devstack.vm.provision :ansible_local do |ansible|
      ansible.playbook = 'ansible/playbook.yml'
    end
  end
end
