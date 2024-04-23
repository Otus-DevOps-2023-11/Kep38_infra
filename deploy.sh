#!usrbinenv bash
#

sudo apt update
sudo apt install git -y
git clone -b monolith httpsgithub.comexpress42reddit.git
cd reddit && bundle install
puma -d
ps aux  grep puma