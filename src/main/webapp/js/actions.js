function addLike(pid, uid) {

	const d = {
		pid: pid,
		uid: uid,
		operation: 'like'
	}

	$.ajax({
		url: "likeservlet",
		data: d,
		success: function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() == 'true') {
				let likes = $('.likeCount').html();
				likes++
				$('.likeCount').html(likes);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	})
}
