#!/bin/bash -x

function setup_certificates {
  cp -f ./cert.pem ~/.yum/dev.bbc.co.uk.pem
  cp -f ./cert.pem ~/.yum/dev.bbc.co.uk.key
  cp -f ./ca.pem ~/.subversion/ca.pem

  openssl pkcs12 -export -in ./cert.pem -out ~/.subversion/dev.bbc.co.uk.p12 -passout pass:
  cat ./servers >> ~/.subversion/servers
}

function install_dependencies {
  yum clean all
  yum -y update --noplugins
  yum clean all

  yum -y install --noplugins --skip-broken \
    bbc-pal-sandbox-packages
}

function setup_and_run_rest_assured {
  yum -y install --noplugins --skip-broken \
    mysql-server \
    mysql-devel \
    ruby \
    ruby-devel \
    rubygems

  gem install mysql --no-ri --no-rdoc 
  gem install json --no-ri --no-rdoc
  gem install rest-assured --no-ri --no-rdoc 

  service mysqld restart
  mysqladmin create rest_assured

  rest-assured -a mysql -p 4578 &
}

# make sure hostname 'sandbox' resolves to localhost. That is needed by (probably, but not sure) jmx stuff
grep '127.0.0.1 sandbox' /etc/hosts || echo '127.0.0.1 sandbox' >> /etc/hosts

setup_certificates
install_dependencies
#setup_and_run_rest_assured
