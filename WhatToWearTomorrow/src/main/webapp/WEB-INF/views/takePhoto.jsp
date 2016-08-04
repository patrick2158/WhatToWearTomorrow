<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

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
				
				<label for="fileUpload" class="ui-btn ui-btn-icon-top ui-icon-camera">Camera</label><input
					type="file" name="image" accept="image/*" id="fileUpload" capture="camera" style="display: none" />
				<img id="preview" />
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
	</div>

	<script>
	$("#fileUpload").on('change', function () {
            var reader = new FileReader();
            reader.onload = function (e) {
				 $("#preview").attr("src", e.target.result);
            }
            reader.readAsDataURL($(this)[0].files[0]);
            
			$("#msg").html("Step2. cut item out of photo");
			
			$("#preview").imgAreaSelect({
				handles: true,
				onSelectEnd: null
			});
    });
	
/* 		function handleImageView(files) {
			var file = files[0];
					
			var reader = new FileReader();
			reader.onload = function(e) {
				var img = new Image();
				img.onload = function() {
					var ctx = document.getElementById("cview").getContext("2d");
					var x = $(".ui-content").width();
					var w = parseInt(img.width);
					var h = parseInt(img.height);
					var y;

					ctx.canvas.width = x;

					if (w > x) {
						y = x * h / w;
						ctx.canvas.height = y;
						ctx.drawImage(img, 0, 0, x, y);
					} else {
						w = x / 2 - w /2;
						ctx.canvas.height = h; 
						ctx.drawImage(img, w, 0);	
					}
				}
						
				img.src = e.target.result;
				$("#msg").html("Step2. cut item out of photo");
				$("#cview").imgAreaSelect({
					handles: true,
					onSelectEnd: null
				});
			}
			reader.readAsDataURL(file);
		} */
				
		$(document).ready(function() {
			$("#next").click(function(e) {
				$("#upload").submit();
			})
		});
	</script>
	<!-- /page -->
</body>
</html>