docker run --name shardsvr00 -d -v /home/mongodb/data/sh/shardsvr00:/data/db mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr01 -d -v /home/mongodb/data/sh/shardsvr01:/data/db mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr02 -d -v /home/mongodb/data/sh/shardsvr02:/data/db mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr10 -d -v /home/mongodb/data/sh/shardsvr10:/data/db mongo --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all
docker run --name shardsvr11 -d -v /home/mongodb/data/sh/shardsvr11:/data/db mongo --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all
docker run --name shardsvr12 -d -v /home/mongodb/data/sh/shardsvr12:/data/db mongo  --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all
