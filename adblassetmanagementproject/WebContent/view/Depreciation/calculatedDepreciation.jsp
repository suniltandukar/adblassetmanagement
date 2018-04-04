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
				<li class="breadcrumb-item active" aria-current="page">
					Depreciation Calculation</li>
			</ol>
		</nav>
	</div>
	<div>
		<table id="datatableaa" class="display compact nowrap"
			style="width: 100%">
			<caption>Calculated Depreciation Detail</caption>
			<thead>
				<tr>
					<th>Itemcode</th>
					<th>Fiscal Date</th>
					<th>Purchase Date</th>
					<th>Depreciation Rate</th>
					<th>Amount</th>
					<th>This Yr. Depreciation Amount</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${depreciation }" var="dep">
			<tr>
				<td>${dep.itemcode }</td>
				<td>${dep.fiscaldate }</td>
				<td>${dep.purchasedateen }</td>
				<td>${dep.depreciationrate }</td>
				<td>${dep.rate }</td>
				<td>${dep.thisyrdepamt }</td>
				</tr>
				</c:forEach>
			</tbody>
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
$("#datatableaa").DataTable();
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		
	</script>
</body>
</head>
</html>
