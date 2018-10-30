docker run -d --name configsvr0  -v /home/mongodb/data/cs/configsvr0:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
docker run -d --name configsvr1  -v /home/mongodb/data/cs/configsvr1:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
docker run -d --name configsvr2  -v /home/mongodb/data/cs/configsvr2:/data/configdb mongo --configsvr --replSet "rs_configsvr"  --bind_ip_all
