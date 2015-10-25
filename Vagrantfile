VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "master" do |master|
    master.vm.box = "AntonioMeireles/coreos-stable"

    master.vm.network "public_network"

    master.vm.provider "virtualbox" do |vbox|
      vbox.name = "kubernetes-master"
      vbox.memory = 512
      vbox.cpus = 1
    end
  end

  config.vm.define "minion-1" do |minion|
    minion.vm.box = "AntonioMeireles/coreos-stable"

    minion.vm.network "public_network"

    minion.vm.provider "virtualbox" do |vbox|
      vbox.name = "kubernetes-minion-1"
      vbox.memory = 512
      vbox.cpus = 1
    end
  end

  config.vm.define "minion-2" do |minion|
    minion.vm.box = "AntonioMeireles/coreos-stable"

    minion.vm.network "public_network"

    minion.vm.provider "virtualbox" do |vbox|
      vbox.name = "kubernetes-minion-2"
      vbox.memory = 512
      vbox.cpus = 1
    end
  end
end
