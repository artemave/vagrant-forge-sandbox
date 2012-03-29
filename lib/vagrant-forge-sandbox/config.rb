module VagrantForgeSandbox
  class Config < Vagrant::Config::Base
    attr_accessor :cert

    def validate(env, errors)
      if cert
        errors.add "Certificate file not found." unless File.exists?(cert)
      else
        errors.add "Missing path to certificate. Specify 'config.forge_sandbox.cert' in Vagrantfile"
      end
    end
  end
end

