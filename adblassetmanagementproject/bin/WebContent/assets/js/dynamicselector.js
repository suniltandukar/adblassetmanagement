$(document).ready(function()
			{
		$(".district").change(function()
		{
		var id=$(this).val();
		var dataString = 'id='+ id;
		$.ajax
		({
		type: "POST",
		url: "view/onselectpages/viewMuncipality.jsp",
		data: dataString,
		cache: false,
		success: function(html)
		{
		$(".vdcmun").html(html);
		} 
		});
		});
		$(".vdcmun").change(function()
				{
				var id=$(this).val();
				var dataString = 'id='+ id;
				$.ajax
				({
				type: "POST",
				url: "view/onselectpages/viewWardNo.jsp",
				data: dataString,
				cache: false,
				success: function(html)
				{
				$(".wardno").html(html);
				} 
				});
				});
		});