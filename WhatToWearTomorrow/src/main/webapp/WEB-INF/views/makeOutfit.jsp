<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>Make a outfit - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/panel.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/jquery.ui.touch-punch.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/html2canvas.js"></script>
</head>
<body>

	<div data-role="page" id="outfits">

		<div data-role="header" data-position="fixed">
			<div data-role="controlgroup" data-type="horizontal"
				class="ui-mini ui-btn-inline ui-btn-left">
				<a href="#" id="items" data-rel="back"
					class="ui-btn ui-btn-icon-left ui-icon-delete" data-direction="reverse" data-ajax="false">Exit</a> <a
					href="#items-panel" id="add"
					class="ui-btn ui-btn-icon-left ui-icon-plus" data-ajax="false">Item</a>
			</div>
			<a href="#" id="next"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini ui-btn-right ui-btn-icon-right ui-icon-carat-r" data-ajax="false">Next</a>
			<h2 id="msg"> New look</h2>
		</div>
		<!-- /header -->

		<div role="main" id="outfits-main" class="ui-content"></div>
		<form method="post" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/makeOutfit.do"
			id="makeOutfit" data-ajax="false">
			<input type="hidden" name="image" id="image" value="" />
		</form>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>

		<div data-role="panel" id="items-panel">
			<ul data-role="listview">
				<li data-icon="delete"><a href="#" data-rel="close">Close</a></li>
				<c:forEach var="item" items="${itemList}">
					<li><a><img alt="${item.item_num}" src="${item.img_path}"
							class="ui-li-thumb"></a></li>
				</c:forEach>
			</ul>
		</div>
		<!-- /panel -->
	</div>
	<!-- /page -->
	<script>
		$(document)
				.ready(
						function() {

							var screen = $.mobile.getScreenHeight();

							var header = $(".ui-header").hasClass(
									"ui-header-fixed") ? $(".ui-header")
									.outerHeight() - 1 : $(".ui-header")
									.outerHeight();

							var footer = $(".ui-footer").hasClass(
									"ui-footer-fixed") ? $(".ui-footer")
									.outerHeight() - 1 : $(".ui-footer")
									.outerHeight();

							/* content div has padding of 1em = 16px (32px top+bottom). This step
							   can be skipped by subtracting 32px from content var directly. */
							var contentCurrent = $(".ui-content").outerHeight()
									- $(".ui-content").height();

							var content = screen - header - footer
									- contentCurrent;

							$(".ui-content").height(content);

							$("#items-panel")
									.find("img")
									.click(
											function() {
												$("#outfits-main")
														.append(
																"<a class='draggable'><img alt='" + this.alt + "' src='" + this.src + "'></a>");
												$(".draggable").draggable();
												$("#msg").html("Lay out");
											});

							$("#next")
									.click(
											function() {
												html2canvas(
														$("#outfits-main"),
														{
															onrendered : function(
																	canvas) {
																$("#image")
																		.val(
																				canvas
																						.toDataURL("image/png"));
																$(
																		"#outfits-main")
																		.html(
																				"");
																$("#makeOutfit")
																		.submit();
															}
														});
											});

						});
	</script>
</body>
</html>