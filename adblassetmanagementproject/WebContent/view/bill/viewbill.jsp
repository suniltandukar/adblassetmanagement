<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.OtherActionDAOImpl'%>
<%@page import='com.adbl.dao.OtherActionDAO'%>
<%ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
OtherActionDAO ac=new OtherActionDAOImpl();
ResultSet bill=(ResultSet) ac.viewbillDao(branchdb.getString("branchdb")); %>
<html>
<head>
<link rel="import" href="new.jsp">
</head>
<body>
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Bill</li>
				<li class="breadcrumb-item active" aria-current="page">View
					Bill</li>
			</ol>
		</nav>

		<div class="panel panel-default" style="width: 100%; margin: auto;">

			<div class="panel-body">
				<div class="panel panel-default" style="width: 100%;">
					<div class="panel-heading">
						<h6>
							<strong>Inventory Item Details</strong>
						</h6>
					</div>
					<div class="panel-body">
						<table id="example" class="table table-striped table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Bill No.</th>
									<th>Bill Date(B.S.)</th>
									<th>Bill Date(A.D.)</th>
									<th>Company Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%while(bill.next()){%>
								<tr>
									<td><%=bill.getString("billno") %></td>
									<td><%=bill.getString("billdate") %></td>
									<td><%=bill.getString("billdateen") %></td>
									<td><%=bill.getString("companyname") %></td>

									<td><a href="#" data-toggle="modal"
										data-caption="test caption text"
										data-image="view/uploadedbills/<%=bill.getString("billimageoriginalname") %>"
										data-target="#trslphotos"><img
											src="view/uploadedbills/<%=bill.getString("billimageoriginalname") %>"
											alt="recent photo" width="0px"><i class="fa fa-eye"></i></a>&nbsp;
										&nbsp; &nbsp;<a class="confirmbtn"
										href="deletebill.del?path=<%=bill.getString("billimagepath") %>&id=<%=bill.getString("billid")%>&filename=<%=bill.getString("billimageoriginalname") %>">
											<i class="fa fa-trash-o"></i>
									</a> &nbsp; &nbsp; &nbsp; <a
										href="editbill.click?id=<%=bill.getString("billid") %>"><i
											class="fa fa-pencil-square-o"></i></a></td>


									<%} %>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="trslphotos" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<img src="" class="img-responsive ">
				</div>
				<div class="modal-footer">
					<a href="" class="downloadbtn" download><button
							class="btn btn-success">Download</button></a>
				</div>
			</div>
		</div>

	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<p>
						<b>${msg }</b>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
$(document).ready(function()
        {
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	$('#example').DataTable();
	$('#trslphotos').on('shown.bs.modal', function (a, b,c) {
		 var clickedImageUrl = a.relatedTarget.childNodes[0].src;
		  displayPhotos(clickedImageUrl);
		})
		function displayPhotos(url) {
		 $('.modal-body img').attr('src',url);
		 $('.downloadbtn').attr('href',url);
		 
		 $('#trslphotos').modal();
		}
	$('.confirmbtn').click(function(){
		 return confirm('CONFIRM?');
	});
 });


</script>
	
</body>

</html>
