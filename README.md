# Vagrant::ForgeSandbox

Common vagrant provisioning for forge sandbox hidden in a gem

## Usage

Add this line to your application's Gemfile:

    gem 'vagrant-forge-sandbox'

Install bundle:

    $ bundle

    # this will move into gem itself
    $ curl -o ./deps/ca.pem https://ca.dev.bbc.co.uk/ca.pem
    $ keytool -import -alias CA -file ./deps/ca.pem -keystore ./deps/jssecacerts

Copy your dev certificate (passwordless, in .pem format) to ./deps/certificate.pem
  
    $ openssl pkcs12 -in ~/.my_dev_bbc_cert.p12 -out ./deps/certificate.pem -nodes

You can now run vagrant up/provision and it will automatically take care of keeping forge rpms and setup up-to-date

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Author

[Artem Avetisyan](https://github.com/artemave)
