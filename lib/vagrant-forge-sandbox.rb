require 'vagrant'
require "vagrant-forge-sandbox/version"
require "vagrant-forge-sandbox/config"
require "vagrant-forge-sandbox/middleware"

Vagrant.config_keys.register(:forge_sandbox) { VagrantForgeSandbox::Config }
Vagrant.actions[:start].insert_before Vagrant::Action::VM::Provision, VagrantForgeSandbox::Middleware
Vagrant.actions[:provision].insert_before Vagrant::Action::VM::Provision, VagrantForgeSandbox::Middleware
