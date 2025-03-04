# Ruijie RG-UAC account password information leaked CNVD-2021-14536

## Vulnerability Description

Ruijie RG-UAC unified Internet behavior management audit system has leaked account password information, which can indirectly obtain user account password information and log in to the backend.

## Affect Version

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Ruijie RG-UAC unified Internet behavior management audit system</span>

## Network surveying and mapping



## Vulnerability reappears

Come to the login page



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruijie-1.png)



Press F12 to view the source code, and you can find the md5 form of account and password



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruijie-2.png)



After decrypting md5, you can log in to the system after getting the password



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruijie-3.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/ruijie-4.png)



## 