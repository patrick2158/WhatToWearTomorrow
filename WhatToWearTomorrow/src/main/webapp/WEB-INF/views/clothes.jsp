<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Clothes - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<!-- Start of first page -->
	<div data-role="page" id="items">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<p>I'm first in the source order so I'm shown as the page.</p>
		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<h2>Items</h2>
			<a href="${pageContext.request.contextPath}/goTakePhoto.do"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-left ui-btn-icon-left ui-icon-plus">add</a>
			<a href="#outfits"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-right ui-btn-icon-right ui-icon-carat-r">Outfits</a>
		</div>
	</div>
	<!-- /page -->

	<!-- Start of second page -->
	<div data-role="page" id="outfits">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<p>I'm the second in the source order so I'm hidden when the page
				loads. I'm just shown if a link that references my id is beeing
				clicked.</p>
		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<h2>Outfits</h2>
			<a href="#"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-left ui-btn-icon-left ui-icon-plus">Add</a>
			<a href="#items"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-right ui-btn-icon-right ui-icon-carat-r">Items</a>
		</div>
	</div>
	<!-- /page -->
</body>
</html>