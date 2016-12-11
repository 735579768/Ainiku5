<?php
session_start();
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */
require_once dirname(__FILE__) . "/comm/config.php";
require_once CLASS_PATH . "QC.class.php";
$qc    = new QC();
$acs   = $qc->qq_callback();
$oid   = $qc->get_openid();
$qc    = new QC($acs, $oid);
$uinfo = $qc->get_user_info();

//保存访问key和qq的唯一标识a
session('accesskey', $acs);
session('openid', $oid);
//$qqinfo=$qc->get_user_info();
session('qqimg', $uinfo['figureurl']);
session('qqname', $uinfo['nickname']);
session('qqinfo', $uinfo);
session('uinfo', $uinfo);

//var_dump($oid);
//die();
