#!/bin/bash -e
export PATH="$PATH:$HOME/.rvm/rubies/ruby-2.4.1/bin" &&\
git clone https://github.com/Artemmkin/reddit.git &&\
cd reddit && bundle install 
ls /tmp
if [[ -f /tmp/monolith-server-app.service ]]
then
    cp /tmp/monolith-server-app.service /etc/systemd/system &&\
    systemctl daemon-reload &&\
    systemctl enable monolith-server-app.service &&\
    systemctl start monolith-server-app.service
else
    echo '=========> [FAIL] Service file not found ================='
fi
