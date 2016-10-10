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
$redata   = ['status' => 1, 'data' => $_FILES];
$filename = $_FILES['webuploaderimg']['name'];
$filename = explode('.', $filename);
$ext      = $filename[count($filename) - 1];
$filename = date('ymdhis') . '.' . $ext;
$bl       = move_uploaded_file($_FILES['webuploaderimg']['tmp_name'], './uploads/' . $filename);
if (!$bl) {
	$redata['status'] = 0;
}
echo json_encode($redata);
die();