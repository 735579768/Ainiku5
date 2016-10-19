<?php
namespace app\admin\widget;

class Sysinfo extends Base {
	public function sinfo() {
		return $this->fetch('widget/sinfo');
	}
}