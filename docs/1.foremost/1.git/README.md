---
title: git
layout: home
---


1. login: https://github.com/login?return_to=%2Fchainly
1. new: https://github.com/new
	```
	# or local git init
	# user settings
	git config --global user.email "1258626769qq.com"
	git config --global user.name "chainly"
	mkdir review && cd review
	git init
	git remote add origin git@github.com:chainly/review.git
	touch README.md
	git add .
	git commit -m "init"
	git push -u origin master
	```

1. git update
	```
	# Q: fatal: Could not read from remote repository.
	# A1: ssh-keygen
	# add ssh-key.pub: https://github.com/settings/keys
	git clone git@github.com:chainly/review.git
	
	# about empty dir
	# https://stackoverflow.com/a/115992/6493535
	# https://stackoverflow.com/a/8944077/6493535
	
	git add docs
	git commit -m "add docs"
	git push
	
	# https://blog.csdn.net/weixin_35955795/article/details/54314528
	# Q: warning: push.default is unset;
	# A: matching(all) --> simple(current branch)
	git config --global push.default simple
	```

1. git pull
	```
	git pull --ff-only origin master
	```

1. git stash
	```
	# 需要暂存当前工作，在当前分支开发突增任务
	# 或 同步远程修改
	git stash save -a 'msg'  # the first one, as it use stack
	# ...
	git stash pop
	# merge or go on
	```

1. git reset: pass
1. git repush: 
	```
	# e.g. fix commitor's email
	git config --global user.email "1258626769@qq.com"
	
	# 1. 覆盖
	git reset --soft HEAD^
	#git add .
	git commit -m "repush with right user info"
	
	#**IT OVERWRITTES OR IS OVERWRITEEN BY OTHERS(NOT NOTICED!)'S COMMIT
	#USE ONLY YOU KNOW WHAT WOULD HAVE DONE
	#补救：https://www.jianshu.com/p/41cef45ef6ce
	#git reflog show --all
	#git reset --hard ${LAST HASH}**
	#**
	git push -f
	
	# 内容回退提交
	# 2. revert
	git revert --no-commit A..HEAD 
	
	# 3. reset (for all option: reset HEAD to ${HASH})
	# https://git-scm.com/docs/git-reset#git-reset-emgitresetemltmodegtltcommitgt
	# Resets the index，and working tree(here ~= undo)
	git reset --hard ${HASH}
	# all your changed files "Changes to be committed"(here ~= add undo)
	git reset --soft HEAD^
	# @TODO: maybe something wrong, but tested!
	
	# --mixed: Resets the index but not the working tree
	# https://stackoverflow.com/a/2530073/6493535
	# --merge: mixed 但保持commit间不同以及当前修改未提交的(同时满足的action.abort)
	# --keep: mixed 但保持commit间不同(此文件当前有修改action..abort)
	```
	

