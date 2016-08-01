<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>WTWT - What To Wear Tomorrow?</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
	<div data-role="page" id="join">

		<div data-role="header">
			<img alt="main image"
				src="${pageContext.request.contextPath}/resources/img/homeMain.jpg">
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<form action="${pageContext.request.contextPath}/join.do"
				method="post">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">What To Wear Tomorrow</li>
					<li class="ui-field-contain"><input name="email" id="email"
						value="" data-clear-btn="true" placeholder="Email" type="email"></li>
					<li class="ui-field-contain"><input name="password"
						id="password" value="" data-clear-btn="true"
						placeholder="Password" type="password"></li>
					<li class="ui-field-contain"><input name="name" id="name"
						value="" data-clear-btn="true" placeholder="Name" type="text"></li>
					<li class="ui-field-contain"><div class="ui-grid-a">
							<div class="ui-block-a">
								<fieldset data-role="controlgroup" data-type="horizontal">
									<input name="sex" id="radio-choice-h-2a" value="m"
										checked="checked" type="radio"> <label
										for="radio-choice-h-2a">Male</label> <input
										name="sex" id="radio-choice-h-2b" value="f"
										type="radio"> <label for="radio-choice-h-2b">Female</label>
								</fieldset>
							</div>
							<div class="ui-block-b">
								<span id="checkIdResult"></span>
							</div>
						</div></li>
					<li class="ui-field-contain"><button type="submit"
							class="ui-btn ui-mini ui-corner-all">Join</button></li>
				</ul>
			</form>

			<ul data-role="listview" data-inset="true">
				<li data-role="list-divider">Do you already have registered an
					account?</li>
				<li class="ui-field-contain"><a href="${pageContext.request.contextPath}/goLogin.do">Login</a></li>
			</ul>
		</div>
		<!-- /content -->
		<script>
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
		</script>
	</div>
	<!-- /page -->

</body>
</html>