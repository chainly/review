# 1. console/tty/pty(ptmx/pts)/sshd方式
> https://segmentfault.com/a/1190000009082089
console(终端): 单用户使用的终端, console-->shell
tty(虚拟终端): 相当于虚拟console终端, c-->tty-->shell
pty(伪终端): local-->ptmx-->pts-->shell; ref: pty.openpty/os.openpty
sshd方式: c-->sshd-->ptmx-->pts-->shell

# 进程/线程/协程/进程组/会进程
```
# https://www.cnblogs.com/fah936861121/articles/8043187.html
进程: 资源分配的基本单位; fork(): 将父进程的全部资源复制(写复制, etc.)给了子进程
线程: 调度的基本单位, 共享进程资源, 切换消耗更小; clone/pthread_create(): 只是复制了一小部分必要的资源
协程: 运行于同一进程/线程, 用户主动切换(依次调用next(协程)-->(协程在)yield处返回))
# https://www.cnblogs.com/liqiuhao/p/8087539.html
# https://www.cnblogs.com/ISeeIC/p/3624271.html
# ps -j
进程组: 多个进程组成，便于统一控制
shell进程: 单独进程组, Session Leader，fork其他进程;使用setpgid指定某进程为新进程组leader,相应进程也移入
会话: 打开一个终端即创建一个会话；创建shell进程; 结束会发送SIGHUP
```

# 前后台环境初始化顺序
```
登录
交互
```
