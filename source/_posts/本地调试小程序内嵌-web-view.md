---
title: 本地调试小程序内嵌 web-view
date: 2021-10-10 16:46:50
categories: 
- 小程序
tags:
- 小程序
- web-view
- 调试
urlName: miniprogram-web-view
---

## 背景
小程序中嵌入 web-view 调试时需要发布到线上环境才能看到效果，不方便也不满足调试需要频繁修改代码的需求，若能在本地直接进行代码调试，则可大大减少调试代码时间。

## 思路
小程序中 web-view 只能访问配置好的合法域名，所以修改本地 hosts 使配置好的合法域名映射到本地的ip 地址，本地访问该域名时会优先使用本地映射。

## 步骤
### 1.项目配置本地https访问
因为小程序中 web-view 只能使用 https 链接， 所以本地项目需配置 https 访问，这里已 vue 为例

**vue-cli3.x 项目**
在项目根目录下的vue.config.js文件中增加属性 https: true 即可

// vue.config.js
module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'url',
        changeOrigin: true,
        pathRewrite: {
          '^/api': ''
        }
      }
    },
    // 此处开启 https
    https: true
  }
}
vue.config.js 配置参考文档：[https://cli.vuejs.org/zh/config/#vue-config-js](https://cli.vuejs.org/zh/config/#vue-config-js)

**vue-cli2.x 项目**
使用cli2.x搭建的项目开启https较为复杂，关键是openssl生成证书文件，如果本地没有证书，要先生成证书，以及修改项目中配置。

### 生成本地证书
若本地已经安装了git客户端，其中包括了openssl程序，可直接在项目文件目录打开git bash 界面，输入以下命令

① 在build文件夹下新建 cert 文件夹，在cert目录下打开git bash输入以下命令生成私钥 .key 文件

openssl genrsa -out private.key 1024
② 通过上面生成的私钥文件生成CSR 证书签名，根据要求填写一些相关信息，可一路按回车即可

openssl req -new -key private.key -out csr.key
③ 根据上述私钥文件和csr证书签名文件生成证书文件

openssl x509 -req -days 3650 -in csr.key -signkey private.key -out file.crt
完成上述步骤后，cert目录下分别生成 private.key、csr.key、file.crt 三个文件。

### 修改项目中配置
打开app.js增加以下代码：（若相关配置写在./build/dev-server.js中则在对应文件中修改

const opn = require('opn')
const path = require('path') 
const express = require('express')
const app = express()
// ......
const https = require('https')
const fs = require('fs')
 
const privateKey = fs.readFileSync(path.join(__dirname, '../build/cert/private.key'), 'utf8')
const certificate = fs.readFileSync(path.join(__dirname, '../build/cert/file.crt'), 'utf8')
let credentials = {key: privateKey, cert: certificate}
 
// 开启 https服务
let server = https.createServer(credentials, app)
// ...
// app.listen(port) // 开启http
server.listen(port) // 开启https
2.修改本地hosts文件（win）
hosts 文件路径： C:\Windows\System32\drivers\etc\hosts

### 在 hosts 文件添加以下配置

127.0.0.1          m.xxx.com
这里需要注意的是，代理的域名不能和请求接口的域名一致，一致的话接口就无法请求，举个栗子，我在测试环境请求接口的域名是 sandbox-m.xxx.con，所以我这里使用了正式环境的域名 m.xxx.com 作为代理

### 最后
访问 https://m.xxx.cn:port 访问成功即可在小程序的 web-view 中使用这个地址来调式本地运行的代码
