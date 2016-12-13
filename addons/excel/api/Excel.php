<?php
/**
 *使用方法
 *$field="'diqu,goods_id,num,create_time";
 *$fieldtitle="市场,产品名字,数量,下单时间";
 *$str=run_plugin_method('Phpexcel','export',array($list,
 *'shichang-tongji',
 *array($field,$fieldtitle)
 *)
 *);
 ****/
// require_once path_a('/Plugins/Plugin.class.php');
class Excel {
	public function __construct() {
		include __DIR__ . '/phpexcel/PhpExcel.php';
		include __DIR__ . '/phpexcel/PHPExcel/IOFactory.php';
		include __DIR__ . '/phpexcel/PHPExcel/Reader/Excel5.php';
		include __DIR__ . '/phpexcel/PHPExcel/Worksheet/Drawing.php';
		include __DIR__ . '/phpexcel/PHPExcel/Style/Fill.php';
	}
	//钩子默认的调用方法
	public function run() {
		$this->display('content');
	}

	/**
	 * 导入excel文件示例
	 * @return [type] [description]
	 */
	public function sample() {
		$this->assign('data', $this->importExcel());
		return $this->fetch('content');
	}
	/**
	 * 导入excel文件中的数据
	 * @return [type] [description]
	 */
	public function importExcel() {
		$file         = '';
		$filetempname = '';
		if ($_FILES) {
			$file         = $_FILES['excel']['name'];
			$filetempname = $_FILES['excel']['tmp_name'];
		} else {
			$this->error('请选择文件后再上传');
		}
		//自己设置的上传文件存放路径
		$filePath = RUNTIME_PATH;
		$str      = "";

		//注意设置时区
		$time = date("y-m-d-H-i-s"); //去当前上传的时间
		//获取上传文件的扩展名
		$extend = strrchr($file, '.');
		//上传后的文件名
		$name       = $time . $extend;
		$uploadfile = $filePath . $name; //上传后的文件名地址
		//move_uploaded_file() 函数将上传的文件移动到新位置。若成功，则返回 true，否则返回 false。
		$result = move_uploaded_file($filetempname, $uploadfile); //假如上传到当前目录下
		//echo $result;
		if ($result) //如果上传文件成功，就执行导入excel操作
		{
			include "conn.php";
			$objReader     = \PHPExcel_IOFactory::createReader('Excel5'); //use excel2007 for 2007 format
			$objPHPExcel   = $objReader->load($uploadfile);
			$sheet         = $objPHPExcel->getSheet(0);
			$highestRow    = $sheet->getHighestRow(); //取得总行数
			$highestColumn = $sheet->getHighestColumn(); //取得总列数
			//dump($highestRow);
			//dump($highestColumn);
			$colarr   = array();
			$fieldarr = array();
			//循环读取excel文件,读取一条,插入一条
			for ($j = 1; $j <= $highestRow; $j++) //从第一行开始读取数据
			{

				$tem = array();
				for ($k = 'A'; $k <= $highestColumn; $k++) //从A列读取数据
				{

					//这种方法简单，但有不妥，以'\\'合并为数组，再分割\\为字段值插入到数据库
					//实测在excel中，如果某单元格的值包含了\\导入的数据会为空
					//getValue 取内容   getCalculatedValue 取工式结果
					$str = $objPHPExcel->getActiveSheet()->getCell("$k$j")->getCalculatedValue(); //读取单元格
					//dump($str);
					if (empty($str) && $k == 'A') {
						break;
					}

					if ($j == 1) {
						$fieldarr[$k] = $str;
					} else {
						$tem[$fieldarr[$k]] = $str;
					}
				}
				if ($j !== 1 && !empty($tem)) {
					$colarr[] = $tem;
				}

			}
			unlink($uploadfile); //删除上传的excel文件
			return $colarr;
		} else {
			$this->error("导入失败！");
		}
	}
	/**
	 * 导出excel文件
	 * @param  array  $config [description]
	 * @return [type]         [description]
	 */
	public function exportExcel($config = []) {
		$conf = [
			'data'     => [], //数据
			'filename' => '', //文件名字
			'field'    => '', //excel标题名字
		];
		// dump($config);
		$conf = array_merge($conf, $config);
		$data = $conf['data'];
		$name = $conf['filename'] . '-' . date('Y-m-d H-i-s');
		// dump($conf);
		// die();
		// $field      = explode(',', $conf['field'][0]);
		// $fieldtitle = explode(',', $conf['field'][1]);
		$field       = array_keys($conf['field']);
		$fieldtitle  = array_values($conf['field']);
		$objPHPExcel = new \PHPExcel();
		//以下是一些设置 ，什么作者  标题啊之类的
		$objPHPExcel->getProperties()->setCreator("ainiku")
			->setLastModifiedBy("ainiku")
			->setTitle("feilv export")
			->setSubject("feilv export")
			->setDescription("bakdata")
			->setKeywords("excel")
			->setCategory("result file");
		//设置表头
		$obj = $objPHPExcel->setActiveSheetIndex(0);

		$fieldnum = count($fieldtitle);
		$j        = 65;
		foreach ($fieldtitle as $v) {
			$obj->setCellValue(chr($j++) . '1', ' ' . $v);
		}
		//Set border colors 设置边框颜色
		//$obj->freezePane(chr(65).'1:'.chr($j).'1');
		$objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getLeft()->getColor()->setARGB('FF993300');
		$objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getTop()->getColor()->setARGB('FF993300');
		$objPHPExcel->getActiveSheet()->getStyle('D13')->getBorders()->getBottom()->getColor()->setARGB('FF993300');
		$objPHPExcel->getActiveSheet()->getStyle('E13')->getBorders()->getRight()->getColor()->setARGB('FF993300');
		//Set border colors 设置背景颜色
		//$objPHPExcel->getActiveSheet()->getStyle(chr(65).'1:'.chr($j).'1')->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID);
		//$objPHPExcel->getActiveSheet()->getStyle(chr(65).'1:'.chr($j).'1')->getFill()->getStartColor()->setARGB('FFededed');
		//以下就是对处理Excel里的数据， 横着取数据，主要是这一步，其他基本都不要改
		// 固定第一行
		$obj->freezePane('A1');
		$fieldnum = count($field);
		foreach ($data as $k => $v) {
			$num      = $k + 2;
			$temfield = $field;
			$j        = 'A';
			$i        = 0;
			//$obj=$objPHPExcel->setActiveSheetIndex(0);
			for ($i; $i < $fieldnum; $i++) {
				$temstr = array_shift($temfield);
				if (substr($temstr, 0, 1) == "'") {
					$temstr = str_replace("'", '', $temstr);
					$obj->setCellValue($j . $num, ' ' . $v[$temstr]);
				} else if (substr($temstr, 0, 5) == "#pic#") {
					//插入图片
					$temstr = str_replace("#pic#", '', $temstr);
					$img    = new \PHPExcel_Worksheet_Drawing();
					$img->setPath($v[$temstr]); //写入图片路径
					$img->setHeight(100); //写入图片高度
					$img->setWidth(100); //写入图片宽度
					$img->setOffsetX(1); //写入图片在指定格中的X坐标值
					$img->setOffsetY(1); //写入图片在指定格中的Y坐标值
					$img->setRotation(1); //设置旋转角度
					$img->getShadow()->setVisible(true); //
					$img->getShadow()->setDirection(50); //
					$img->setCoordinates($j . $num); //设置图片所在表格位置
					//$objPHPExcel->getColumnDimension("$letter[$i]")->setWidth(20);
					$obj->getDefaultRowDimension()->setRowHeight(100);
					$img->setWorksheet($obj); //把图片写到当前的表格中

					//$objActSheet->getCell('E26')->getHyperlink()->setUrl( 'http://www.phpexcel.net');    //超链接url地址
					//$objActSheet->getCell('E26')->getHyperlink()->setTooltip( 'Navigate to website');  //鼠标移上去连接提示信息
					//$obj->setCellValue($j.$num, $img);
				} else if (substr($temstr, 0, 6) == "#link#") {
					$temstr = str_replace("#link#", '', $temstr);
					$obj->setCellValue($j . $num, $v[$temstr]);
					$obj->getCell($j . $num)->getHyperlink()->setUrl($v[$temstr]); //超链接url地址
					$obj->getCell($j . $num)->getHyperlink()->setTooltip($v[$temstr]); //鼠标移上去连接提
				} else {
					$obj->setCellValue($j . $num, $v[$temstr]);
				}
				$j++;
			}
		}
		$objPHPExcel->getActiveSheet()->setTitle('User');
		$objPHPExcel->setActiveSheetIndex(0);
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="' . $name . '.xls"');
		header('Cache-Control: max-age=0');
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');
		exit;
	}
}
