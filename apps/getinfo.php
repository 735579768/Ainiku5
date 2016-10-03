<?php
function get_status($status = 0, $type = 'status') {
	$arr = config('systemstatus');
	if (isset($arr[$type])) {
		return $arr[$type][$status];
	} else {
		return '--';
	}
}