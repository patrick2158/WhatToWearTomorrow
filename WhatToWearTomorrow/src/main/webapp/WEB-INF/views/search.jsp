<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footer.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
$( document ).on( "pagecreate", function() {
	$( "#autocomplete" ).on( "filterablebeforefilter", function ( e, data ) {
		var $ul = $( this ),
		$input = $( data.input ),
		value = $input.val(),
		html = "";
		$ul.html( "" );
		if ( value && value.length > 2 ) {
			$ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
			$ul.listview( "refresh" );
			$.ajax({
				url: "${pageContext.request.contextPath}/searchName.do",
				type: "post",
				data: {
					"name": $input.val()
				},
				success : function ( result ) {
					$.each(result , function() {
						$.each(this, function (key, val) {
							html += "<li>name: " + val.name + ", sex: " + val.sex + ", email: " + val.email + "<li>";
						});
					});

					$ul.html( html );
					$ul.listview( "refresh" );
					$ul.trigger( "updatelayout");
				}
			});
		}
	});
});
</script>
</head>
<body>

	<div data-role="page">

		<div data-role="header" data-position="fixed">
			<h1>Search</h1>
		</div>
		<!-- /header -->

		<div role="main" class="ui-content">
			<form class="ui-filterable">
				<input id="autocomplete-input" data-type="search"
					placeholder="Find your friend...">
			</form>
			<ul id="autocomplete" data-role="listview" data-inset="true"
				data-filter="true" data-input="#autocomplete-input"></ul>
		</div>
		<!-- /content -->

		<div data-role="footer" data-position="fixed">
			<jsp:include page="../../resources/jsp/footer.jsp"></jsp:include>
		</div>

	</div>
</body>
</html>