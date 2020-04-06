---
title: node_cluster_thread
date: 2020-03-30 21:03:16
tags:
    - node
    - thread
    - cluster
categories:
    - node
---
集群clusterfork运行Node.js
```
var cluster = require('cluster');
 
if (cluster.isMaster) {
  var numCPUs = require('os').cpus().length;
 
  for (var i = 0; i < numCPUs; i++) {
    cluster.fork();
  }
 
  cluster.on('exit', function() {
    console.log('A worker process died, restarting...');
    cluster.fork();
  });
} else {
  var express = require('express');
  var app = express();
 
  app.get('/', function(req, res) {
    res.send('Hello World!');
  });
 
  app.get('/explode', function(req, res) {
    setTimeout(function() {
      res.send(this.wont.go.over.well);
    }, 1);
  });
 
  var server = app.listen(3000, function() {
    console.log('Server started on port 3000');
  });
}
```



node 线程进程 进程操作

进程 线程
https://segmentfault.com/a/1190000017985766#item-9-6


nodejs之process进程
https://www.cnblogs.com/Joans/p/4462993.html


process
child_process
cluster
cluster 创建的进程可以端口公用原因是 里面又一个tcp服务器

https://segmentfault.com/a/1190000017985766#item-9-8

试玩NodeJS多进程
https://blog.csdn.net/hongchh/article/details/79898816

不要阻塞你的事件循环
https://nodejs.org/zh-cn/docs/guides/dont-block-the-event-loop/

nodejs在v10.5.0新增了多线程的支持，并且在v11中不需要再加实验特性后缀即可直接使用。
https://blog.csdn.net/flytam/article/details/86608646

Nodejs如何充分利用多核CPU
https://www.jianshu.com/p/7362e6cd706d


https://www.csdn.net/gather_25/OtTaMg3sMjgwLWJsb2cO0O0O.html


通杀Event Loop面试题!
https://www.bilibili.com/video/BV1W4411Q7XA?from=search&seid=2138271231737312653
JS单线程本质
浏览器端Event Loop
Node端 Event Loop
浏览器的事件循环机制和Node端的事件循环机制有区别吗？

https://www.cnblogs.com/wxmdevelop/p/10303948.html

https://www.sohu.com/a/337868360_657169

https://blog.csdn.net/azard5/article/details/85016412

https://www.jb51.net/article/158538.htm



Node 中有一些 IO 操作（DNS，FS）和一些 CPU 密集计算（Zlib，Crypto）会启用 Node 的线程池
，而线程池默认大小为 4
我们可以手动更改线程池默认大小：
process.env.UV_THREADPOOL_SIZE = 64