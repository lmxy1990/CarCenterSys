/**
 * 该js页面是前台主页展示页面的一些函数
 */

$(function() {
	if ($(window).width() > 960) {
		var tw = $('.triangles').width() / 7 + 32;
		var ta = tw / 2 + 22;
		$('.down-triangle').css('border-top', tw + 'px solid rgba(0,0,0,0.8)')
				.css('border-left', ta + 'px solid transparent').css(
						'border-right', ta + 'px solid transparent');
		$('.up-triangle').css('border-bottom', tw + 'px solid rgba(0,0,0,0.8)')
				.css('border-left', ta + 'px solid transparent').css(
						'border-right', ta + 'px solid transparent');
	}

	$('a[href*=#]:not([href=#]):not([rel=crs])').click(
			function() {
				if (location.pathname.replace(/^\//, '') == this.pathname
						.replace(/^\//, '')
						&& location.hostname == this.hostname) {
					var target = $(this.hash);
					target = target.length ? target : $('[name='
							+ this.hash.slice(1) + ']');
					if (target.length) {
						$('html,body').animate({
							scrollTop : target.offset().top
						}, 1000);
						return false;
					}
				}
			});

	/* 模态框垂直居中 */
	function centerModals() {
		$('.modal').each(
				function(i) {
					var $clone = $(this).clone().css('display', 'block')
							.appendTo('body');
					var top = Math.round(($clone.height() - $clone.find(
							'.modal-content').height()) / 2);
					top = top > 0 ? top : 0;
					$clone.remove();
					$(this).find('.modal-content').css("margin-top", top);
				});
	}
	$('.modal').on('show.bs.modal', centerModals);
	$(window).on('resize', centerModals);
});
