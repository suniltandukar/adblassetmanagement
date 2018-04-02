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
	<table id="datatableaa"
		class="table jambo_table table-striped table-bordered resulttable display nowrap"
		style="font-size: 100%;">
		<thead>
			<tr>
				<th>Itemcode</th>
				<th>Amount</th>
				<th>Dep upto Last Fiscal Year</th>
				<th>Dep Current Year</th>
				<th>Total Dep</th>
				<th>Balance Amount</th>
			</tr>
		</thead>
		
	</table>
</div>
<div class="modal fade bs-example-modal-lg" id="detailModal"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-body viewDetailModal"></div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	 $('#datatableaa').DataTable( {
	        
	        "ajax": "viewDep.adbl",
	        "columns":[
	        	{  "targets": 0,
	        	    "data": "itemcode",
	        	    "render": function ( data, type, row, meta ) {
	        	      return '<a href="editinventory.click?id='+data+'">'+data+'</a>';
	        	    }
	        	},
	        	{"data":"rate"},
	        	{"data":"lastyrdep"},
	        	
	        	{"data":"curyrdep"},
	        	
	        	{"data":"totaldep"},
	        	{"data":"balance"},
	        	 
	        ]
	    } );
} );

</script>
		</body>
	</head>
</html>
