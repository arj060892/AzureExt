sudo apt-get update
sudo apt-get install vim
curl -s https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh.deb | sudo bash
sudo apt-get install eventstore-oss=4.0.0
sudo mkdir -p /data/esdb/index
sudo chown eventstore:eventstore /data/esdb
sudo chown eventstore:eventstore /data/esdb/index
cd /etc/eventstore/
sudo rm eventstore.conf
sudo sh -c 'cat << EOF >> eventstore.conf
IntIp: 0.0.0.0
ExtIp: 0.0.0.0
IntHttpPrefixes: http://*:2112/
ExtHttpPrefixes: http://*:2113/
AddInterfacePrefixes: false
RunProjections: All
Db: /data/esdb
Index: /data/esdb/index
ClusterSize: 3
GossipSeed: 10.217.117.6:2112,10.217.117.7:2112
DiscoverViaDns: False
EOF'
sudo service eventstore start
