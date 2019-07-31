---
title: PDF文件转换为html在线可访问资源
date: 2019-07-30 09:18:50
tags: 
- GitHub Pages
- 搭建网站 
- FTP
- ftp转html
categories:
- GitHub Pages
---

## 背景



## 准备

1.[注册GitHub账号](https://github.com/join?source=header-home)

2.[安装git](https://git-scm.com/downloads)

3.[安装vscode](https://code.visualstudio.com/download)

4.[安装Adobe Acrobat DC]()

## 步骤

### 新建一个代码仓库

![添加代码仓库](https://gcchen.cn/assets/images/github-new-repository.png)

### 填写仓库信息

![填写仓库信息](https://gcchen.cn/assets/images/create-new-repository.png)

### 选择Clone or download > Use SSH 

![](https://gcchen.cn/assets/images/choose-ssh.png)

然后复制一下url
![](https://gcchen.cn/assets/images/copy-ssh-url.png)

### 找一个你认为合适的地方或者新建一个文件夹来存即将要clone下来的项目

**点击鼠标右键选中Git Bash Here 就出出现一个命令操作的窗口**

![](https://gcchen.cn/assets/images/open-git.png)

![](https://gcchen.cn/assets/images/git-bash-here.png)

### clone代码仓库

```shell
#clone 后面带的是代码仓库的地址
git clone git@github.com:G-c-chen/qptest.git
```

![](../..https://gcchen.cn/assets/images/clone-git-repository.png)

### 用 Acrobat DC 把 PDF 转为 HTML 格式 (这里随便搞了一个pdf文件演示一下效果)
   
   **选择导出 PDF > 选择 HTML 网页格式** 
  
![](https://gcchen.cn/assets/images/export-pdf.png)
  **按照自己的需求去添加设置，这里是默认的设置**
  **导出目录选择clone下来的代码仓库的目录**

### 导出 HTML 格式完成
*导出完成之后，你的目录下多了一个 html 文件和一个装有图片文件的文件夹（如果你的pdf包含有图片）*

![](https://gcchen.cn/assets/images/export-html.png)

### 改变目录结构

**新建一个文件夹并且把刚刚生成的文件放到这个目录下,把 html 文件重命名为 index.html

![](https://gcchen.cn/assets/images/rename-html.png)

### 修改 html 文件
*把 pdf 文件转成 html 格式 一般是为了在移动端上面展示,用软件转换格式之后并没有做适应，所以这里我们自己修改一下*

>在代码仓库的更目录点击鼠标右键选择用 vscode 打开

![](https://gcchen.cn/assets/images/open-respoitory-with-vscode.png)

*安装这个插件 JS-CSS-HTML Formatter ,这是一个格式化代码的插件*

![](https://gcchen.cn/assets/images/install-html-formatter.png)
>然后打开 html 文件, 使用刚才安装的插件将代码格式化, 将代码格式化是为了更好的去进行编辑

![](https://gcchen.cn/assets/images/format-html.png)

> 代码格式化之后，按照下面的例子去修改, 第一个一定要加，第二个有图片的话就修改
```html
<head>
...
<!-- head样例 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
...
</head>
<body>
...
<!-- 图片修改样例 -->
<img width="100%" alt="image" src="HelloWorld/Image_001.jpg"/>
...
</body>
```
> 修改完成之后记得保存，下面我们来把代码上传到 GitHub

### 项目上传到 GitHub

> 还是在项目的根目录点击鼠标右键选择 git bash here
> 然后按照以下的命令进行操作

```shell
git add .
git commit -m "commit qpTest files" 
git push origin master
```
![](https://gcchen.cn/assets/images/git-commit-files.png)

> 这时去我们的 GitHub 账号上看刚才新建的代码仓库，发现我们新增的文件已经提交上来了

![](https://gcchen.cn/assets/images/push-file-ok.png)

### 设置 GitHub Pages

>选择Setting

![](https://gcchen.cn/assets/images/choose-setting.png)

>往下滚找到 GitHub Pages 配置

![](https://gcchen.cn/assets/images/setting-github-pages.png)

>设置完成就会提示我们的站点已经发布到 'https://g-c-chen.github.io/qptest/' 地址下

![](https://gcchen.cn/assets/images/github-pages-url.png)

> 然后想要访问我们刚刚生成的网页可以通过在上面这个地址后面加上包含该网页的文件夹的名称就可以访问了
> 例如我这里是在 helloworld 文件夹下 则访问地址为 'https://g-c-chen.github.io/qptest/helloworld'

![](https://gcchen.cn/assets/images/go-url.png)


   

   

