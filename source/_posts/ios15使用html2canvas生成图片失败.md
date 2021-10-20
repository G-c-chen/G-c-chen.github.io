---
title: IOS 15使用html2canvas生成图片失败
date: 2021-10-20 21:18:05
cover: 
categories: 
- bugfix
tags: 
- IOS 15
- html2canvas
urlName: IOS 15-html2canvas-bugfix
---

## 产生

前端使用 `html2canvas` 把 `dom` 元素转化为 `canvas` 时, 在IOS 15上没有按照预期生成图片，在其他手机上可以正常运行生成图片。

## 问题定位

经过调试发现，在另外一个页面在IOS 15上调用 `html2canvas` 可以正常执行，但是在这个页面上就没有执行 `html2canvas` 函数， 不同的是，正常执行的页面的dom元素都是图片，没有执行的页面上的dom上面有文字，所以应该是文字元素影响了 `html2canvas` 的执行。然后把这个页面的文字元素去掉了，就真的可以正常执行了，更加确定了是文字元素影响的。

## 解决

经过查找资料发现是 IOS 15 系统字体导致的bug，上面也给出了响应的解决办法：在根结点中设置 "font family"

```css
#app {
  font-family: Helvetica, Tahoma, Arial, 'PingFang SC', 'Hiragino Sans GB', 'Heiti SC', STXihei, 'Microsoft YaHei',SimHei;
}
```

然后就可以正常生成图片了。





