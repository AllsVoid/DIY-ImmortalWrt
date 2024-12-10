#!/bin/bash
# 用于 feeds 更新相关操作

# 添加 [small](https://github.com/kenzok8/small) 源
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
