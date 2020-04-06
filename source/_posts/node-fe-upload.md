---
title: node-fe-upload
date: 2020-04-04 11:14:08
tags:
    - node
    - 上传
categories:
    - node
---

图片压缩上传
视频分片上传

总结
大文件上传：

前端上传大文件时使用 Blob.prototype.slice 将文件切片，并发上传多个切片，最后发送一个合并的请求通知服务端合并切片。
服务端接收切片并存储，收到合并请求后使用 fs.appendFileSync 对多个切片进行合并。
原生 XMLHttpRequest 的 upload.onprogress 对切片上传进度的监听。
使用 Vue 计算属性根据每个切片的进度算出整个文件的上传进度。
断点续传：

使用 spart-md5 根据文件内容算出文件 hash。
通过 hash 可以判断服务端是否已经上传该文件，从而直接提示用户上传成功（秒传）。
通过 XMLHttpRequest 的 abort 方法暂停切片的上传。
上传前服务端返回已经上传的切片名，前端跳过这些切片的上传。

```
request({
    url,
    method = "post",
    data,
    headers = {},
    requestList
}) {
    returnnewPromise(resolve => {
        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        Object.keys(headers).forEach(key =>
            xhr.setRequestHeader(key, headers[key])
        );
        xhr.send(data);
        xhr.onload = e => {
            resolve({
                data: e.target.response
            });
        };
    });
}
```
```
<script>
  const LENGTH = 10; // 切片数量

export default {
  data: () => ({
    container: {
      file: null,
      data: []
    }
  }),
  methods: {
    request() {},
    handleFileChange() {},
     // 生成文件切片
     createFileChunk(file, length = LENGTH) {
       const fileChunkList = [];
       const chunkSize = Math.ceil(file.size / length);
       let cur = 0;
       while (cur < file.size) {
         fileChunkList.push({ file: file.slice(cur, cur + chunkSize) });
         cur += chunkSize;
       }
       return fileChunkList;
     },
    // 上传切片
     async uploadChunks() {
       const requestList = this.data
         .map(({ chunk }) => {
           const formData = new FormData();
           formData.append("chunk", chunk);
  formData.append("hash", hash);
           formData.append("filename", this.container.file.name);
           return { formData };
         })
         .map(async ({ formData }) =>
           this.request({
             url: "http://localhost:3000",
             data: formData
           })
         );
       await Promise.all(requestList); // 并发切片
     },
     async handleUpload() {
       if (!this.container.file) return;
       const fileChunkList = this.createFileChunk(this.container.file);
       this.data = fileChunkList.map(({ file }，index) => ({
         chunk: file,
         hash: this.container.file.name + "-" + index // 文件名 + 数组下标
       }));
       await this.uploadChunks();
     }
  }
};
</script>
```

参考
https://developer.51cto.com/art/202004/613728.htm