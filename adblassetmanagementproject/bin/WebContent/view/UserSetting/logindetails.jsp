
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="import" href="new.jsp">

<jsp:include page="/includefile"></jsp:include>
<html>
<head>

</head>
<div class="breadcrumb-line">
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
<div class="panel panel-default" style="width: 100%; margin: auto;">

	<div class="panel-body">
		<div class="panel panel-default" style="width: 100%;">
			<div class="panel-heading count">
				<h5>
					<strong>Inventory Item Details</strong>
					
				</h5>
			</div>
				<div class="panel-body">
				
        <table id="table" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th></th>
							<th>User Name</th>
							<th>Ip Address</th>
							<th>Login</th>
							<th>Action</th>
							
							
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="list">
											
					<tr class="tablerows">
						<td></td>
						<td>${list.username }</td>
						<td>${list.ipaddress }</td>
						<td>${list.login }</td>
						<td>${list.action }</td>
					</tr>
				
					</c:forEach>
						
					
					</tbody>
				</table>
			</div>
		</div>
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
<script>
function filterGlobal () {
    $('#example').DataTable().search(
        $('#global_filter').val(),
        $('#global_regex').prop('checked'),
        $('#global_smart').prop('checked')
        
    ).draw();
}
 

function filterColumn ( i ) {
   $('#example').DataTable().column( i ).search(
       $('#col'+i+'_filter').val(),
       $('#col'+i+'_regex').prop('checked'),
       $('#col'+i+'_smart').prop('checked')
   ).draw();
}

$(document).ready(function() {
    var t = $('#table').DataTable( {
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 3, 'desc' ]]
    } );
 
    t.on( 'order.dt search.dt', function () {
        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            var c=cell.innerHTML = i+1;
            $('.count').val(c);
        } );
    } ).draw();
	
    $('select.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );

    $('select.column_filter').on( 'keyup click', function () {
        filterColumn( $(this).parents('tr').attr('data-column') );
 	  
    } );
    
 } );
 

</script>




</html>
