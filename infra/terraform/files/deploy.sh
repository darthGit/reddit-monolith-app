#!/bin/bash
set -e

source ~/.profile
export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.4.1/bin"
rm -rf reddit
git clone https://github.com/Artemmkin/reddit.git
cd reddit
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
