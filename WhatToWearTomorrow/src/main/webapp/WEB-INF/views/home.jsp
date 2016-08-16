<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>Home - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsiveListviewForHome.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page" class="my-page">

		<div data-role="header" data-position="fixed">
			<h1>Share Outfits</h1>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<ul data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Search outfits...">
				<c:forEach var="share" items="${shareList}">
					<li><a href="#${share.outfit_num}" data-rel="popup"
						data-position-to="window" data-transition="fade"><img
							src="${share.img_path}" class="ui-li-thumb">
							<h2>${share.caption}</h2>
							<p class="ui-li-aside">${share.name}</p></a></li>
					<div data-role="popup" id="${share.outfit_num}"
						data-corners="false">
						<a href="#" data-rel="back"
							class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a><img
							class="popphoto" src="${share.img_path}"
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