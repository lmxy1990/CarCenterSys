/**
 * 该js作用是仿制select选择框.并动态改变与之关联的input输入框的name属性
 */

$(function() {

	// 绑定监听
	$(".select-item").click(function() {
		var text = this.innerText;
		$("#select")[0].innerHTML = text + '<span class="caret"></span>';
		if (text == '用户名') {
			$("#inputKey").attr("name", "userName");
			return;
		}
		if (text == '车牌号') {
			$("#inputKey").attr("name", "userNo");
			return;
		}

	});

})
