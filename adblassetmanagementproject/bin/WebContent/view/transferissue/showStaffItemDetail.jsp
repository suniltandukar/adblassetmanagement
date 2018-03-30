<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>

</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Issue
					</li>
				<li class="breadcrumb-item active" aria-current="page">Issued Item</li>
			</ol>
		</nav>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12 ">

		<div class="x_panel">
			<div class="x_title">
				<h4><b>Staff Code: ${staffCode }</b></h4>
			</div>
			<div class="x_content">
				
				<table id="example" class="table jambo_table table-striped table-bordered resulttable"
					style="font-size: 100%;">
				<thead>
					<tr>
						<th>Itemcode</th>
						<th>Issue Id</th>
						<th>Issued By</th>
						<th>Issue Date</th>
						
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.issueitemcode }</td>
							<td>${list.issueid }</td>
							<td>${list.issuedby }</td>
							<td>${list.issueddateen }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
			$('#example').DataTable();
		
			
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
		});
		$('.clickbtn').click(function() {
			return confirm('CONFIRM?');
		});
	</script>
</body>
</html>
