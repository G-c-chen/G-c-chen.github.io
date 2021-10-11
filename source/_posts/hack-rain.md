---
title: canvas之"黑客帝国"数字雨效果
date: 2018-12-21 09:32:17
cover: rain.png
tags: 
- canvas
- 数字雨
- 黑客帝国
categories:
- canvas
---

{% asset_img rain.png %}
<!-- more -->

## 动态效果

*点击此处[查看效果](https://gcchen.cn/web-demos/canvas-rain/index.html)*

## 背景

今天看到一个数字雨的效果，看起来非常炫酷，接着就去网上查了下如何实现的，然后才知道用canvas实现这个效果并不复杂，然后就自己捣鼓了一番，对canvas不了解的可以[先去了解一下](https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API/Tutorial/Basic_usage)

## 具体实现

### 思路

先说一下思路再上代码，核心的东西就两点，一是数字落下的 Y 轴坐标随机产生，使得所有数字不在同一水平线上落下，看起来才比齐刷刷落下来效果好看。二是使用定时器，隔一段时间调用绘制数字的方法来绘制数字，并且要绘制的数字的位置不断迭代，才有落下来的效果，此处可以去看一下[canvas的基本动画](https://developer.mozilla.org/zh-CN/docs/Web/API/Canvas_API/Tutorial/Basic_animations)实现。

### 代码实现

具体代码实现如下，有不同见解的可评论留言进行交流！

```JavaScript
//获取屏幕可视区域大小
  var d = document.documentElement;
  var clinetW = d.clientWidth;
  var clinetH = d.clientHeight;

  //设置画布大小
  var canvas = document.querySelector('canvas');
  canvas.width = clinetW;
  canvas.height = clinetH;

  var cxt = canvas.getContext('2d');
  var rainStr = 'The matrix of hackers';
  var arr = rainStr.split('');

  var fontSize = 14;
  // 计算行数
  var cols = Math.floor(clinetW / fontSize);
  // 初始化Y轴坐标
  var down = [];
  for (var i = 0; i < cols; i++) {
    down.push(Math.floor(Math.random() * -100));
  }

  function drawRain() {
    // 填充背景(ps:背景采用rgba,可尝试不同透明度的效果)
    cxt.fillStyle = 'rgba(0,0,0,.1)';
    cxt.fillRect(0, 0, clinetW, clinetH);

    // 设置字体颜色
    cxt.fillStyle = '#00ff00';
    for (var i = 0; i < down.length; i++) {
      var randomNum = Math.random();
      // 绘制文字
      cxt.fillText(arr[Math.floor(randomNum * arr.length)], i * fontSize, down[i] * fontSize);

      if (down[i] * fontSize > clinetH && randomNum > 0.9) {
        down[i] = 0;
      }
      //绘制文字的下一个位置
      down[i]++;
    }
  }

  setInterval(drawRain, 30);
```

### 简单封装

*把上面的代码封装成一个函数* 

```JavaScript
/**
   * [rain description]
   * @param  {[Element]} canvas canvas元素对象
   * @param  {[String]} text    掉落的字符串
   * @param  {[String]} symbol  分隔符
   * @param  {[Number]} speed   掉落速度
   * @return {[type]}        [description]
   */
  function rain(canvas, text, symbol, speed) {
    //获取屏幕可视区域大小
    var d = document.documentElement;
    var clinetW = d.clientWidth;
    var clinetH = d.clientHeight;

    //设置画布大小
    var canvas = canvas || document.querySelector('canvas');
    canvas.width = clinetW;
    canvas.height = clinetH;

    var cxt = canvas.getContext('2d');
    var rainStr = text || 'The matrix of hackers';
    var symbol = symbol || '';
    var arr = rainStr.split(symbol);

    var fontSize = 14;
    // 计算行数
    var cols = Math.floor(clinetW / fontSize);
    // 初始化Y轴坐标
    var down = [];
    for (var i = 0; i < cols; i++) {
      down.push(Math.floor(Math.random() * -100));
    }

    function drawRain() {
      // 填充背景(ps:背景采用rgba,可尝试不同透明度的效果)
      cxt.fillStyle = 'rgba(0,0,0,.1)';
      cxt.fillRect(0, 0, clinetW, clinetH);

      // 设置字体颜色
      cxt.fillStyle = '#00ff00';
      for (var i = 0; i < down.length; i++) {
        var randomNum = Math.random();
        // 绘制文字
        cxt.fillText(arr[Math.floor(randomNum * arr.length)], i * fontSize, down[i] * fontSize);

        if (down[i] * fontSize > clinetH && randomNum > 0.9) {
          down[i] = 0;
        }

        down[i]++;
      }
    }
    var speed = speed || 30;
    setInterval(drawRain, speed);
  }
  var canvas = document.querySelector('canvas');
  var text = '富强 民主 文明 和谐 自由 平等 公正 法治 爱国 敬业 诚信 友善';
  rain(canvas, text, '', 30);
```

## 最后

完整的代码请查看我的[github](https://github.com/G-c-chen/web-demos/blob/master/canvas-rain/index.html)
