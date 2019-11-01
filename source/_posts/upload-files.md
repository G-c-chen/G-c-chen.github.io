---
title: vue + axios 实现文件上传
categories:
  - 前端
tags:
  - 文件上传
  - Vue
  - axios
urlName: upload-files
date: 2019-10-29 10:52:23
---


## 背景

前段时间项目里要求加一个文件上传的功能，其实上传图片就有一个组件，但是那是给图片专用的，所以上传文件需要另外做一个，那就做呗，参考一下上传图片的组件，很快就可以实现这个功能了，这里做一个简陋的demo记录一下上传文件的基本实现。

## html代码

```HTML
<input type="file" @change="uploadFile" />
```

## js代码

```js
uploadFile(event) {
      var e = window.event || event
      // 获取当前选中的文件
      var oFile = e.target.files[0]
      let item = {
        name: oFile.name,
        uploadPercentage: 1,
        size: this.formatFileSize(oFile.size, 0),
        uploadStatus: 0
      }
      let config = {
        // 添加请求头
        headers: { 'Content-Type': 'multipart/form-data' },
        // 添加上传进度监听事件
        onUploadProgress: e => {
          var completeProgress = (((e.loaded / e.total) * 100) | 0) + '%'
          item.uploadPercentage = completeProgress
          console.log(completeProgress, '上传进度')
        }
      }

      let param = new FormData()
      param.append('name', oFile.name)
      param.append('file', oFile)
      // 上传文件接口 '/api/uploadFile'
      this.$axios.post('/api/uploadFile', param, config).then(response => {
        let res = response.data
        if (res.success) {
          console.log('上传成功')
        } else {
          console.log('上传失败')
        }
      })
    },
    // 格式化文件大小
    formatFileSize: function(fileSize, idx) {
      var units = ['B', 'KB', 'MB', 'GB']
      idx = idx || 0
      if (fileSize < 1024 || idx === units.length - 1) {
        return fileSize.toFixed(1) + units[idx]
      }
      return this.formatFileSize(fileSize / 1024, ++idx)
    }
  }
}
```
