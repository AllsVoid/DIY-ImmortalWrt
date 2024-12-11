#!/bin/bash

uci set interface.@interface[-1]='lan'
uci set interface.lan=device='br-lan'
uci set interface.lan=proto='static'
uci set interface.lan=ipaddr='192.168.5.1'
uci set interface.lan=netmask='255.255.255.0'
uci set interface.lan=ip6assign='60'
uci add_list interface.lan.dns='192.168.5.1'

# 创建或修改 'wan' 接口
# 根据自己的配置修改，或使用 files 大法
uci set interface.@interface[-1]='wan'
uci set interface.wan=device='eth0'
# uci set interface.wan=proto='pppoe'
uci set interface.wan=proto='DHCP'
uci set interface.wan=ifname='eth0'
# uci set interface.wan=username='admin'
# uci set interface.wan=password='password'
uci set interface.wan=ipv6='auto'

# 创建或修改 'wan6' 接口，不需要注释即可
uci set interface.@interface[-1]='wan6'
uci set interface.wan6=device='eth0'
uci set interface.wan6=proto='dhcpv6'
uci set interface.wan6=reqaddress='try'
uci set interface.wan6=reqprefix='auto'

# 创建或修改 'device' 配置，根据自己的网口选择去填写
uci set device.@device[-1]='br-lan'
uci set device.br-lan=name='br-lan'
uci set device.br-lan=type='bridge'
uci add_list device.br-lan.ports='eth1'
uci add_list device.br-lan.ports='eth2'
uci add_list device.br-lan.ports='eth3'

# 应用更改
uci commit

/etc/init.d/network restart