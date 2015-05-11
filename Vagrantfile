# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_VERSION = 2

Vagrant.configure( VAGRANTFILE_VERSION ) do |config|
  config.vm.define "rails" do |rails|
    rails.vm.provider "docker" do |docker|
      docker.build_dir = "."
      docker.vagrant_vagrantfile = "./docker/Vagrantfile"

      docker.name  = "rails"
      docker.ports = ['3000:3000']
      docker.link "db:db"
    end
  end

  config.vm.define "db" do |db|
    db.vm.provider "docker" do |docker|
      docker.image   = "postgres"
      docker.vagrant_vagrantfile = "./docker/Vagrantfile"

      docker.privileged = true
      docker.volumes = ["/var/docker/postgresql:/data"] # Not correct
      docker.name    = "db"
      docker.ports   = ["5432:5432"]
      docker.has_ssh = false
      docker.env = {
        POSTGRES_USER:     "development",
        POSTGRES_PASSWORD: "730423d151b65e5e"
      }
    end
  end
end
