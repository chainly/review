# 监控基本结构

## 基础操作对象定义
```
HOST {
	name
	ip
	port
	ssh
	...
}

GROUP {
	name
	desc
	...
}

SERVICE {
	name
	desc
	...
}

CMD {
	name
	executor
	env
	args
	return
	help
	...
}

CONTACTS USER/GROUP TEMPLATE...
```

## 对象连接定义
```
TASK {
	name
	cmd
	intv
	return
	contact
	user
	...
}

ROLE {
	name
	host
	group
	task
	...
}



## middleware/plugin
middleware: 接收任务request/rep，处理，返回request/rep
plugin: 可导入的不同功能，相同处理方式的一系列模块

## sync/async
pass

## pull/push
pass

## 结构化数据
pass

## 反馈
web: graph, ctr ...
alert: intv, suspend, ...

## api
pass
