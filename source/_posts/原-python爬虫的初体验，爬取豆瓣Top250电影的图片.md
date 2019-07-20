---
title: '[原]python爬虫的初体验，爬取豆瓣Top250电影的图片'
tags: []
date: 2018-04-06 21:22:36
---

一、爬取豆瓣Top250源码import requests
    url = 'https://movie.douban.com/top250?start=0&amp;amp;filter='
    data = requests.get(url)
    print(data.text)

二、查看将要爬取的数据的结构1、在网站点击F12查看网页代码，选择图片元素查找其代码的位置然后鼠标右键选择编辑...                    <div>
                        作者：Gage__ 发表于 2018/04/06 21:22:36 [原文链接](https://blog.csdn.net/Gage__/article/details/79836852) https://blog.csdn.net/Gage__/article/details/79836852                    </div>
                    <div>
                        阅读：1399                     </div>