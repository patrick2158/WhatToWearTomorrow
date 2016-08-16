$(document).ready(function() {
	$("#fileUpload").on('change', function() {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#preview").attr("src", e.target.result);
		}
		reader.readAsDataURL($(this)[0].files[0]);
		
		$("#msg").html("Cut item out of photo");
		
		$("#preview").imgAreaSelect({
			handles : true,
			onSelectEnd : function(img, selection) {
				$('input[name="x1"]').val(selection.x1);
				$('input[name="y1"]').val(selection.y1);
				$('input[name="x2"]').val(selection.x2);
				$('input[name="y2"]').val(selection.y2);
			}
		});
	});
	
	$("#next").click(function(e) {
		$("#upload").submit();
	})
});