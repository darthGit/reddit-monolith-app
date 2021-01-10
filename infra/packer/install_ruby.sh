#!/bin/bash
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
source ~/.bash_profile
rvm autolibs enable
rvm install 1.9.3
rvm use 1.9.3 --default
rvm use 1.9.3@global
echo "install: --no-rdoc --no-ri" >> ~/.gemrc
echo "update: --no-rdoc --no-ri" >> ~/.gemrc
gem install bundler
gem install rake 