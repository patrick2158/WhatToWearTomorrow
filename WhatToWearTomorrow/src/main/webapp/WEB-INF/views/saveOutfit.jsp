<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Save a Outfit - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/scripts/jquery.min.js"></script>

</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content" id="main">
			<img alt="Image not loading" src="${img_path}">
			<form action="${pageContext.request.contextPath}/saveOutfit.do"
				method="post">
				<input name="img_path" id="img_path" value="${img_path}"
					data-clear-btn="true" type="hidden">
				<ul data-role="listview" data-inset="true">
					<li class="ui-field-contain"><label for="outfit_share">Share:</label>
						<select name="outfit_share" id="outfit_share" data-role="slider">
							<option value="N">N</option>
							<option value="Y">Y</option>
					</select></li>
					<li class="ui-field-contain"><label for="caption">Caption:</label>
						<textarea cols="40" rows="8" name="caption" id="caption"></textarea></li>
					<li class="ui-body ui-body-b">
						<fieldset class="ui-grid-a">
							<div class="ui-block-a">
								<a href="#" data-rel="back"
									class="ui-btn ui-corner-all ui-btn-a">Cancel</a>
							</div>
							<div class="ui-block-b">
								<button type="submit" class="ui-btn ui-corner-all ui-btn-a">Save</button>
							</div>
						</fieldset>
					</li>
				</ul>
			</form>
		</div>
		<!-- /content -->


		<div data-role="footer" data-position="fixed">
			<h2>Step 2. Save a outfit</h2>
		</div>
		<!-- /footer -->
	</div>
	<!-- /page -->
</body>
</html>