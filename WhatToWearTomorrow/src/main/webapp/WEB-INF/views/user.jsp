<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>User - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<h1>User</h1>
		</div>
		<!-- /header -->
		
		<c:set var="avatar" value="woman.png" />
		<c:if test="${sessionScope.person.sex eq 'M'.charAt(0)}">
			<c:set var="avatar" value="man.png" />
		</c:if>

		<div role="main" class="ui-content">
			<ul data-role="listview" data-split-icon="gear" data-split-theme="a"
				data-inset="false">
				<li><a><img alt="avatar"
						src="${pageContext.request.contextPath}/resources/img/${avatar}">
						<h2>${sessionScope.person.name}</h2>
						<p>${sessionScope.person.email}</p></a> <a href="#edit"
					data-rel="popup" data-position-to="window" data-transition="pop">editUser</a></li>
			</ul>

		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>
		<!-- /footer -->
	</div>
	<!-- /page -->

</body>
</html>