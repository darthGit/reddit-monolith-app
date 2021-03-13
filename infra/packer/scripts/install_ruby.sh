#!/bin/sh
echo "--------------------> Add gpg key" &&\
#gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&\
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB &&\
echo "--------------------> Install rvm" &&\
curl -sSL https://get.rvm.io | bash -s stable &&\
echo "--------------------> Activate source" &&\

#echo 'export PATH="$PATH:$HOME/.rvm/bin"' >> /home/appuser/.bashrc
#echo 'export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.4.1/bin"' >> /home/appuser/.bashrc
#source ~/.rvm/scripts/rvm &&\
#source /home/appuser/.rvm/scripts/rvm &&\
export PATH="$PATH:$HOME/.rvm/bin" &&\
echo "---------------------> Rvm install pacs" &&\
rvm requirements &&\
rvm install 2.4.1 &&\
#rvm use 2.4.1 --default &&\
export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.4.1/bin" &&\
bash -l -c "rvm use 2.4.1 -- default" &&\
bash -l -c "gem install bundler -V --no-ri --no-rdoc" &&\
ruby -v &&\
bundle -v 
printenv
