<?php
// array(1) {
//   ["webuploaderimg"]=>
//   array(5) {
//     ["name"]=>
//     string(9) "image.png"
//     ["type"]=>
//     string(9) "image/png"
//     ["tmp_name"]=>
//     string(22) "C:\Windows\php322A.tmp"
//     ["error"]=>
//     int(0)
//     ["size"]=>
//     int(1672)
//   }
// }
header('Content-type: application/json; charset=utf-8'); //json
$action = @$_GET['action'];
if ($action == 'img') {
	echo '{"info":[{"id":"15686","uid":"1","srcname":"145852218011046.jpg","destname":"147253995925844.jpg","path":"http://www.oxisi.com/Public/Xiaoshou/default/images/logo.png","thumbpath":"http://www.oxisi.com/Public/Xiaoshou/default/images/logo.png","status":"1","from":"","extra":"","sha1":"ec121869dc3a0caf86da93eb8ef37e7ee88d56a7","create_time":"1472539959"},{"id":"15686","uid":"1","srcname":"145852218011046.jpg","destname":"147253995925844.jpg","path":"http://www.oxisi.com/Public/Xiaoshou/default/images/logo.png","thumbpath":"http://www.oxisi.com/Public/Xiaoshou/default/images/logo.png","status":"1","from":"","extra":"","sha1":"ec121869dc3a0caf86da93eb8ef37e7ee88d56a7","create_time":"1472539959"}],"status":1,"url":""}';
} else {
	$redata = [
		'id'     => 89,
		'status' => 1,
		'data'   => $_FILES,
	];
	$filename = $_FILES['webuploaderimg']['name'];
	$filename = explode('.', $filename);
	$ext      = $filename[count($filename) - 1];
	$filename = date('ymdhis') . '.' . $ext;
	$bl       = move_uploaded_file($_FILES['webuploaderimg']['tmp_name'], './uploads/' . $filename);
	if (!$bl) {
		$redata['status'] = 0;
	}
	echo '{"id":"15686","srcname":"145852218011046.jpg","destname":"147253995925844.jpg","path":"./uploads/' . $filename . '","thumbpath":"./uploads/' . $filename . '","status":"1"}';
}