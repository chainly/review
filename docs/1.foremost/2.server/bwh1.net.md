# 虚拟机购买
1. 地址
- 官网: https://bwh1.net
- 中文官网: http://banwagong.cn/
- 优惠码: http://banwagong.cn/#coupon
- 购买: https://bwh8.net/cart.php
- 控制台: https://bwh8.net/clientarea.php?action=products


2. ssh-key login shell
- https://www.cnblogs.com/jager/p/5986563.html
```
cd ~
mkdir .ssh
chmod 700 .ssh
ssh-keygen -f .ssh/id_rsa -N ''
clear
cat .ssh/id_rsa
ip -f inet  addr show dev eth0 |grep -o -E --color '[^ ]*/[0-9]+'
yum install net-tools -y
netstat -lntp|grep ssh
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
```

3. 初始化
3.1 basic package
```
yum install vim \
  gcc \
  gcc-c++ \
  git \
  python-setuptools
```

3.2 python
3.2.1 python3 
```
@TODO
# pyenv
# or conda
```

3.2.2 shadowsocks
```
# shadowsocks: https://github.com/shadowsocks/shadowsocks/tree/master
pip install git+https://github.com/shadowsocks/shadowsocks.git@master \
  django 
  
# shadowsocks-server
# shadowsocks-config: https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File
cat >> /etc/shadowsocks.json <<EOF
{
    "server":"144.34.188.163",
    "server_port": 6666,
    "local_address": "127.0.0.1",
    "local_port": 8888,
    "password":"xxx",
    "timeout": 300,
    "method":"aes-256-cfb",
    "fast_open": false
}
EOF

# shadowsocks control
ssserver -c /etc/shadowsocks.json -d start

# shadowsocks-windows: https://github.com/shadowsocks/shadowsocks-windows
# chrome-SwitchyOmega: https://github.com/FelisCatus/SwitchyOmega
```

