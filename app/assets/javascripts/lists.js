$(document).ready(function () {
	
	$('.newlist').click(function () {
		
		$.ajax({
			type: "GET",
			url: $(this).attr('href'),
			success: function (data) {
				$("#newlistajax").html(data);
			}
		});

		return false;
	});

})