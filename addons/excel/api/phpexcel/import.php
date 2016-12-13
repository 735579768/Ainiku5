<?php
//导出文件
exprot(array(), 'fileexcel');
?>
<form method="post" action="" enctype="multipart/form-data">
<h3>导入Excel表：</h3><input  type="file" name="readExcel" />
<input type="submit"  value="导入" />
</form>
<?php

if (!empty($_FILES['readExcel']['name'])) {
	$filename = $_FILES['readExcel']['name'];
	$tmp_name = $_FILES['readExcel']['tmp_name'];
	$msg      = uploadFile($filename, $tmp_name);
	echo $msg;
}

//导入Excel文件
function uploadFile($file, $filetempname) {
	//自己设置的上传文件存放路径
	$filePath = './';
	$str      = "";
	//下面的路径按照你PHPExcel的路径来修改
	require_once './classes/PHPExcel.php';
	require_once './classes/PHPExcel/IOFactory.php';
	require_once './classes/PHPExcel/Reader/Excel5.php';

	//注意设置时区
	$time       = date("y-m-d-H-i-s"); //去当前上传的时间
	$extend     = strrchr($file, '.'); //获取上传文件的扩展名
	$name       = $time . $extend; //上传后的文件名
	$uploadfile = $filePath . $name; //上传后的文件名地址
	//move_uploaded_file() 函数将上传的文件移动到新位置。若成功，则返回 true，否则返回 false。
	$result = move_uploaded_file($filetempname, $uploadfile); //假如上传到当前目录下
	if ($result) //如果上传文件成功，就执行导入excel操作
	{
		//设定缓存模式为经gzip压缩后存入cache（PHPExcel导入导出及大量数据导入缓存方式的修改 ）
		//将单元格序列化后再进行Gzip压缩，然后保存在内存中
		PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip;
		//保存在php://temp
		//PHPExcel_CachedObjectStorageFactory::cache_to_phpTemp;

		$objReader     = PHPExcel_IOFactory::createReader('Excel5'); //use excel2007 for 2007 format
		$objPHPExcel   = $objReader->load($uploadfile);
		$sheet         = $objPHPExcel->getSheet(0); //取第一个数据表
		$highestRow    = $sheet->getHighestRow(); //取得总行数
		$highestColumn = $sheet->getHighestColumn(); //取得总列数

		// 第一种方法

		//循环读取excel文件,读取一条,插入一条
		$str = null;
		for ($j = 1; $j <= $highestRow; $j++) //从第一行开始读取数据
		{
			$str .= $j . ':';
			for ($k = 'A'; $k <= $highestColumn; $k++) //从A列读取数据
			{
				$str .= $objPHPExcel->getActiveSheet()->getCell("$k$j")->getValue() . '-->'; //读取单元格
			}
			$str .= '<br>';

		}
		echo $str;
		unlink($uploadfile); //删除上传的excel文件
		$msg = "导入成功！";
	} else {
		$msg = "导入失败！";
	}
	return $msg;
}

//导出Excel文件
function exprot($data, $name = 'Excel') {
	include_once './classes/PHPExcel.php';
	error_reporting(E_ALL);
	date_default_timezone_set('Europe/London');
	$objPHPExcel = new PHPExcel();
	//以下是一些设置 ，什么作者  标题啊之类的
	$objPHPExcel->getProperties()->setCreator("转弯的阳光")
		->setLastModifiedBy("转弯的阳光")
		->setTitle("数据EXCEL导出")
		->setSubject("数据EXCEL导出")
		->setDescription("备份数据")
		->setKeywords("excel")
		->setCategory("result file");
	//以下就是对处理Excel里的数据， 横着取数据，主要是这一步，其他基本都不要改
	foreach ($data as $k => $v) {
		$num = $k + 1;
		$objPHPExcel->setActiveSheetIndex(0)
		//Excel的第A列，uid是你查出数组的键值，下面以此类推
			->setCellValue('A' . $num, $v['uid'])
			->setCellValue('B' . $num, $v['email'])
			->setCellValue('C' . $num, $v['password']);
	}
	$objPHPExcel->getActiveSheet()->setTitle('User');
	$objPHPExcel->setActiveSheetIndex(0);
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment;filename="' . $name . '.xls"');
	header('Cache-Control: max-age=0');
	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
	$objWriter->save('php://output');
	exit;
}
?>