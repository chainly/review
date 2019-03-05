# grep
1. re
> https://regex101.com/

|symbol |meaning|
|-------|-------|
|.		|任意一个字符, 不包括\n|
|?		|前面一个分组有或者没有, (python:前面是通配符时为非贪婪匹配)|
|*		|前面一个分组任意个|
|+		|前面一个分组至少一个|
|^		|首|
|$		|尾|
|{m,n}	|前面分组m-n个|
|[]		|set|
||		|or|
|(re)	|分组/标记|
|余下为python|--|
|(?:)	|non-group|
|(?P<name>)|<-r["name"]|
|re(?=xx)|先匹配re的并匹配后者的==>re匹配|
|re(?!=xx)|同上取反|
|(?#)	|comment|
|(?(index/name)yes\|no)|have...?yes:no|

2. usage
grep -arg 'PATTERN' file/input


# sed
```
~= vim 's/xx/yy/g' '/PATTERN/action;n;action'
```

# awk
1. constant
```
$0 ...
NF
FS
NR
FNR
+ O
```

2. build-in function
```
# https://www.cnblogs.com/chengmo/archive/2010/10/08/1845913.html
awk 'BEGIN{srand();fr=int(100*rand());print fr;}'
```

3. e.g.
```
netstat -nt|awk 'BEGIN{OFS="\t"} {if (NR>2) {remote=$(NF-1);print "'"'"'"remote"'"'"'";++ARR[remote]} } END{for(i in ARR) print i,ARR[i]}'
```

# uniq sort
```
sort a |uniq  -c | sort -nr
```
