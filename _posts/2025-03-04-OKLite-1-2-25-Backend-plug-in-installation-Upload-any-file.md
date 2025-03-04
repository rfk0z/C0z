# OKLite 1.2.25 Backend plug-in installation Upload any file

## Vulnerability Description

OKLite v1.2.25 The background plug-in is incomplete filtering, resulting in malicious Trojan files being uploaded

## Vulnerability Impact

<span style="background-color:rgb(18, 160, 255); padding: 2px 4px; border-radius: 3px; color: white;">OKLite 1.2.25</span>

## Vulnerability reappears

About the execution logic, refer to the previous article `OKLite 1.2.25 Background module import, upload any file CVE-2019-16131`



The vulnerability occurs in `framework/admin/plugin_control.php`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/oklite-10.png)



```php
public function unzip_f()
	{
		$id = $this->get('id','int');
		$rs = $this->model('res')->get_one($id);
		if(!$rs){
			$this->json(P_Lang('附件不存在'));
		}
		if($rs['ext'] != 'zip'){
			$this->json(P_Lang('非ZIP文件不支持在线解压'));
		}
		if(!file_exists($this->dir_root.$rs['filename'])){
			$this->json(P_Lang('文件不存在'));
		}
		$info = $this->lib('phpzip')->zip_info($this->dir_root.$rs['filename']);
		$info = current($info);
		if(!$info['filename']){
			$this->json(P_Lang('插件有异常'));
		}
		$info = explode('/',$info['filename']);
		if(!$info[0]){
			$this->json(P_Lang('插件有异常'));
		}
		if(file_exists($this->dir_root.'plugins/'.$info[0])){
			$this->json(P_Lang('插件已存在，不允许重复解压'));
		}
		if(!$info[1]){
			$this->json(P_Lang('插件打包模式有问题'));
		}
		$this->lib('phpzip')->unzip($this->dir_root.$rs['filename'],$this->dir_root.'plugins/');
		$this->json(true);
	}
```



Here you can see the plug-in that needs to upload the ZIP compression package format, follow up with the `zip_info` function



Function location `framework/libs/phpzip.php`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/oklite-11.png)



Here we will return some information about the ZIP compression package



Look at the key position



```php
$info = explode('/',$info['filename']);
		if(!$info[0]){
			$this->json(P_Lang('插件有异常'));
		}
		if(file_exists($this->dir_root.'plugins/'.$info[0])){
			$this->json(P_Lang('插件已存在，不允许重复解压'));
		}
		if(!$info[1]){
			$this->json(P_Lang('插件打包模式有问题'));
		}
		$this->lib('phpzip')->unzip($this->dir_root.$rs['filename'],$this->dir_root.'plugins/');
		$this->json(true);
```



Here, the exploit function is used to separate two values ​​with `/`, which means that the format should be a directory format like `AAA/BBB`. If you upload the ZIP file directly, you will get an error. There is a problem with the plug-in packaging mode.



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/oklite-12.png)



Upload a ZIP file here. If the format is unzipped into a directory, the directory contains the PHP file.



```php
$this->lib('phpzip')->unzip($this->dir_root.$rs['filename'],$this->dir_root.'plugins/');
		$this->json(true);
```



The last two lines tell the location of the file to be decompressed. The uploaded file is in the `plugins directory`



![img](https://raw.githubusercontent.com/PeiQi0/PeiQi-WIKI-Book/refs/heads/main/docs/.vuepress/../.vuepress/public/img/oklite-13.png)



If you gain something, just like it