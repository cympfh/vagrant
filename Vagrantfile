# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.hostname = "himeji"
  config.vm.synced_folder "~/Downloads/", "/home/vagrant/Downloads"
  config.ssh.forward_x11 = true
  config.vm.provision :shell, :path => "provision.sh"
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
end
