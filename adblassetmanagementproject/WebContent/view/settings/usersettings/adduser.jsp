<html>
<head>
<link rel="import" href="new.jsp">
<style>
.green{
color:green}
.red{
color:red}
</style>
</head>
<body class="background">
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>

<%ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");%>
<%InventoryDao i=new InventoryDaoImpl(branchdb.getString("branchdb")); %>
<%ResultSet role=(ResultSet)i.getroles(); %>
<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="page">Settings</li>
			    <li class="breadcrumb-item active" aria-current="page">User Settings</li>
			    <li class="breadcrumb-item active" aria-current="page">Add Users</li>
			  </ol>
			</nav>
		</div>

<div class="panel panel-default" style="width: 100%; margin: auto;">
    <div class="panel-body">
    	<div class="row">
    		<div class="col-md-4">
    			<div class="panel panel-default">
    				<div class="panel-heading">
    					<strong>Add User</strong>
    				</div>
    				<div class="panel-body">
    				<form method="post" action="adduseraction.add" id="form">
						<table class="table">
							<tbody>
								<tr>
									<td>
                                       <h5>Username</h5><span class="usercheck"></span> 
                                       <input type="text" name="username" class="form-control datepicker username"  form="form" value="">
                                   		
                                   	</td>
                                   
								</tr>
								<tr>
									<td>
                                       <h5>Staffcode</h5><span class="staffcheck"></span>
                                       <input type="text" name="staffcode" class="form-control datepicker staffcode"  form="form" value="">
                                   	</td>
                                   
								</tr>
								
								<tr>
									<td>
                                       <h5>Role</h5> 
                                       <select name="roleid" form="form" class="form-control" >
                                       <%while(role.next()){%>
                                       	<option value="<%=role.getString("roleid")%>"><%=role.getString("roledescription") %></option>
                                       	<%} %>
                                       </select>
                                   	</td>
								</tr>
							</tbody>
						</table> 
						<input type="submit" name="button" value="submit" class="btn btn-primary" >
					
					   			</form>	
    				</div>
    			</div>
    		</div>
    		<div class="col-md-8">
    			<div class="panel panel-default">
    				<div class="panel-heading">
    					<strong>Existing Users</strong>
    				</div>
    				<div class="panel-body">
    				
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<script>
$(document).ready(function()
        {
	 $(".username").blur(function()
		        {
		 var id=$(this).val();
		 var dataString = 'id='+ id;
		 $.ajax
	        ({
	        type: "POST",
	        url: "checkusername.check",
	        data: dataString,
	        cache: false,
	        success: function(html)
	        {
	        $(".usercheck").html(html);
	        } 
	        });
		 
	});
	 $(".staffcode").blur(function()
		        {
		 var id=$(this).val();
		 var dataString = 'id='+ id;
		 $.ajax
	        ({
	        type: "POST",
	        url: "checkstaffcode.check",
	        data: dataString,
	        cache: false,
	        success: function(html)
	        {
	        $(".staffcheck").html(html);
	        } 
	        });
		 
	});
});
</script>
</body>

</html>