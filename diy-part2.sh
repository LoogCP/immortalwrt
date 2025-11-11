#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
#修改默认IP
sed -i 's/192.168.1.1/10.10.1.1/g' package/base-files/files/bin/config_generate

#修改默认shell
sed -i 's/\/bin\/ash/\/usr\/bin\/fish/g' package/base-files/files/etc/passwd

# 删除 golang 语言包
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f

# 删除 feeds 中的 v2ray-geodata 包（适用于 openwrt-22.03 和 master）
# rm -rf feeds/packages/net/v2ray-geodata

#切换dev分支hp
#rm -rf  feeds/luci/applications/luci-app-homeproxy
git clone -b dev #https://github.com/immortalwrt/homeproxy.git package/homrproxy

#添加pushbot
#git clone https://github.com/gaoyaxuan/luci-app-pushbot.git package/luci-app-pushbot

# 添加argon、infinityfreedom和alpha主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git package/luci-theme-infinityfreedom
git clone https://github.com/derisamedia/luci-theme-alpha.git package/luci-theme-alpha


# 复制 luci-app-airplay2 文件夹到 feeds/luci/applications/
# cp -r luci/applications/luci-app-airplay2/ feeds/luci/applications/luci-app-airplay2/

# Modify default IP
sed -i 's/192.168.1.1/10.10.1.1/g' package/base-files/files/bin/config_generate
