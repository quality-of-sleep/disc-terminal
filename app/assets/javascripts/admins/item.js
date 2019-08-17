$(document).ready(function () {
  // 全ての子孫要素から取得する.find()
	$($('.new-item').find('select, input[type=text]')).addClass('form-control')

});