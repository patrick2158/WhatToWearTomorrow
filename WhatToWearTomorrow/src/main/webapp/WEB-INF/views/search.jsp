<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Search - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/search.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<jsp:include page="../../resources/jsp/header.jsp"></jsp:include>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<form class="ui-filterable">
				<input id="autocomplete-input" data-type="search"
					placeholder="Find a name">
			</form>
			<ul id="autocomplete" data-role="listview" data-inset="true"
				data-filter="true" data-input="#autocomplete-input"></ul>
		</div>
		<!-- /content -->

	</div>

	<script src="../../resources/js/search.js"></script>
</body>
</html>