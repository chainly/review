# CI

## 版本控制
### git
#### hooks
1. github: https://github.com/chainly/review/settings/hooks/new
2. git
	# https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
	# ${GITREPO.ROOT}/.git/hooks/
	# https://www.viget.com/articles/two-ways-to-share-git-hooks-with-your-team/
	# @WARN: just copy if not exist!others
	# @BETTER: https://stackoverflow.com/a/26624598/6493535
	# pre-commit.d/xxx
	test -z "$(git fetch --dry-run 2>&1)" && echo 1 || echo 2

### svn
pass

## 测试部署
### 流程
- 通过webhook/web/cmd触发
- 自动生成/初始化目标机器(集群)
- 通过ssh/api等协议连接console
- 执行自动测试脚本
- 反馈结果
- clear

### 工具
- Jenkins
- Travis CI
- 

#### 触发
- git.hooks/webhooks
- web
- ansible/...
-

#### vm
- openstack
- docker

#### remote.execute
- paramiko
- websocket
- pty

#### 测试
- unittest
- 脚本

#### 反馈
pass

# CD
## 生产版本部署
pass


