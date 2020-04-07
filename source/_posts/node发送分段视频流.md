---
title: node发送分段视频流
date: 2020-04-07 02:13:23
tags:
    - 上传
    - 视频
categories:
    - 功能
---

//前端

```
<video src="/video"></video>
```
//后端
```
router.get('/video', function(req, res, next) {
    let path = './assets/sintel.mp4';
    let stat = fs.statSync(path);
    let fileSize = stat.size;
    let range = req.headers.range;

    // fileSize 3332038

    if (range) {
        //有range头才使用206状态码

        let parts = range.replace(/bytes=/, "").split("-");
        let start = parseInt(parts[0], 10);
        let end = parts[1] ? parseInt(parts[1], 10) : start + 999999;

        // end 在最后取值为 fileSize - 1 
        end = end > fileSize - 1 ? fileSize - 1 : end;

        let chunksize = (end - start) + 1;
        let file = fs.createReadStream(path, { start, end });
        let head = {
            'Content-Range': `bytes ${start}-${end}/${fileSize}`,
            'Accept-Ranges': 'bytes',
            'Content-Length': chunksize,
            'Content-Type': 'video/mp4',
        };
        res.writeHead(206, head);
        file.pipe(res);
    } else {
        let head = {
            'Content-Length': fileSize,
            'Content-Type': 'video/mp4',
        };
        res.writeHead(200, head);
        fs.createReadStream(path).pipe(res);
    }

});

```

参考
https://blog.csdn.net/liuyaqi1993/article/details/76560401