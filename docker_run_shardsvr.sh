docker run --name shardsvr00 -d -v /home/mongodb/conf/mongod_shard0.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr00/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr00:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
docker run --name shardsvr01 -d -v /home/mongodb/conf/mongod_shard0.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr01/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr01:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
docker run --name shardsvr02 -d -v /home/mongodb/conf/mongod_shard0.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr02/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr02:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
docker run --name shardsvr10 -d -v /home/mongodb/conf/mongod_shard1.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr10/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr10:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
docker run --name shardsvr11 -d -v /home/mongodb/conf/mongod_shard1.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr11/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr11:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
docker run --name shardsvr12 -d -v /home/mongodb/conf/mongod_shard1.conf:/data/db/mongod.conf -v /home/mongodb/testKeyFile.file:/data/db/key.file -v /home/mongodb/log/sh/shardsvr12/shards.log:/data/db/log/shards.log -v /home/mongodb/data/sh/shardsvr12:/data/db mongo  --config /data/db/mongod.conf --profile=1 --slowms=10
#docker run --name shardsvr01 -d -v /home/mongodb/data/sh/shardsvr01:/data/db mongo --shardsvr --replSet "rs_shardsvr0" --storageEngine wiredTiger --bind_ip_all
#docker run --name shardsvr02 -d -v /home/mongodb/data/sh/shardsvr02:/data/db mongo --shardsvr --replSet "rs_shardsvr0" --storageEngine wiredTiger --bind_ip_all
#docker run --name shardsvr10 -d -v /home/mongodb/data/sh/shardsvr10:/data/db mongo --shardsvr --replSet "rs_shardsvr1" --storageEngine wiredTiger --bind_ip_all
#docker run --name shardsvr11 -d -v /home/mongodb/data/sh/shardsvr11:/data/db mongo --shardsvr --replSet "rs_shardsvr1" --storageEngine wiredTiger --bind_ip_all
#docker run --name shardsvr12 -d -v /home/mongodb/data/sh/shardsvr12:/data/db mongo --shardsvr --replSet "rs_shardsvr1" --storageEngine wiredTiger --bind_ip_all
