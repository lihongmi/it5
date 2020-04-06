---
title: nginx-ddos
date: 2020-04-03 19:06:18
tags:
    - 软件
    - nginx
    - ddos
categories:
    - soft
---



``` 一。限制每秒请求数 
http {
    limit_req_zone $binary_remote_addr zone=one:10m rate=10r/s; //触发条件，所有访问ip 限制每秒10个请求
    ...
    server {
        ...
        location  ~ \.php$ {
            limit_req zone=one burst=5 nodelay;   //执行的动作,通过zone名字对应
               }
           }
     }
```

```二. 限制IP连接数 
```
```三.白名单设置 

```

测试 
ab -n 请求数 -c 并发 http://10.11.15.174/i.php

五.其它一些防CC的方法 
1.Nginx模块 ModSecurity、http_guard、ngx_lua_waf

ModSecurity 应用层WAF，功能强大，能防御的攻击多，配置复杂 
ngx_lua_waf 基于ngx_lua的web应用防火墙，使用简单，高性能和轻量级 
http_guard 基于openresty 
2.软件+Iptables

fail2ban 通过分析日志来判断是否使用iptables拦截 
DDoS Deflate 通过netstat判断ip连接数，并使用iptables屏蔽 
开头说过抗DDOS是一个系统工程，通过优化系统和软件配置，只能防御小规模的CC攻击，对于大规模攻击、四层流量攻击、混合攻击来说，基本上系统和应用软件没挂，带宽就打满了。下面是我在工作中使用过的防御DDOS的方式：

高防服务器和带流量清洗的ISP 通常是美韩的服务器，部分ISP骨干供应商有流量清洗服务，例如香港的PCCW。通常可以防御10G左右的小型攻击 
流量清洗服务 例如：akamai(prolexic),nexusguard 我们最大受到过80G流量的攻击，成功被清洗，但是费用非常贵 
CDN 例如：蓝讯 网宿 cloudflare 等，CDN针对DDOS的分布式特点，将流量引流分散，同时对网站又有加速作用，效果好，成本相对低。 
总结一下：发动攻击易，防御难。七层好防，四层难防；小型能防，大型烧钱

参考
https://www.cnblogs.com/azhqiang/p/10231490.html