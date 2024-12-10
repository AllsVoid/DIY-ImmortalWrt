# DIY-ImmortalWrt

使用 Github Actions 辅助编译 ImmortalWRT 系统
> 虽然理论上 Lean/OpenWRT 都可以编译啦~

## 使用方法
### 默认模式
进入 `Actions`，点击 `🔧 编译` -> `Run workflow`，设定配置\
以 *https://github.com/myName/myRepo* 为例
- 仓库拥有者 -> myName
- 仓库名 -> myRepo
- 分支 -> master
- 多线程编译(若使用 Lede 源码编译 ipk 时可能会由于文件锁问题导致 ipk 编译错误，可以尝试关闭，)
理论上可以自己修改不同的项目，但我没测试过~
> 如果要修改文件，一定要重新通过 GitHub Actions 运行！

### SSH 连接
需要启用 SSH，在 `使用 SSH 连接` 环节登录，手动通过 `make menuconfig` 选择需要编译的内容

## 文件说明

`feeds.sh`\
用于存放对 feeds.conf.default 的操作，例如添加自定义的源

`diy.sh`\
用于对 ImmortalWRT 进行个性化配置，例如修改默认 IP、网口等配置
当然你也可以放一些奇奇怪怪的命令

`files`\
俗称 **files 大法**，用于在编译过程中直接使用设定好的配置(例如 /etc/config/network 中的设定)，避免重新配置\
在根目录中新建 `files/etc/xxx` 文件放入即可(记得在 build.yml 添加操作哦~)

`build.yml`\
用于设定 GitHub Actions 的工作流\
其中 **env** 部分可以自行修改，如果不需要修改编译后的文件名等信息直接注释即可



### 参考项目
[ImmortalWRT-Actions](https://github.com/Gzxhwq/ImmortalWrt-Actions/tree/main)

[Actions-OpenWRT](https://github.com/P3TERX/Actions-OpenWrt)

### 感谢
[ImmortalWRT](https://github.com/immortalwrt/immortalwrt)

[small 软件源](https://github.com/kenzok8/small)
