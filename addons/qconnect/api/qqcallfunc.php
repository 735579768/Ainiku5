<?php
session_start();
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */
defined("CLASS_PATH") OR define("CLASS_PATH", __DIR__ . "/class/");
require_once CLASS_PATH . "QC.class.php";
$qc    = new QC();
$acs   = $qc->qq_callback();
$oid   = $qc->get_openid();
$qc    = new QC($acs, $oid);
$qinfo = $qc->get_user_info();
$uinfo = session('uinfo');

//保存访问key和qq的唯一标识a
session('accesskey', $acs);
session('openid', $oid);
//$qqinfo=$qc->get_user_info();
if (is_array($uinfo)) {
	$uinfo = array_merge($uinfo, ['qqimg' => $qinfo['figureurl'], 'qqname' => $qinfo['nickname'], 'qinfo' => $qinfo]);
}
session('uinfo', $uinfo);
