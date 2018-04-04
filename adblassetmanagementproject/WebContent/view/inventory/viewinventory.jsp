
<jsp:include page="/includefile"></jsp:include>
<jsp:include page="inventoryJson.jsp"></jsp:include>
<html>
<head>

<!-- <style>
tfoot{
display: table-header-group;}
</style> -->
<script type="text/javascript" src="../../assets/js/bootstrap-confirmation.min.js"></script>
</head>
<body class="background">
<div class="breadcrumb-line ">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home"
				aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Items</li>
			<li class="breadcrumb-item active" aria-current="page">View
				Inventory</li>
		</ol>
	</nav>
</div>
<div class="panel panel-default" style="width: 95%; margin: auto;">
	<div class="panel-heading ">
		<h5>
			<strong>Inventory Item Details</strong>
		</h5>
		<!-- <a href="#" class="btn btn-default" data-toggle="confirmation" data-title="Open Google?">fdsafd</a> -->
		<input type="text" class="form-control count total-stock pull-right" readonly style="width:5%">
		
	</div>
	<div class="panel-body">
		<table id="datatableaa" class="table jambo_table table-striped table-bordered resulttable display nowrap" >
			<thead>
				<tr>
					<th>S.No</th>
					<th>Item Code</th>
					<th>Transaction Id</th>
					<th>Group Code</th>
					<th>Item Name</th>
					<th>Model</th>
					<th>Purchase Date</th>
					<th>Rate</th>
					<th id="remove"><i class="fa fa-cog" aria-hidden="true"></i></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>Total</th>
					<th></th>
					<th></th>

</tr>
			</tfoot>
		</table>
	</div>
</div>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<p>${msg }</p>
				<br>
				<%if(request.getAttribute("action")==null) {%>
				Updated Itemcode: ${inventory.updated_itemcode }<br> Item name:
				${inventory.itemname }<br>
				<%} %>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 
</body>
</html>
