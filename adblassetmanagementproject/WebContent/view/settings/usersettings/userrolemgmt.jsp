<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.adbl.dao.InventoryDao" %>
<%@page import="com.adbl.daoimpl.InventoryDaoImpl" %>
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.UserDaoImpl'%>
<%@page import='com.adbl.dao.UserDao'%>
<%UserDao i=new UserDaoImpl(); %>
<%ResultSet rolename1=(ResultSet)i.getroles(); %>
<%ResultSet rolename=(ResultSet)i.getroles(); %>
<html>
	<head>
		<link rel="import" href="new.jsp">
	</head>
	<body>
		<div class="background">
		<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			      <li class="breadcrumb-item active" aria-current="page">Settings</li>
			    <li class="breadcrumb-item active" aria-current="page">User Settings</li>
			    <li class="breadcrumb-item active" aria-current="page">User Role Management</li>
			  </ol>
			</nav>
		</div>
		<br>
		<div class="row ">
			<div class="col-sm-4">
				<form method="post" action="updateuserrole.add" id="form"></form>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title"><strong>Fill Role Form</strong></h4>
					</div>
					<div class="panel-body">
						<h5>Role Name*</h5>
					   	<select class="form-control" name="roleid" form="form" required>
					   		<option value="" selected>Select role name</option>
					   	<%while(rolename1.next()){ %>
					   		<option value="<%=rolename1.getString("roleid") %>"><%=rolename1.getString("rolename") %></option>
					   	<%} %>	
					   	</select>
					   	<br>
						<h5>Role Description*</h5>
					   	<input type="text" class="form-control" name="roledescription" form="form" required>
					   	<br>
					   	<button type="submit" class="btn btn-success" form="form"><i class="fa fa-check"></i> Save</button>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="panel panel-default" style="margin-top:15px;">
					<div class="panel panel-heading">
						<h4 class="panel-title"><strong>ROLE LIST</strong></h4>
					</div>
					<div class="panel-body">
						<table class="table display" id="table">
							<thead>
								<tr>
									<th>S No.</th>
									<th>Role Name</th>
									<th>Role Description</th>
									<th><i class="fa fa-cog" aria-hidden="true"></i></th>
								</tr>
							</thead>
							<tbody>
							<%int sno=1; while (rolename.next()){ %>
								<tr>
									<td><%=sno %></td>
									<td><%=rolename.getString("rolename") %></td>
									<td><%=rolename.getString("roledescription") %></td>
									<td><a href="userrole.del?id=<%=rolename.getString("roleid") %>" class="delete"><i class="fa fa-trash" id="deletebtn" aria-hidden="true" style="color:red;"></i></td>
								</tr>
							<%sno++;}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		
		</div>
		</div>
		<div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog modal-sm">
		      <div class="modal-content">
		        <div class="modal-body">
		          <p>${msg}</p>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		</div>
		<script>
		$(document).ready(function() {
			<%if(request.getAttribute("msg")!=null){%>
			   $('#myModal').modal('show');
			   <%}%>
			 $('#table').DataTable( {
			        scrollY:        '50vh',
			        scrollCollapse: true,
			        paging:         false
			    } );
		} );
		 $( "#deletebtn" ).click(function( event ) {
			 return confirm("CONFIRM Deletion?");
			});
		$('#form').submit(function() {
		    return confirm('CONFIRM SAVE?'); 
		});
		</script>
										
	</body>
</html>