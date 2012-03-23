# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vagrant-forge-sandbox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["artemave"]
  gem.email         = ["artemave@gmail.com"]

  gem.description   = %q{Common vagrant provisioning for forge sandbox hidden in a gem}

  gem.summary       = %q{Common vagrant provisioning for forge sandbox hidden in a gem}

  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "vagrant-forge-sandbox"
  gem.require_paths = ["lib"]
  gem.version       = Vagrant::ForgeSandbox::VERSION
end
