<?php
/* PHP SDK
 * @version 2.0.0
 * @author connect@qq.com
 * @copyright © 2013, Tencent Corporation. All rights reserved.
 */
define("CLASS_PATH", __DIR__ . "/class/");
require_once CLASS_PATH . "QC.class.php";
$qc = new QC();
$qc->qq_login();
