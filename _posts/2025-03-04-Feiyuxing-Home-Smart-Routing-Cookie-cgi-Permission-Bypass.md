# Feiyuxing Home Smart Routing Cookie.cgi Permission Bypass

## Vulnerability Description

Feiyuxing Home smart routing has permission bypass, accessing unauthorized administrator pages through Drop-specific request packages

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Flying Fish Star Home Smart Routing</span>

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Flying Fish Star Enterprise-level intelligent Internet behavior management system</span>

## Network surveying and mapping



## Vulnerability reappears

The login page is as follows

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/fy-1.png)



Cookie.cgi is requested when accessing index.html



```plain
https://xxx.xxx.xxx.xxx/index.html
```



Page packet capture Drop cookie.cgi



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/fy-2.png)



Jump backend to obtain permissions



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/fy-3.png)



If you gain something, just like it