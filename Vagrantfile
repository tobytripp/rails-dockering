# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_VERSION = 2

Vagrant.configure( VAGRANTFILE_VERSION ) do |config|
  config.vm.define "ruby" do |ruby|
    ruby.vm.provider "docker" do |docker|
      docker.build_dir = "."

      docker.name            = "basic-rails"
      docker.create_args     = ['-i', '-t']
      docker.cmd             = ["bundle", "exec", "rails", "server"]

      docker.remains_running = false
      docker.ports           = ['3000:3000']
      # docker.link "db:db"
    end
  end

  config.vm.define "db" do |db|
    db.vm.provider "docker" do |docker|
      docker.image   = "postgres"
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
