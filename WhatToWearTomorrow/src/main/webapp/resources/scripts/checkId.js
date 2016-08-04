$("#email").focusout(function() {
	var email = $(this).val();
	var emailChk1 = email.indexOf('@');
	var emailChk2 = email.indexOf('.');
	var msg = "";

	if (emailChk1 === -1 || emailChk2 === -1) {
		msg = "check your email address"
			$("#checkIdResult").html(msg);
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/checkId.do",
			type : "post",
			data : {
				"email" : email
			},
			success : function(result) {
				if (result.flag) {
					msg = "available email";
				} else {
					msg = "not available email";
				}
				$("#checkIdResult").html(msg);
			}
		})
	}
});