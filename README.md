# docker_mongodb_rs
基于docker的mongodb分片部署
注意-v映射的数据文件目录，在宿主机上创建对应的目录
详细的部署文档在csdn博客：https://blog.csdn.net/yekoufeng/article/details/83412431

conf 和testKeyFile.fie放到docker_mongodb_rs的上一级目录

配置时的一些命令汇总(无实际意义，方便拷贝，粘贴)


configsvr0 172.17.0.3
configsvr1 172.17.0.7
configsvr2 172.17.0.8
	
docker exec -it configsvr0 bash
mongo --host 172.17.0.3 --port 27019
	
rs.initiate(
  {
    _id: "rs_configsvr",
    configsvr: true,
    members: [
      { _id : 0, host : "172.17.0.3:27019" },
      { _id : 1, host : "172.17.0.7:27019" },
      { _id : 2, host : "172.17.0.8:27019" }
    ]
  }
)


docker run --name shardsvr00 -d mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr01 -d mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr02 -d mongo --shardsvr --replSet "rs_shardsvr0"  --bind_ip_all
docker run --name shardsvr10 -d mongo --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all
docker run --name shardsvr11 -d mongo --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all
docker run --name shardsvr12 -d mongo --shardsvr --replSet "rs_shardsvr1"  --bind_ip_all

shardsvr00 172.17.0.9
shardsvr01 172.17.0.10
shardsvr02 172.17.0.11
shardsvr10 172.17.0.12
shardsvr11 172.17.0.13
shardsvr12 172.17.0.14

docker exec -it shardsvr00 bash
mongo --host 172.17.0.9 --port 27018

rs.initiate(
  {
    _id : "rs_shardsvr0",
    members: [
      { _id : 0, host : "172.17.0.9:27018" },
      { _id : 1, host : "172.17.0.10:27018" },
      { _id : 2, host : "172.17.0.11:27018" }
    ]
  }
)

mongo --host 172.17.0.12 --port 27018

rs.initiate(
  {
    _id : "rs_shardsvr1",
    members: [
      { _id : 0, host : "172.17.0.12:27018" },
      { _id : 1, host : "172.17.0.13:27018" },
      { _id : 2, host : "172.17.0.14:27018" }
    ]
  }
)

docker run --name mongos0 -d --entrypoint "mongos" mongo --configdb rs_configsvr/172.17.0.3:27019,172.17.0.7:27019,172.17.0.8:27019 --bind_ip_all

mongos 172.17.0.15

docker exec -it mongos0 bash
mongo --host 172.17.0.15 --port 27017


sh.addShard("rs_shardsvr0/172.17.0.9:27018,172.17.0.10:27018,172.17.0.11:27018")
sh.addShard("rs_shardsvr1/172.17.0.12:27018,172.17.0.13:27018,172.17.0.14:27018")


sh.enableSharding("test")

sh.shardCollection("test.order", {"_id": "hashed" })

for (i = 1; i <= 1001; i=i+1){
db.order6.insert({"price": 1})
### 注：把conf.example移动到 上一级目录，并去掉.example
