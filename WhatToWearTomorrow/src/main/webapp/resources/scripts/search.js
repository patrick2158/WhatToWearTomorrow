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