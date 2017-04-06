
sudo apt-get -y update

sudo apt-get install -y curl vim tree tmux unzip git

sudo apt-get install -y python3-pip python3-venv python3-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev 

#Installing MONGO
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb --allow-unauthenticated


sudo mkdir -p /data/db
sudo mongod --fork --logpath /var/log/mongodb.log
sudo apt-get install -y golang ruby ruby-dev
sudo apt-get install -y nodejs npm redis-server
sudo gem install health-data-standards
sudo gem install highline


export GOPATH=/home/vagrant/go


#INSTALL GLIDE
sudo add-apt-repository -y  ppa:masterminds/glide && sudo apt-get update
sudo apt-get install -y glide
sudo  ln -s /usr/bin/nodejs /usr/bin/node
git clone https://github.com/mitre/node-cqm-engine.git
git clone https://github.com/mitre/ecqm-frontend.git
git clone https://github.com/synthetichealth/synthea.git

sudo chown -R vagrant /home/vagrant

mkdir -p $GOPATH/src/github.com/mitre
mkdir -p $GOPATH/src/github.com/synthetichealth
cd $GOPATH/src/github.com/mitre
git clone https://github.com/mitre/ecqm.git



cd $GOPATH/src/github.com/synthetichealth
git clone https://github.com/synthetichealth/gofhir.git
cd gofhir



