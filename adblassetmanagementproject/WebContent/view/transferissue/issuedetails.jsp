<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.TransferDaoImpl'%>
<%@page import='com.adbl.dao.TransferDao'%>
<%ResultSet userdetail=(ResultSet) session.getAttribute("userdetail");
TransferDao trans=new TransferDaoImpl(userdetail.getString("branchdb"));
ResultSet issue=trans.getissuedetails(); %>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
</head>
<body>
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Issue</li>
				<li class="breadcrumb-item active" aria-current="page">Issue Details</li>
			</ol>
		</nav>
		</div>

		<div class="panel panel-default" style="width: 100%; margin: auto;">

			<div class="panel-body">
				<div class="panel panel-default" style="width: 100%;">
					<div class="panel-heading">
						<h6>
							<strong>Issue Details</strong>
						</h6>
					</div>
					<div class="panel-body">
						<table id="example" class="table table-striped table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Itemcode</th>
									<th>Issued By</th>
									<th>Issued To</th>
									<th>Issue date(B.S.)</th>
									<th>Issue date(A.D.)</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<%while(issue.next()){%>
								<tr>
									<td><%=issue.getString("issueitemcode") %></td>
									<td><%=issue.getString("issuedby") %></td>
									<td><%=issue.getString("issuedto") %></td>
									<td><%=issue.getString("issueddate") %></td>
									<td><%=issue.getString("issueddateen") %></td>
									<td><%=issue.getString("statusdescription") %></td>
									

									

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
