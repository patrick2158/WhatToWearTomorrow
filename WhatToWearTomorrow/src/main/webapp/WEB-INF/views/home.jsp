<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<img alt="main image" src="${pageContext.request.contextPath}/resources/img/homeMain.jpg">
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<form>
				<ul data-role="listview" data-inset="true">
				<li data-role="list-divider">What To Wear Tomorrow</li>
					<li class="ui-field-contain"><label for="email">email:</label>
						<input name="email" id="email" value="" data-clear-btn="true"
						type="text"></li>
					<li class="ui-field-contain"><label for="password">password:</label>
						<input name="password" id="password" value=""
						data-clear-btn="true" type="password"></li>
					<li class="ui-field-contain"><button type="submit"
							class="ui-btn ui-mini ui-corner-all">Join</button></li>
				</ul>
			</form>
		</div>
		<!-- /content -->

	</div>
	<!-- /page -->

</body>
</html>