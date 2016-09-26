/**
 * 该js是页面展示select动态调整
 */

$(function() {

	// 监听select标签
	$(".state_id").bind("change", function() {
		refreshSelect();
	});
	// 监听加载
	$(document).ready(function() {
		findStateId();
	});

	// 查找提交标签的href的stateId的值
	function findStateId() {
		var href = $(".selectCom").attr("href");
		var lastIndex = href.lastIndexOf('&stateId=') + 9;
		var stateId = href.slice(lastIndex);
		if (stateId != null & stateId != "") {
			$(".state_id").val(stateId);
		}
	}

	// 提交选择的状态
	function refreshSelect() {
		var stateId = $(".state_id").val();
		var href = $(".selectCom").attr("href");
		var lastIndex = href.lastIndexOf('&stateId=');
		var new_href = href.slice(0, lastIndex + 9);
		if (stateId != null) {
			$(".selectCom").attr('href', new_href + stateId);
			$(".formA").click();
		}
	}
})
