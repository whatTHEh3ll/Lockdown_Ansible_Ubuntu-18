# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "Lockdown-ubuntu-18"
  # use for dhcp
  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "public_network", ip: "192.168.1.80", bridge: "wlo1"
    config.vm.provider "virtualbox" do |v|
          v.memory = 2048
          v.cpus = 1
      end
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_ed25519.pub").first.strip
    config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
    config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
    config.vm.provision 'shell', inline: 'echo "vagrant:a" | chpasswd'
    config.vm.provision 'shell', inline: "sudo apt update -y"
    config.vm.provision 'shell', inline: "sudo apt install python3"
    #config.vm.provision "shell", path: "vagrant-swapfile.sh", privileged: true
    #config.vm.synced_folder "local path here", "/home/vagrant/Projects"
    end

Vagrant.configure("2") do |config|
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = ""
     ansible.limit = "all"
     ansible.inventory_path = "../../../Ansible-Inventory/hosts"
     ansible.config_file = "ansible.cfg"
     #ansible.vault_password_file = "../../../ansible-PASSWORDS/MASTER.txt"
     #ansible.start_at_task = ""
     #ansible.skip_tags = ""
     #ansible.tags = ""
  end
end
   
  
