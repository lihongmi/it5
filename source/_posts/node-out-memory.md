---
title: node-out-memory
date: 2020-04-03 23:32:16
tags:
    - node
    - 内存泄漏
    - memwatch
    - heapdump
categories:
    - node
---
Node.js中检测内存泄漏？
https://www.jdon.com/idea/nodejs/self-detect-memory-leak-node.html
跟踪Node.js应用程序中的内存泄漏是一个富有挑战性的项目，下面通过使用两个很棒的node模块memwatch 和 heapdump.来说明如何检测跟踪内存泄漏。


参考
>
https://www.jdon.com/idea/nodejs/self-detect-memory-leak-node.html



内存溢出

https://juejin.im/post/5d59fcb36fb9a06b2766cafa#heading-10

1，数据量较大
2：对象需要频繁的创建/销毁，或操作对象本身较大

解决内存溢出问题
1.使用 async/await防止事件堆积,变为同步操作
2.增加V8内存空间
3.使用非V8内存