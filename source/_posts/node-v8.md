---
title: node_v8
date: 2020-04-01 11:19:46
tags:
    - node
    - v8
categories:
    - node
---


// 这是调整老生代这部分的内存，单位是MB。后面会详细介绍新生代和老生代内存
node --max-old-space-size=2048 xxx.js 
复制代码
或者

// 这是调整新生代这部分的内存，单位是 KB。
node --max-new-space-size=2048 xxx.js
复制代码


以 1.5GB 的垃圾回收堆内存为例，V8 做一次小的垃圾回收需要50ms 以上，做一次非增量式(ps:后面会解释)的垃圾回收甚至要 1s 以上。

V8的垃圾回收和内存限制

V8 将内存空间主要分为：新生代 和 老生代 两种 。 1、新生代空间 新生代空间中的对象为存活时间较短的对象，大多数的对象被分配在这里，这个区域很小但是垃圾回特别频繁 。 它将堆内存一分为二，每一部分空间称为 semispace，其中一个处于使用状态（from 空间），另一个处于闲置状态（to 空间） 对于新产生的对象，将从 from 空间中分配内存 。


在Node中如果通过JavaScript使用内存操作时会发现实际只能使用部分内存(64位系统下约为1.4G，32位系统下约为0.7G)

V8的这种限制导致的结果是Node无法直接操作大内存对象

V8的垃圾回收策略主要基于分代式垃圾回收机制

在V8中，所有的JavaScript对象都是通过堆来进行分配。我们可以通过process.memoryUsage()这个方法返回的heapTotal和heapUsed来查看堆的使用情况,前者是以申请的堆内存，后者是当前使用的量。如果在代码中使用的对象使用的空间超过了申请的空间，那么就会继续申请堆内存，直到堆的大小超过V8的限制 


参考
https://www.cnblogs.com/liujunhang/p/11816039.html
https://www.cnblogs.com/cangqinglang/p/11961974.html