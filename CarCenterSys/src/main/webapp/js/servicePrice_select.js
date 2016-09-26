/**
 * 服务价格级联
 */
$(function() {

	$("#serviceId").bind("change", function() {
		setSelectPrice();
	});

	function setSelectPrice() {
		var selected = $("#serviceId").val();
		$("#servicePrice").val(selected);
	}

})