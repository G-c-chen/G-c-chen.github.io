---
title: python爬虫二 爬取豆瓣Top250上
categories:
  - python爬虫
tags:
  - python
  - python爬虫
  - 豆瓣Top250
urlName: python_class2
date: 2019-09-16 00:00:00
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

<!-- 6、使用 del 语句来删除列表的元素

```python
list = ['physics', 'chemistry', 1997, 2000]
del list[0]
print(list)
# 输出 ['chemistry', 1997, 2000]
``` -->

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
# 字符串循环
str = 'abcde'
for item in str:
  print(item)
# 输出
# a
# b
# c
# d
# e  

# 列表循环
list = [123, 'skr', 'xsl', 'wx', '社会']
# 输出
# 123
# skr
# xsl
# wx
# 社会
```

## BeautifulSoup 的 find_all 和 find 方法的使用

下面的一段HTML代码将作为例子被多次用到.这是 爱丽丝梦游仙境的 的一段内容(以后内容中简称为 爱丽丝 的文档):

```python
html_doc = """
<html><head><title>The Dormouse's story</title></head>
<body>
<p class="title"><b>The Dormouse's story</b></p>

<p class="story">Once upon a time there were three little sisters; and their names were
<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
<a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
<a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
and they lived at the bottom of a well.</p>

<p class="story">...</p>
"""
```

使用BeautifulSoup解析这段代码,能够得到一个 BeautifulSoup 的对象,并能按照标准的缩进格式的结构输出:

```python
from bs4 import BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')

print(soup.prettify())
# <html>
#  <head>
#   <title>
#    The Dormouse's story
#   </title>
#  </head>
#  <body>
#   <p class="title">
#    <b>
#     The Dormouse's story
#    </b>
#   </p>
#   <p class="story">
#    Once upon a time there were three little sisters; and their names were
#    <a class="sister" href="http://example.com/elsie" id="link1">
#     Elsie
#    </a>
#    ,
#    <a class="sister" href="http://example.com/lacie" id="link2">
#     Lacie
#    </a>
#    and
#    <a class="sister" href="http://example.com/tillie" id="link2">
#     Tillie
#    </a>
#    ; and they lived at the bottom of a well.
#   </p>
#   <p class="story">
#    ...
#   </p>
#  </body>
# </html>
```

### find_all( name , attrs , recursive , string , **kwargs )

*本节内容提及到但是没有加以说明的知识点，皆因本节内容只需用到加以说明的知识，没有加以说明以后用到再进行补充，或者有兴趣的可以自己进行[学习](https://www.crummy.com/software/BeautifulSoup/bs4/doc.zh/#id4)，以补充相关知识*

find_all() 方法搜索当前tag的所有tag子节点,并判断是否符合过滤器的条件

#### name 参数

name 参数可以查找所有名字为 name 的tag(tag 也就是标签的名称)，简单的用法如下:

```python
soup.find_all("title")
# [<title>The Dormouse's story</title>]
```

*搜索 name 参数的值可以使任一类型的 过滤器 ,字符串,正则表达式,列表,方法或是 True .*

#### keyword 参数

如果一个指定名字的参数不是搜索内置的参数名,搜索时会把该参数当作指定名字tag的属性来搜索,如果包含一个名字为 id 的参数,Beautiful Soup会搜索每个tag的”id”属性.

```python
soup.find_all(id='link2')
# [<a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>]
```
*搜索指定名字的属性时可以使用的参数值包括 字符串 , 正则表达式 , 列表, True .*

#### 按CSS搜索

按照CSS类名搜索tag的功能非常实用,但标识CSS类名的关键字 class 在Python中是保留字,使用 class 做参数会导致语法错误.从Beautiful Soup的4.1.1版本开始,可以通过 class_ 参数搜索有指定CSS类名的tag:

```python
soup.find_all("a", class_="sister")
# [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
#  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
#  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
```

*class_ 参数同样接受不同类型的 过滤器 ,字符串,正则表达式,方法或 True :*

### find( name , attrs , recursive , text , **kwargs )

find_all() 方法将返回文档中符合条件的所有tag,尽管有时候我们只想得到一个结果.比如文档中只有一个`<body>`标签,那么使用 find_all() 方法来查找`<body>`标签就不太合适, 使用 find_all 方法并设置 limit=1 参数不如直接使用 find() 方法.下面两行代码是等价的:

```python
soup.find_all('title', limit=1)
# [<title>The Dormouse's story</title>]

soup.find('title')
# <title>The Dormouse's story</title>
```

*唯一的区别是 find_all() 方法的返回结果是值包含一个元素的列表,而 find() 方法直接返回结果. find_all() 方法没有找到目标是返回空列表, find() 方法找不到目标时,返回 None .*

## 结束

本节内容到此结束，下一节将通过一个实例“爬取豆瓣电影Top250”来教大家运用本节学到的知识




