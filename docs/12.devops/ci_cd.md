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

## 
