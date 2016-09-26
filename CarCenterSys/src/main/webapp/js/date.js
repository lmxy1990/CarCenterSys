/**
 * 该js是设置日期组件的值为当前日期
 */

$(function() {

	$(document).ready(function() {
		setTime();
	});
	function setTime() {
		getFormat();
		if (format != null) {
			$(".consumeTime").val(format);// 赋初始值
		}
	}
	// 全局变量
	var format = "";
	// 构造符合datetime-local格式的当前日期
	function getFormat() {
		format = "";
		var nTime = new Date();
		format += nTime.getFullYear() + "-";
		format += (nTime.getMonth() + 1) < 10 ? "0" + (nTime.getMonth() + 1)
				: (nTime.getMonth() + 1);
		format += "-";
		format += nTime.getDate() < 10 ? "0" + (nTime.getDate()) : (nTime
				.getDate());
		format += "T";
		format += nTime.getHours() < 10 ? "0" + (nTime.getHours()) : (nTime
				.getHours());
		format += ":";
		format += nTime.getMinutes() < 10 ? "0" + (nTime.getMinutes()) : (nTime
				.getMinutes());
		format += ":00";
	}
})
