VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "private_network", ip: "192.168.50.10"
  config.vm.hostname = "jenkins-vm"
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "jenkins-vm.yml"
  end
end
