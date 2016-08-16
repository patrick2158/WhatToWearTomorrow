<div class="ui-grid-d center">
	<div class="ui-block-a">
		<a
			class="ui-shadow ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext ui-btn-inline" id="home" data-ajax="false">Home</a>
	</div>
	<div class="ui-block-b">
		<a
			class="ui-shadow ui-btn ui-corner-all ui-icon-eye ui-btn-icon-notext ui-btn-inline" id="clothes" data-ajax="false">Clothes</a>
	</div>
	<div class="ui-block-c">
		<a
			class="ui-shadow ui-btn ui-corner-all ui-icon-calendar ui-btn-icon-notext ui-btn-inline" id="calendar" data-ajax="false">Calendar</a>
	</div>
	<div class="ui-block-d">
		<a
			class="ui-shadow ui-btn ui-corner-all ui-icon-search ui-btn-icon-notext ui-btn-inline" id="search" data-ajax="false">Search</a>
	</div>
	<div class="ui-block-e">
		<a
			class="ui-shadow ui-btn ui-corner-all ui-icon-user ui-btn-icon-notext ui-btn-inline" id="user" data-ajax="false">User</a>
	</div>
</div>

<script>
	$(".ui-grid-d a").click(function(e) {
		e.preventDefault();
		if(e.target.id=="home") {
			$(location).attr('href', "${pageContext.request.contextPath}/goHome.do")
		} else if(e.target.id=="clothes") {
			$(location).attr('href', "${pageContext.request.contextPath}/goClothes.do")
		} else if(e.target.id=="calendar") {
			$(location).attr('href', "${pageContext.request.contextPath}/goCalendar.do")
		} else if(e.target.id=="search") {
			$(location).attr('href', "${pageContext.request.contextPath}/goSearch.do")
		} else if(e.target.id=="user") {
			$(location).attr('href', "${pageContext.request.contextPath}/goUser.do")
		} 
	});
</script>