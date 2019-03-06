#! /bin/bash
# trap -l
trap '' HUP

# source
# may use in contab
# https://blog.csdn.net/dufufd/article/details/80307586
. /etc/profile

# check by test
# better use [ ] so that you can run in macos
if [ ! -f "/etc/profile" ]; then
	exit 1
fi

[ -f "/etc/profile" ] || exit 1

# set
PWD=$(pwd)
CMDPATH=`dirname $0`

# 字符串处理
echo $PWD

## 截取
echo ${PWD#*/}
echo ${PWD##*/}
echo ${PWD%/*}
echo ${PWD%%/*}

## var:start :count(absent=max)
echo ${PWD:0:4}
echo ${PWD:1}
echo ${PWD:-3}  # wrong; return self
echo ${PWD:1-3}  # = :-2
echo ${PWD:0-3}
echo ${PWD:0-3:2}
echo ${PWD:0-3:}  # wrong: return ''
echo ${PWD:1:}  # wrong; return ''

## 变量处理 @TODO: 可能还有''与unset的区别
var1=''
var2='xx'
#var3=''

### 检查是否有值?1:2
var4=${var2:-"unset or empty"}
echo $var2,$var4
### 检查是否有值?1:2&&1赋值为2
var5=${var1:="no"}
echo $var1,$var5
### 检查是否有值?赋值:exit "msg"
var6=${var1:?"replace"}
echo $var1,$var6
### 检查是否有值?赋值:pass
var7=${var3:+"no thing"}
echo $var3,$var7


# function
exit_msg() {
	code=$1
	echo $code|egrep '^[0-9]+$' >>/dev/null 2>&1 || exit_msg 99 bad code
	shift
	msg="$*"
	echo "$msg"
	exit $code
}

#exit_msg 1.1 just raise
#exit_msg 1 just raise

# main logic
# code and for if etc.
find . -type f -exec ls -l {} \;
