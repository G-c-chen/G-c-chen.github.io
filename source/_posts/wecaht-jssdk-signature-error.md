---
title: 小程序web-view嵌入的h5调用JS-SDK，报签名错误？
date: 2020-04-28 18:47:51
categories:
- 小程序
tags:
- 小程序
- 微信JS-SDK
- 签名错误
- 小程序 web-view
urlName: wecaht-jssdk-signature-error
---

## 问题产生

H5页面调用 scanQRCode api 可以正常调用，但是用 web-view 的方式嵌入到小程序中却报签名错误。

## 问题排查
打开 debug 模式， 并且把配置信息打印出来发现全部信息都是有的，但是还是报了签名错误，看来配置应该是没问题的；然后发现第一次进入的页面就是调用 jssdk 的页面的时候能调用成功，调用 jssdk 的页面不是第一次进入的页面的时候就会报签名错误；因为之前在 H5 也遇到过 ios 调用 jssdk 报签名失败的问题。因此推断是签名的 url 的问题。

## 解决
解决方法和解决 ios H5 调用 jssdk 报签名失败的问题思路一样，ios 调用 jssdk 签名用的 url 并不是当前页面的 url ，而是用它第一次进入的页面的 url 去签名，所以小程序这里我们也用这个方法来尝试一下。

```js
//H5 main.js
router.afterEach((to, from) => {
  // 记录最初进入路由的第一个页面的url
  if (!sessionStorage.wxConfigSignUrl ) {
  	let wxConfigSignUrl = location.protocol + '//' + location.host + to.fullPath
  	window.sessionStorage.setItem('wxConfigSignUrl ', wxConfigSignUrl)
  }
}
```

```js
//H5 调用 jssdk
// 微信扫描
export function wxScan(cb) {
  // 记录最初进入路由的第一个页面的url
  let wxConfigSignUrl = window.sessionStorage.getItem('wxConfigSignUrl')
  const isAdnroid = /Android/i.test(navigator.userAgent)
  // 获取微信JS-SDK配置信息
  let getUrl = isAdnroid ? location.href.split('#')[0] : wxConfigSignUrl
  const env = window.navigator.userAgent
  // 小程序web-view环境需要用最初进入路由的第一个页面的url去签名
  if (/miniProgram/.test(env)) {
    getUrl = wxConfigSignUrl
  }
  getJsApiConfigApi(getUrl).then(response => {
    var res = response.data
    if (res.success) {
      var wxdata = res.data
      wx.config({
        debug: false,
        appId: wxdata.appId, // 填写自己的appID
        timestamp: wxdata.timestamp,
        nonceStr: wxdata.noncestr,
        signature: wxdata.signature,
        jsApiList: ['checkJsApi', 'scanQRCode']

      })
      wx.ready(function() {
        wx.checkJsApi({
          jsApiList: ['scanQRCode'],
          success: function(res) {
            setTimeout(()=> {
              cb && cb()
            },1000)
          }
        })
      })

    } else {
      console.log(res.msg)
    }
  })
}
```
## 结果
这样改完之后，调用 jssdk 的页面不是第一次进入的页面的时候也可以成功调用了，奈斯！
