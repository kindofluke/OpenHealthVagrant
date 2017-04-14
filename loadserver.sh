

export GOPATH=/home/vagrant/go


echo "Server Start Ups"
#Get NODE-CQM-ENGINE Happy
cd /home/vagrant/node-cqm-engine
npm install


## REPLACE WITH CORRECT USER AND PASSWORD 
curl -u hsimpson:DUFFmoesbar! https://cypress.healthit.gov/measure_bundles/ > bundle.zip
nodejs load_bundle.js -b bundle.zip

#USE FOREVER TO START CQM QUEUES AND CALCULATION JOBS
sudo npm install forever -g

#Build Ecqm FrontEnd depdencies
cd /home/vagrant/ecqm-frontend
npm install
sudo npm install -g webpack
echo "Node Webpack for Front End"
NODE_ENV=production webpack --config ./webpack.production.config.js --progress


sudo chown -R vagrant /home/vagrant

#Ensure Versioning between GoFhir and Synthea
cd $GOPATH/src/github.com/synthetichealth/gofhir
git checkout stu3_aug2016

cd $GOPATH/src/github.com/mitre/ecqm
go get github.com/Masterminds/glide
glide install
go install

touch run.sh
sudo echo "export GOPATH=/home/vagrant/go 
 go run server.go -assets /home/vagrant/ecqm-frontend/dist" > run.sh




cd /home/vagrant/synthea
git checkout v1.0.0
sudo gem install bundler
bundle install


#Generate Synthea
bundle exec rake synthea:generate['./config/Suffolk_County.json']
bundle exec rake synthea:generate['./config/Bristol_County.json']
bundle exec rake synthea:generate['./config/Essex_County.json']



## TO START SERVERS Run the following lines 
# cd /home/vagrant/node-cqm-engine
#forever start calculation_job.js
#forever start qr_monitor.js
# cd /home/vagrant/go/src/github.com/mitre/ecqm
#forever start -c sh run.sh


#sleep 10s
#forever logs calculation_job.js
#forever logs qr_monitor.js
#forever logs run.sh

#bundle exec rake synthea:fhirupload[http://localhost:3001]

