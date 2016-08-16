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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/imgareaselect-default.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/scripts/jquery.imgareaselect.js"></script>
</head>
<body>

	<div data-role="page">

		<div data-role="header" data-position="fixed">
			<h2 id="msg">Take a item photo</h2>
			<a href="${pageContext.request.contextPath}/goClothes.do" id="cancel"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini header-button-left ui-btn-icon-left ui-icon-delete" data-direction="reverse" data-ajax="false">Cancel</a>
			<button id="next"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini header-button-right ui-btn-icon-right ui-icon-carat-r" data-ajax="false">
				Next</button>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content" id="main">
			<form id="upload"
				action="${pageContext.request.contextPath}/uploadImage.do"
				method="post" data-ajax="false">
				<input type="hidden" name="x1" value="" /> <input type="hidden"
					name="y1" value="" /> <input type="hidden" name="x2" value="" />
				<input type="hidden" name="y2" value="" /> <input type="hidden"
					name="imgName" value="" />
			</form>
			<label for="fileUpload" class="ui-btn ui-btn-icon-top ui-icon-camera">Camera</label><input
				type="file" name="image" accept="image/*" id="fileUpload"
				capture="camera" style="display: none" /> <img id="preview" />
		</div>
		<!-- /content -->


		<div data-role="footer" data-position="fixed">
			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>
		<!-- /footer -->
		<script>
			$(document)
					.ready(
							function() {
								$("#fileUpload")
										.on(
												'change',
												function() {
													var uploadForm = new FormData();
													uploadForm.append("image",
															this.files[0]);

													$
															.ajax({
																url : "${pageContext.request.contextPath}/resizeImage.do",
																data : uploadForm,
																dataType : "json",
																enctype : "multipart/form-data",
																processData : false,
																contentType : false,
																type : "post",
																success : function(
																		result) {
																	var img_path = "/img/"
																			+ result.imgName;
																	$(
																			"#preview")
																			.attr(
																					"src",
																					img_path);
																	$(
																			'input[name="imgName"]')
																			.val(
																					result.imgName);
																}
															});

													$("#msg")
															.html(
																	"Cut a item out");

													$("#preview")
															.imgAreaSelect(
																	{
																		handles : true,
																		onSelectEnd : function(
																				img,
																				selection) {
																			$(
																					'input[name="x1"]')
																					.val(
																							selection.x1);
																			$(
																					'input[name="y1"]')
																					.val(
																							selection.y1);
																			$(
																					'input[name="x2"]')
																					.val(
																							selection.x2);
																			$(
																					'input[name="y2"]')
																					.val(
																							selection.y2);
																		}
																	});
												});

						
								$("#next").click(function() {
									$("#upload").submit();
								});
							});
		</script>
	</div>
	<!-- /page -->
</body>
</html>