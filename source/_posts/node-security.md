---
title: node_security
tags:
    - node
    - 安全
categories:
    - node
---

https://www.cnblogs.com/hutuzhu/p/5919400.html

安全
阿里云服务器
 开通服务器默认防护是5G，也就是说峰值在5G内都可以抗住，基础防护中有个清洗设置，触发规则自动清洗。
https://tieba.baidu.com/p/6562618258

防御方案一： 然后使用我们的小蚁高防IP，隐藏游戏真实IP

nginx-解决DDOS问题
https://blog.csdn.net/qxdoit/article/details/89421599

https://www.cnblogs.com/lcword/p/9857236.html
https://cloud.tencent.com/developer/article/1430620
https://my.oschina.net/u/2324318/blog/1785489
https://www.jb51.net/article/146381.htm

https://www.jb51.net/article/25252.htm

一些防CC的方法  1.Nginx模块 ModSecurity、http_guard、ngx_lua_waf
ModSecurity 应用层WAF，功能强大，能防御的攻击多，配置复杂  ngx_lua_waf 基于ngx_lua的web应用防火墙，使用简单，高性能和轻量级  http_guard 基于openresty  2.软件+Iptables
fail2ban 通过分析日志来判断是否使用iptables拦截  DDoS Deflate 通过netstat判断ip连接数，并使用iptables屏蔽 
 开头说过抗DDOS是一个系统工程，通过优化系统和软件配置，只能防御小规模的CC攻击，
对于大规模攻击、四层流量攻击、混合攻击来说，
基本上系统和应用软件没挂，带宽就打满了。下面是我在工作中使用过的防御DDOS的方式：
高防服务器和带流量清洗的ISP 通常是美韩的服务器，部分ISP骨干供应商有流量清洗服务，
例如香港的PCCW。通常可以防御10G左右的小型攻击  流量清洗服务 例如：akamai(prolexic),nexusguard 我们最大受到过80G流量的攻击，成功被清洗，但是费用非常贵  CDN 例如：蓝讯 网宿 cloudflare 等，CDN针对DDOS的分布式特点，将流量引流分散，同时对网站又有加速作用，效果好，成本相对低。  总结一下：发动攻击易，防御难。七层好防，四层难防；小型能防，大型烧钱

node 安全
node web安全
https://www.cnblogs.com/qingmingsang/articles/10397870.html

https://segmentfault.com/a/1190000022250995?utm_source=tag-newest#item-3