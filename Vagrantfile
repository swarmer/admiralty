VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/wily64"
    master.vm.network "private_network", ip: "192.168.130.10"

    master.vm.provider "virtualbox" do |vbox|
      vbox.name = "kubernetes-master"
      vbox.memory = 512
      vbox.cpus = 1
    end

    master.vm.provision "ansible" do |ansible|
      ansible.playbook = "provision-master.yml"
      ansible.groups = {"kubernetes-master" => ["master"]}
    end
  end

  # config.vm.define "minion-1" do |minion|
  #   minion.vm.box = "ubuntu/vivid64"

  #   minion.vm.network "private_network", ip: "192.168.130.11"

  #   minion.vm.provider "virtualbox" do |vbox|
  #     vbox.name = "kubernetes-minion-1"
  #     vbox.memory = 512
  #     vbox.cpus = 1
  #   end
  # end

  # config.vm.define "minion-2" do |minion|
  #   minion.vm.box = "ubuntu/vivid64"

  #   minion.vm.network "private_network", ip: "192.168.130.12"

  #   minion.vm.provider "virtualbox" do |vbox|
  #     vbox.name = "kubernetes-minion-2"
  #     vbox.memory = 512
  #     vbox.cpus = 1
  #   end
  # end
end
