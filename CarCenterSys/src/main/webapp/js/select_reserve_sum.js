/**
 * 每5分钟查询一次预约信息的数量
 */
$(function() {
	// 定时每隔5分钟执行一次
	var t1 = window.setInterval(reserve_sum, 30000);

	// 查询预约信息数量,并展示
	function reserve_sum() {
		$.ajax({
			type : "POST",
			url : "/CarCenterSys/json/getReserveSum.html",
			contentType : "application/json",
			success : function(sum) {
				//不显示0
				if (sum == 0) {
					sum = null;
				}
				$(".reserve_info").text(sum);
			},
			error : function() {
				alert("请求失败");
			}
		});
	}

	// window.clearInterval(t1);

})