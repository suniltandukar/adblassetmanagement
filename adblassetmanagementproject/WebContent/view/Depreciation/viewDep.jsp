<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
<body>

	<div class="breadcrumb-line ">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Depreciation</li>
				<li class="breadcrumb-item active" aria-current="page">View
					Depreciation</li>
			</ol>
		</nav>
	</div>
	<div>
		<table id="datatableaa" class="display compact nowrap"
			style="width: 100%">
			<caption>Depreciation Detail</caption>
			<thead>
				<tr>
					<th>Itemcode</th>
					<th>Amount</th>
					<th>Dep upto Last Fiscal Year</th>
					<th>Dep Current Year</th>
					<th>Total Dep</th>
					<th>Balance Amount</th>
					<th>Action</th>
				</tr>
			</thead>

		</table>
	</div>
	<div class="modal fade" id="myModal" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">


					<p>
						<b>${msg}</b>
					</p>
					<br>

				</div>
				<div class="modal-footer">
					<button type="button" id="button" class="btn btn-default"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {

							var t = $('#datatableaa')
									.DataTable(
											{

												"ajax" : "viewDep.adbl",
												"columns" : [
														{
															"data" : "rate"
														},
														{
															"targets" : 0,
															"data" : "itemcode",
															"render" : function(
																	data, type,
																	row, meta) {
																return '<a href="editinventory.click?id='
																		+ data
																		+ '">'
																		+ data
																		+ '</a>';
															}
														},
														{
															"data" : "itemname"
														},
														{
															"data" : "rate"
														},
														{
															"data" : "lastyrdep"
														},

														{
															"data" : "curyrdep"
														},

														{
															"data" : "totaldep"
														},
														{
															"data" : "balance"
														},
														{
															"orderable" : false,
															"searchable" : false,
															"render" : function(
																	data, type,
																	row, meta) {
																return '<a class="a" href="editDepreciation.click?id='
																		+ row.did
																		+ '&itemcode='
																		+ row.itemcode
																		+ '&lastyrdep='
																		+ row.lastyrdep
																		+ '">Edit</a>';
															}
														},

												]
											});
							t.on('order.dt search.dt', function() {
								t.column(0, {
									search : 'applied',
									order : 'applied'
								}).nodes().each(function(cell, i) {
									var c = cell.innerHTML = i + 1;
									$('.count').val(c);
								});
							}).draw();
						});
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		
	</script>
</body>
</head>
</html>
