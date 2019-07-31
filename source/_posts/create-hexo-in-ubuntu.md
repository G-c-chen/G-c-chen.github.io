---
title: 基于 Ubuntu 搭建 Hexo 个人博客
date: 2019-07-31 19:52:31
tags:
---
## 背景

 >相比 wordpress，我更喜欢 Hexo 的简洁 ，然后就去找教程了，然后发现一些教程照着去做会报一些错误，可能因为环境差异的原因，然后综合了多个教程和各种网上扒报错终于把 Hexo 搭好了，然后整理了一下贴出来，希望能给想要搭建 Hexo 个人博客的大家一个参考，想先看看效果，欢迎访问我的[Hexo 博客](https://gcchen.cn)

  ## 一、准备环境

  ### 1、安装 Git

  ```shell
  sudo apt install git-core -y
  ```
### 2、安装Node.js

```shell
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
source ~/.profile
nvm install stable
```

## 二、安装 Hexo

### 1、安装 cnpm

```shell
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
### 2、安装 Hexo

*先创建一个文件夹，然后进入到文件夹开始安装*

```shell
mkdir hexo
cd hexo/
cnpm install -g hexo-cli
hexo init
```

### 3、测试安装成功

 *打开 Hexo 服务*

 ```shell
 hexo server
 ```

> 此时打开浏览器访问自己【主机的ip：4000】就可以看到我们搭建成功的博客页面。
> 但是这仅仅是本地的，接下来把博客部署到 GitHub 上面我们就可以脱离本地访问了。

## 三、 将博客部署到 GitHub

### 1、注册 GitHub

*如果没有GitHub账户的先去去注册[GitHub账户]([https://github.com/)，有GitHub账户的直接下一步;</p>

### 2、设置 user.name 和 user.email

*注册好之后回来自己的机器上*

```shell
git config --global user.name "Your user.name"
git config --global user.email "You user.email"
```
*""里面换成自己的user.name和user.email*

### 3、生成 shh 密匙

```shell
ssh-keygen -t rsa -C user.email
```
>下面提示输入要保存到的路径，我们输入  /home/ubuntu/.ssh/id_rsa
>然后下面直接回车回车；

### 4、查看 shh 密匙

```shell
vim /home/ubuntu/.ssh/id_rsa
```
*把密匙复制一下，接下来去 GitHub 账户下添加 SSH ke*

### 5、在 GitHub 账户添加 SSH key

*添加 ssh key ，[点击传送](https://github.com/settings/keys)

### 6、创建 GitHub 仓库</h2>

> 命名格式为"账户的userName".github.io
> 例如 ： zhangsan.github.io
> 去创建GitHub仓库[点击传送](https://github.com/new)

### 7、修改 hexo 配置文件</h2>

> 进入到自己的hexo 安装目录下 ，打开_config.yml文件
> 修改下面这部分；

```shell
deploy:
    type: git
    repo: git@github.com:(BoView)/(BoView).github.io.git #括号里面换成自己的用户名和仓库名,去掉括号
    branch: master
```

### 8、部署

*安装 hexo-deployer-git 插件*

```shell
npm install hexo-deployer-git --save
```
*部署*

```shell
#生成静态页面
hexo g
#将public文件内容部署到github仓库
hexo d
#这两条是常用的命令，后者也可以这样
hexo d -g
#或者
hexo g -d
```
> 此时可以打开浏览器访问userName.github.io(GitHub仓库名)
> 即可以访问到搭建的博客页面</p>
> 到这里基本完成任务了，但是我们想更完美一点，再绑定个域名，然后用域名访问岂不美哉；

## 四、绑定域名

### 1、添加解析记录

> 去自己的域名下[添加解析](https://console.cloud.tencent.com/domain/mydomain)(这里以腾讯云为例)
> 记录类型为 CNAME 主机记录为@ 线路选择默认，TTL选择600，记录值为github的仓库 userName.github.io

### 2、配置 hexo

*创建CNAME配置文件*

```shell
touch ~/hexo/source/CNAME
```

> 下面在CNAME配置文件里面添加刚才解析的域名
> 例如： zhangsan.com
> 然后重新部署一下，
> ok，ok，恭喜大家
> 此时打开浏览器访问自己的域名即可以访问自己搭建的博客</p>
> 开启自己的[【博客之旅】吧](https://hexo.io/zh-cn/docs/index.html)

## 五、最后

**大家要是遇到什么问题欢迎贴出来大家一起来讨论，要是哪里写的不够清楚或者有不对的地方，欢迎补充！！！**
**欢迎大家访问我的[Hexo 博客](https://gcchen.cn/)，看看最终的效果。
</div>