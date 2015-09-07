# -*- mode: ruby -*-
# vi: set ft=ruby :

install_tree = 'sudo apt-get -y install tree'
install_git = 'sudo apt-get -y install git'
remove_old_ruby = 'sudo apt-get remove ruby1.8'
install_packages_for_ruby = 'sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev'
wget_ruby_2_tar = 'wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p451.tar.gz'
extract_ruby_2_tar = 'tar xvzf ruby-2.0.0-p451.tar.gz'
make_ruby =<<-EOS
cd ruby-2.0.0-p451
sudo ./configure --prefix=/usr/local
sudo make
sudo make install
EOS

remove_ruby_2_tmp_files =<<-EOS
rm -rf ruby-2.0.0-p451.tar.gz
rm -rf ruby-2.0.0-p451
EOS

install_gems =<<-EOS
gem install rubocop -v 0.21.0 --no-ri --no-rdoc
gem install rspec -v 2.14.1 --no-ri --no-rdoc
EOS

$script = <<SCRIPT
WORKING_DIR=`pwd`
#{install_tree}
#{install_git}
#{remove_old_ruby}
#{install_packages_for_ruby}
#{wget_ruby_2_tar}
#{extract_ruby_2_tar}
#{make_ruby}
cd $WORKING_DIR
#{remove_ruby_2_tmp_files}
#{install_gems}
git clone https://github.com/tbpgr/codeiq_vagrant_for_rubocop.git
chown -R vagrant:vagrant /home/vagrant
SCRIPT

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.provision "shell", inline: "echo 'start provision'"
  config.vm.provision "shell", inline: $script
  config.vm.provision "shell", inline: "echo 'finish provision'"
end
