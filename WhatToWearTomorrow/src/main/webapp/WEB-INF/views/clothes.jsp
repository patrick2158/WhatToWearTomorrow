<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Clothes - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>
	<div data-role="page">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<p>Page content goes here.</p>
		</div>
		<!-- /content -->

		<div data-role="footer">
			<h2>Item</h2>
			<a href="#"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-left ui-btn-icon-left ui-icon-power">Quit</a>
			<a href="#"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-right ui-btn-icon-right ui-icon-carat-r">Next</a>
		</div>
	</div>
	<!-- /page -->

</body>
</html>