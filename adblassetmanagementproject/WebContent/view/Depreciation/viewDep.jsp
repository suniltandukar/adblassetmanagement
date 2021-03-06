<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includefile"></jsp:include>
<jsp:include page="depJson.jsp"></jsp:include>
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
		<table id="datatableaa"
			class="table jambo_table table-striped table-bordered resulttable display nowrap"
			style="font-size: 100%;">
			<thead>
				<tr>
					<th>S.NO</th>
					<th>Item Code</th>
					<th>Item Name</th>
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

</body>
</head>
</html>
