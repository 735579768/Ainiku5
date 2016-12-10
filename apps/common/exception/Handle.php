<?php
namespace app\common\exception;

class Handle extends \think\exception\Handle {
	/**
	 * Report or log an exception.
	 *
	 * @param  \Exception $exception
	 * @return void
	 */
	public function report(\Exception $exception) {
		if (!$this->isIgnoreReport($exception)) {
			// 收集异常数据
			$data = [
				'file'    => $exception->getFile(),
				'line'    => $exception->getLine(),
				'message' => $this->getMessage($exception),
				'code'    => $this->getCode($exception),
			];
			$log = "[{$data['code']}]{$data['message']}[{$data['file']}:{$data['line']}]";

			\think\Log::record($log, 'error');
		}
	}

	public function render(\Exception $e) {
		// if ($e instanceof HttpException) {
		// 	$statusCode = $e->getStatusCode();
		// }
		//TODO::开发者对异常的操作
		//可以在此交由系统处理
		return parent::render($e);
	}

}