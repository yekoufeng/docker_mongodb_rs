#!/bin/bash 
#backup MongoDB 
  
#mongodump命令路径 
DUMP=/usr/local/mongodb/bin/mongodump
#临时备份目录 
OUT_DIR=/data/mongodb_bak/mongodb_bak_now
#备份存放路径 
TAR_DIR=/data/mongodb_bak/mongodb_bak_list
#获取当前系统时间 
DATE=`date +%Y_%m_%d` 
#数据库账号 
DB_USER=gamemailoperator 
#数据库密码 
DB_PASS=HVdkFqdIHq832reBeX0RAlTmJbAUpH 
#DAYS=15代表删除15天前的备份，即只保留近15天的备份 
DAYS=15 
#最终保存的数据库备份文件 
TAR_BAK="mongodb_bak_$DATE.tar.gz"
  
cd $OUT_DIR 
rm -rf $OUT_DIR/* 
mkdir -p $OUT_DIR/$DATE 
#备份全部数据库 
$DUMP -h 172.28.183.114:27017 -u $DB_USER -p $DB_PASS --authenticationDatabase "gamemail" -o $OUT_DIR/$DATE 
#压缩为.tar.gz格式 
tar -zcvf $TAR_DIR/$TAR_BAK $OUT_DIR/$DATE 
#删除15天前的备份文件 
find $TAR_DIR/ -mtime +$DAYS -delete 
  
exit

