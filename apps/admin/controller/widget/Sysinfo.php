<?php
namespace app\admin\controller\widget;

class Sysinfo extends Base {
	public function sinfo() {
		return $this->fetch('widget/sinfo');
	}
}