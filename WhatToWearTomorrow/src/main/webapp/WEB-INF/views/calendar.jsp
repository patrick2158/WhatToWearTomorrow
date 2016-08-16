<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Calendar - WTWT</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
    	autoSize: true
  } );
  </script>
</head>
<body>

	<div data-role="page">

		<div data-role="header">
			<h1>Calendar</h1>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<div id="datepicker"></div>
		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>

	</div>
	<!-- /page -->

</body>
</html>