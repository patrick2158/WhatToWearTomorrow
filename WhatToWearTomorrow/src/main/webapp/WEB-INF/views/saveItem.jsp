<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Save a Item - WTWT</title>
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
			<img alt="Image not loading" src="${img_path}">
			<form action="${pageContext.request.contextPath}/saveItem.do"
				method="post">
				<input name="img_path" id="img_path" value="${img_path}"
					data-clear-btn="true" type="hidden">
				<ul data-role="listview" data-inset="true">
					<li class="ui-field-contain"><label for="name">Name: </label>
						<input name="name" id="name" value="" data-clear-btn="true"
						type="text"></li>
					<li class="ui-field-contain"><label for="brand">Brand:
					</label> <input name="brand" id="brand" value="" data-clear-btn="true"
						type="text"></li>
					<li class="ui-field-contain"><label for="season">Season:</label>
						<select name="season" id="season" data-role="slider">
							<option value="S/S">S/S</option>
							<option value="F/W">F/W</option>
					</select></li>
					<li class="ui-field-contain"><label for="category"
						class="select">Category:</label> <select name="category"
						id="category">
							<option value="Top">Top</option>
							<option value="Bottom">Bottom</option>
							<option value="Shoes">Shoes</option>
							<option value="ACC">ACC</option>
					</select></li>
					<li class="ui-field-contain"><label for="price">Price:
					</label> <input name="price" id="price" value="" data-clear-btn="true"
						type="number"></li>
					<li class="ui-field-contain"><label for="item_size">Size:
					</label> <input name="item_size" id="item_size" value=""
						data-clear-btn="true" type="text"></li>
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
			<h2>Step 3. Save a Item</h2>
			<a href="${pageContext.request.contextPath}/goTakePhoto.do"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-left ui-btn-icon-left ui-icon-carat-l">Back</a>
			<a href="#popup"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini footer-button-right ui-btn-icon-left ui-icon-check">Save</a>
		</div>
		<!-- /footer -->
	</div>
	<!-- /page -->
</body>
</html>