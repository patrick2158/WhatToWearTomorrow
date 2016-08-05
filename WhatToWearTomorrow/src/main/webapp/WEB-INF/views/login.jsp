<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

	<div data-role="page" id="login">

		<div role="main" class="ui-content">
			<form action="${pageContext.request.contextPath}/login.do"
				method="post">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">What To Wear Tomorrow</li>
					<li class="ui-field-contain"><input name="email" id="email"
						value="" data-clear-btn="true" placeholder="Email" type="text"></li>
					<li class="ui-field-contain"><input name="password"
						id="password" value="" data-clear-btn="true"
						placeholder="Password" type="password"></li>
					<li class="ui-field-contain"><button type="submit"
							class="ui-btn ui-mini ui-corner-all">Login</button></li>
				</ul>
			</form>
			<ul data-role="listview" data-inset="true">
				<li data-role="list-divider">Don't have an account yet?</li>
				<li class="ui-field-contain"><a href="${pageContext.request.contextPath}/">Join</a></li>
			</ul>
		</div>
		<!-- /content -->

	</div>
	<!-- /page -->
</body>
</html>