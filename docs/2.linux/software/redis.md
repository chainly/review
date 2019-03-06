# redis
k-v

## date type for v
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
	# 分2^^14组， 50位比特数中，只记录尾部为
	# m-1个全0的为1，就概率有2^^m个已出现
	2. h = hash(string) 64bit 分割14bit(其10进制数对应list.index),50bit(最右边非0位**2对应list.value)
	3. 倒数平均数(set)
8. Streams: append only list

## 
