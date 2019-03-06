# lvs
> https://blog.csdn.net/Ki8Qzvka6Gz4n450m/article/details/79119665

VIP--DR--->IP1	--> IP2--lo2
		|--> IP3--lo3

```
# DR:
echo 1 > /proc/sys/net/ipv4/ip_forward
```

## 模式
1. NAT
按规则当前选择后端(e.g. IP3)
```
client-->VIP
# 采用NAT技术,
VIP-->NAT-->IP3: 改变DIP: VIP->IP3
# **VIP为出口网关**才能再经过VIP
IP3-->NAT-->VIP: 改变DIP: IP3->VIP
```

2. tunnel
```
# 将NAT换成IP TUNNEL
VIP-->IP TUNNEL-->IP3: 添加tunnel头: CIP--> IP3)
IP3-->CIP
```

*3. DR
```
# 在后端添加环回口lo2,lo3
1. IP=VIP
2. https://www.cnblogs.com/lipengxiang2009/p/7451050.html
	echo "1" >/proc/sys/net/ipv4/conf/lo/arp_ignore
	echo "2" >/proc/sys/net/ipv4/conf/lo/arp_announce
	echo "1" >/proc/sys/net/ipv4/conf/all/arp_ignore
	echo "2" >/proc/sys/net/ipv4/conf/all/arp_announce

# 修改IP 变为修改mac
VIP-->MAC-->IP3: smac=IP1.mac; dmac=IP3.mac
IP3-->lo3
lo3-->IP3-->CIP
```

# keepalive
调用lvs，管理VIP迁移
