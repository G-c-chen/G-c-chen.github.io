---
title: python爬虫二 爬取豆瓣Top250上
date: {{ date }}
categories: 
- python爬虫
tags: 
- python
- python爬虫
- 豆瓣Top250
urlName: python_class2
---

## 本节知识

* 学会看和分析 HTML 代码结构
* 认识 python 列表、字典和循环
* BeautifulSoup 的 find 和 find_all 方法的使用

## HTML 代码结构

之前看过一些 python 爬虫教程，在教程的过程可能会叫你先去看一下 HTML 的基础知识，这个对于没有编程基础的初学者朋友是不太友好的，为了让初学者尽快上手爬虫，只需清楚以下这三点即可

### HTML标签：
  1、 由尖括号包围的关键词，如 `<html>`

  2、 通常是成对出现的，如 `<div>` 和 `</div>` ,其中第一个是开始标签，第二个是结束标签

  3、 也有单独呈现的标签，如 `<img/>`

  *对于初学者，不要求认识什么标签有什么作用之类的，只需要知道标签的名称就可以了，拿上面的举个栗子，1.html, 2.div, 3.img 分别对应为第1、2、3点的标签名称*

### 标签的属性：
  1、标签的属性出现在标签的开始标签中，如 `<div id="div1" class="content"></div>`
  
  2、标签的属性以 `name="value"` 的形式存在，也就是说等号前面是属性的名称，等号后面是属性的值

  *对于初学者，同样不需要清楚每个属性有什么意义，在这里只需要分清标签的属性和名称即可*

### 标签的内容：
  位于开始标签和结束标签之间的标签和文本都属于这个标签的内容
  例如：

  1、 `<div>我是社会主义的接班人</div>` 其中 `我是社会主义的接班人` 就是 div 标签的内容

  2、 `<div>我是<span>社会主义</span>的接班人</div>` 其中 `我是<span>社会主义</span>的接班人` 是 div 标签的内容而 `社会主义` 是 span 标签的内容
  
## 认识 python 列表、字典和循环

### 列表

1、列表是最常用的Python数据类型，它可以作为一个方括号内的逗号分隔值出现

2、列表的数据项不需要具有相同的类型

3、创建一个列表，只要把逗号分隔的不同的数据项使用方括号括起来即可。如下所示：

```python
list1 = ['physics', 'chemistry', 1997, 2000]
list2 = [1, 2, 3, 4, 5 ]
list3 = ["a", "b", "c", "d"]
```

4、使用下标索引来访问列表中的值

```python
list = ['physics', 'chemistry', 1997, 2000]
print(list[0])
# 输出 physics
```

5、使用append()方法来添加列表项

```python
list = ['physics', 'chemistry', 1997, 2000]
list.append(1996)
print(list)
# 输出 ['physics', 'chemistry', 1997, 2000, 1996]
```

6、使用 del 语句来删除列表的元素

```python
list = ['physics', 'chemistry', 1997, 2000]
del list[0]
print(list)
# 输出 ['chemistry', 1997, 2000]
```

### 字典

1、字典的每个键值 key=>value 对用冒号 : 分割，每个键值对之间用逗号 , 分割，整个字典包括在花括号 {} 中 ,格式如下所示：

```python
dict = {'Alice': '2341', 'Beth': '9102', 'Cecil': '3258'}
```

2、值可以取任何数据类型，但键必须是不可变的

```python
dict = {'Alice': 2341, 'Beth': '9102', 'Cecil': '3258'}
```

3、把相应的键放入熟悉的方括弧来访问字典在值

```python
dict = {'Alice': 2341, 'Beth': '9102', 'Cecil': '3258'}
print('Beth')
# 输出 9102
```

### for 循环

1、for循环可以遍历任何序列的项目，如一个列表或者一个字符串， 举个栗子：

```python

```

## BeautifulSoup 的 find 和 find_all 方法的使用
