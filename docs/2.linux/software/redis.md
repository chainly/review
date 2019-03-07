# redis
k-v

## date type for v
> https://redis.io/topics/data-types-intro

1. string
2. list: 队列,阻塞访问BRPOP, BLPOP 
3. set: set
4. sorted set: for i in this: i ~= (score, v), i is sorted by score in this
5. hash: dict with string limited?
6. Bit arrays: 2进制位图，第i位(0,1)表示: i is False or True; 例如统计一年多少天登录过需要366bit
7. HyperLogLogs: 
	# example
	http://content.research.neustar.biz/blog/hll.html
	# explain
	http://antirez.com/news/75
	1. list=64k
	# 分2^^14组， 50位比特数中，记录到尾部连续(连续为正面m-1=1)
	# m-1个全0的为(1/2^^(m-1))，就概率有2^^m -1个不同已出现
	2. h = hash(string) 64bit 分割14bit(其10进制数对应list.index),50bit(最右边非0位**2对应list.value)
	3. 倒数平均数(set)
8. Streams: append only list

## 安装
### 单机
pass

### cluster 
> https://redis.io/topics/cluster-tutorial
cluster-enabled yes
同kafaka, 采用选举模式, 除了学要使用命令开启过程
redis-cli --cluster create 127.0.0.1:7000 127.0.0.1:7001 \
127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 \
--cluster-replicas 1

同步使用异步、同步写



### config
maxmemory: peak memory usage


## 使用
1. base
	https://redis.io/commands
2. mq
	https://redis.io/topics/pubsub
3. Transactions
	https://redis.io/topics/transactions
4. loadbalance/hashring
	https://redis.io/topics/partitioning
5. 分布式锁逻辑
	1. 单点逻辑: 
	clinet.set(lock.name, clinet.uuid, only_not_exist) ? (
		do something done; client.get(lock.name) == client.uuid ?return del(lock) : return 0
		) : return -1
	2. 多点逻辑: 多数派逻辑(长用于选举)
	依次按1, 获取各个节点锁，过一半即可认为获取到; else del all if lock.name.v == client.uuid
6. persistence
	https://redis.io/topics/persistence
	RDB: 快照
	AOF: 类似mysql, 可选多久将记录同步到磁盘
	
