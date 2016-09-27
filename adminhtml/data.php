<?php
$action = $_GET['a'];
$data   = array();
switch ($action) {

case 'leftmenu':
	$data = array(
		array(
			'title' => '默认',
			'child' => array(
				array(
					'title' => '编辑文章',
					'url'   => './iframe-edit.php',
				),
				array(
					'title' => '分类树',
					'url'   => './iframe-tree.php',
				),
			),
		),
		array(
			'title' => '文章管理',
			'child' => array(
				array(
					'title' => '文章列表',
					'url'   => './iframe-list.php',
				),
				array(
					'title' => '登录',
					'url'   => './login.php',
				),
			),
		),
		array(
			'title' => '默认',
			'child' => array(
				array(
					'title' => '编辑文章',
					'url'   => './iframe-edit.php',
				),
				array(
					'title' => '编辑文章',
					'url'   => './iframe-edit.php',
				),
			),
		),

	);
	break;

default:

	break;
}
header('Content-type: application/json; charset=utf-8');
echo json_encode($data);
die();