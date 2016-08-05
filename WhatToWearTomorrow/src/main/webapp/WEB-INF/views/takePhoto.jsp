<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Take a item photo - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/imgareaselect-default.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/scripts/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/scripts/jquery.imgareaselect.pack.js"></script>
</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content" id="main">
			<form id="upload"
				action="${pageContext.request.contextPath}/uploadImage.do"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="x1" value="" /> <input type="hidden"
					name="y1" value="" /> <input type="hidden" name="x2" value="" />
				<input type="hidden" name="y2" value="" /> <label for="fileUpload"
					class="ui-btn ui-btn-icon-top ui-icon-camera">Camera</label><input
					type="file" name="image" accept="image/*" id="fileUpload"
					capture="camera" style="display: none" /> <img id="preview" />
			</form>
		</div>
		<!-- /content -->


		<div data-role="footer" data-position="fixed">
			<h2 id="msg">Step 1. Take a item photo</h2>
			<a href="${pageContext.request.contextPath}/goClothes.do"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-left ui-btn-icon-left ui-icon-delete">Cancel</a>
			<button id="next"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-right ui-btn-icon-right ui-icon-carat-r">
				Next</button>
		</div>
		<!-- /footer -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/scripts/imgAreaSelect.js"></script>
	</div>
	<!-- /page -->
</body>
</html>