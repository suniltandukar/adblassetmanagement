<link rel="import" href="new.jsp">
<div class="panel panel-default" style="width: 100%; margin: auto;">
    <div class="panel-heading">
    	<h4>Edit Inventory</h4>
    	<hr>
    	<h6><strong>Insert Item Code</strong></h6>
    	<input type="text" class="form-control itemcode" style="width:20%;">   
    </div>
     </div>
<div class="displayform">
</div>
<script>
$(document).ready(function()
        {
	 $(".itemcode").blur(function()
		        {
		 var id=$(this).val();
		 var dataString = 'id='+ id;
		 $.ajax
	        ({
	        type: "POST",
	        url: "view/inventory/editinventorydisplayform.jsp",
	        data: dataString,
	        cache: false,
	        success: function(html)
	        {
	        $(".displayform").html(html);
	        } 
	        });
		 
	});
});
</script>