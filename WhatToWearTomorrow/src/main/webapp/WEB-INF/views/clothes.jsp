<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>Clothes - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsiveListview.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page" id="items" class="my-page">

		<div data-role="header" data-position="fixed">
			<h2>Items</h2>
			<a href="${pageContext.request.contextPath}/goTakePhoto.do" data-ajax="false"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini header-button-left ui-btn-icon-left ui-icon-plus">Add</a>
			<a href="${pageContext.request.contextPath}/goOutfits.do" data-ajax="false"
				class="ui-btn ui-corner-all ui-btn-inline ui-mini header-button-right ui-btn-icon-right ui-icon-carat-r">Outfits</a>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<ul data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Search items...">
				<c:forEach var="item" items="${itemList}">
					<li><a href="#${item.item_num}" data-rel="popup"
						data-position-to="window" data-transition="fade"><img
							src="${item.img_path}" class="ui-li-thumb">
							<h2>${item.name}</h2>
							<p>${item.category}, ${item.item_size}, ${item.price}</p>
							<p class="ui-li-aside">${item.brand}</p></a></li>
					<div data-role="popup" id="${item.item_num}" data-corners="false">
						<a href="#" data-rel="back"
							class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a><img
							class="popphoto" src="${item.img_path}"
							style="max-height: 512px;">
					</div>
				</c:forEach>
			</ul>
		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
 			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>
		
	</div>
	<!-- /page -->
</body>
</html>