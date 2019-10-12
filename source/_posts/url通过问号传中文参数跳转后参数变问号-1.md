---
title: url通过问号传中文参数跳转后参数变问号?
categories:
  - url
tags:
  - url
  - 微信
  - 乱码
  - 字符编码
urlName: url-encode
date: 2019-10-12 14:43:12
---


## 背景

- 功能: 邀请用户注册
- 功能描述: 在pc端选择用户的初始化信息,初始化信息以问号传参的方式拼接到url后面,并且生成二维码,用户扫码后将初始化信息带过来

## 重现步骤

1、表单选择用户初始化信息
  - 比如我选择了用户的角色，如`辅助`
  
2、提交表单后，将表单选项作为参数拼接到url后面
  - 拼接后得到的url为`/mobile/signup?role=辅助`(这里只讨论中文参数)


3、将得到的url发送给后端获取微信跳转的链接
  - 后端返回的url为`https://***.com/api/wx/jump.do?url=%2fmobile%2fsignup%3frole%3d%e8%be%85%e5%8a%a9`
  - 解码后url为`https://***.com/api/wx/jump.do?url=/mobile/signup?role=辅助`(***.com表示域名)


4、将后端返回的url链接生成二维码

5、手机扫描二维码跳转到注册页面，并且初始化信息

6、中文参数变成了几个问号`？？？`
  - 查看url发现url是这样的`https://***.com/mobile/signup%3frole%3d%3f%3f%3f`
  - 解码后url为`https://***.com/mobile/signup?role=???`

## 原因

> 不清楚微信在跳转这条链接的时候发生了什么，可能是编码产生的问题，具体原因还有待研究

## 解决

1、采取编码的方式传递中文参数然后取参的时候再进行解码，如：
  
```js
// 传参
let url = '/mobile/signup?role=' + encodeURI('辅助')

// 取参
let role = decodeURI(this.$route.query.role)
```

2、不建议传递参数的值为中文，以英文作为代替，然后取值再转为对应的中文

