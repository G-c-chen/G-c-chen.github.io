---
title: element-admin中动态改变复用组件的title
categories:
  - element-admin
tags:
  - element-admin
  - element-ui
  - vue
  - vue-router
urlName: vue-component-title
date: 2019-10-16 14:25:15
---


## 背景

最近接到一个任务是做几个汇总报表的前端界面,看了一下原型,结构都差不多,所以就写成了一个组件,根据不同的汇总报表,传不同的参数来区分,任务并不复杂,然后刷刷的很快就完成了,但是事情并没有结束!


## 问题描述

很快问题就暴露出来了,就是所有的汇总报表的title都是用的同一个组件的组件的,所以所有的汇总报表的名称都是一样的,无法区分是哪个汇总报表,效果是这样的

{% asset_img vue-component1.png 多个汇总报表名称相同(无法区分) %}

*关键路由代码*
```js
  {
      path: '/tcReport/:orderType/:type',
      component: () => import('@/views/tc/tcReport/tcReportList'),
      name: 'tcReportList',
      meta: { title: '汇总报表', icon: 'guide', noCache: false }
    }
```


这可咋办啊,咱得解决这个问题啊

## 解决方案

>利用 `Vue Router` 的 全局前置守卫 `router.beforeEach` 在路由跳转之前可以根据 `to` 路由对象的 `path` 判断要跳转的汇总报表, 再对该路由对象的 `meta` 的 `title` 作相应的修改可以到达目的.(可参考Vue Router 的[前置守卫](https://router.vuejs.org/zh/guide/advanced/navigation-guards.html#%E5%85%A8%E5%B1%80%E5%89%8D%E7%BD%AE%E5%AE%88%E5%8D%AB))


添加的关键代码如下 *router.js*
```js
veuRouter.beforeEach((to, from, next) => {
  if (/汇总报表/.test(to.meta.title)) {
    let tagList = [
      {
        link: '/tcReport/SALES/OUT',
        name: '销售出库'
      },
      {
        link: '/tcReport/SALES/INVOICE',
        name: '销售发票'
      },
      {
        link: '/tcReport/SALES/RECEIPT',
        name: '销售收款'
      },
      {
        link: '/tcReport/PURCHASE/IN',
        name: '采购入库'
      },
      {
        link: '/tcReport/PURCHASE/INVOICE',
        name: '采购发票'
      },
      {
        link: '/tcReport/PURCHASE/PAY',
        name: '采购付款'
      }
    ]
    let obj = tagList.find(item => {
      return item.link === to.path
    })
    if (obj) {
      to.meta.title = obj.name + '汇总报表'
    }
  } else {
    next()
  }
})
```

*解决后的效果*

{% asset_img vue-component2.png 每个汇总报表对应相应的名称 %}