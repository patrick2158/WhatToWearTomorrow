
<div data-role="header" style="overflow: hidden;">
	<h1>What To Wear Tomorrow</h1>
	<a href="#" data-icon="user" class="ui-btn-right">Options</a>
	<div data-role="navbar" data-iconpos="top">
		<ul>
			<li><button id="home" data-icon="home">Home</button></li>
			<li><button id="clothes" data-icon="eye">Clothes</button></li>
			<li><button id="favorites" data-icon="star">Favorites</button></li>
			<li><button id="search" data-icon="search">Search</button></li>
		</ul>
	</div>
	<!-- /navbar -->
</div>

<script>
	$('li').click(function(e) {
		if(e.target.id=="home") {
			$(location).attr('href', "${pageContext.request.contextPath}/")
		} else if(e.target.id=="clothes") {
			$(location).attr('href', "${pageContext.request.contextPath}/goClothes.do")
		} else if(e.target.id=="favorites") {
			$(location).attr('href', "${pageContext.request.contextPath}/goFavorites.do")
		} else if(e.target.id=="search") {
			$(location).attr('href', "${pageContext.request.contextPath}/goSearch.do")
		} 
	});
</script>