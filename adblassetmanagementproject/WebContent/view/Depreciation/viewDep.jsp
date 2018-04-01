<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includefile"></jsp:include>
<div>
	<table id="datatableaa"
		class="table jambo_table table-striped table-bordered resulttable display nowrap"
		style="font-size: 100%;">
		<thead>
			<tr>
				<th>Itemcode</th>
				<th>Particular</th>
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
	        	{"data":"pid"},
	        	{"data":"memberid"},
	        	{"data":"name"},
	        	
	        	{"data":"gender"},
	        	
	        	{"data":"address"},
	        ]
	    } );
} );

</script>