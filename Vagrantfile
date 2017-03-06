# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'himeji'
  config.vm.synced_folder '~/Downloads', '/home/vagrant/Downloads'
  config.vm.synced_folder '~/Dropbox', '/home/vagrant/Dropbox'
  config.vm.synced_folder '~/.dots', '/home/vagrant/.dots'
  config.ssh.forward_x11 = true
  config.vm.provision :shell, path: 'provision.sh'
  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
