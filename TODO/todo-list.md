# TODO LIST

## 科普

### vue 对象改变触发data监听的形式


## 爬坑

### cube-ui date-picker中两个选择器两个时间数组变量分别继承回调参数中的date，两个数组指向同一个对象？

### 解决 Module build failed: Error: No PostCSS Config found in...报错

- newpearl-lib\postcss.config.js

### 解决The "path" argument must be of type string. Received type object 报错

- newpearl-lib\build\utils.js

### ios input type=number 无法控制输入类型

### 字体影响导致内容超出没自动换行
white-space: normal;

display: -webkit-box !important;
内容超出显示三点


### execCommand(‘Paste’) 不生效

- newpearl-lib\packages\right-operation\np-right-operation.vue

### ios input 失焦页面不回弹

- o2o-mobile\src\views\personal\components\form-item.vue

### ios new Date('时间字符串').getTime() 返回NaN

- new Date('2020-04-09').getTime() 返回NaN
- 解决方案 使用 new Date(2020, 03, 09).getTime()
- 解决方案 使用 new Date('2020/04/09').getTime()

### 微信支付回调

- \o2o-mobile\src\api\pms\pmsDepositExpansionApi.js

### 微信小程序web-view签名失败问题

- 微信小程序 web-view 签名需要用第一次进入小程序的url去签名

## 组件

### 基于cube-ui改造的时间选择器，带周选择，时间范围选择

## 记录

### js复制html内容

- o2o-mobile\src\views\iOrder\iOrderBillCreate.vue

### 设置多张背景图片

- newLuckywheel 活动页


### qrcodejs2

- QRCode.CorrectLevel.Q
- o2o-admin\src\views\ic\icGoods\icGoodsList.vue

