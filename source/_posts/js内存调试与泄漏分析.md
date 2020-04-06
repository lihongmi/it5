---
title: js内存调试与泄漏分析
date: 2020-04-04 22:53:17
tags:
    - 泄漏分析
    - 内存调试
categories:
    - 性能
---


Chrome devtools提供了一种可以基于时间线的内存调试工具——Allocation instrumentation on timeline。

蓝色的线条都代表当前进行了一些内存的分配，而灰色的线条代表GC已经成功将分配出去的内存回收了

https://zhuanlan.zhihu.com/p/60849134