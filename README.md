# VagrantForgeSandbox

Common vagrant provisioning (certificates and sandbox rpms) for forge sandbox hidden in a gem. 

Requires vagrant base box converted from forge sandbox.

## Usage

Add this line to your application's Gemfile:

    gem 'vagrant-forge-sandbox', git: "https://github.com/artemave/vagrant-forge-sandbox.git"
    gem 'vagrant-vbguest' # not required but strongly advised

Install bundle:

    $ bundle

You need to specify your dev certificate (passwordless, in .pem format) in Vagrantfile:

    config.forge_sandbox.cert = "./my_dev_bbc_cert.pem"

This will end up in /root/.yum/dev.bbc.co.uk.pem on a sandbox whether you need it later for any project specific provisioning.

Use the following to generate a passwordless one from p12:
  
    $ openssl pkcs12 -in my_dev_bbc_cert.p12 -out my_dev_bbc_cert.pem -nodes

You can now run vagrant up/provision and it will automatically take care of keeping forge rpms up-to-date and certs set up.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[Artem Avetisyan](https://github.com/artemave)
