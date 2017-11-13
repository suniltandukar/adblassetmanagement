<html>
<head>
<link rel="import" href="new.jsp">
<style>
.green{
color:green}
.red{
color:red}

	.updatebtn{
	display:none;}
	<%if(request.getAttribute("updatebtn")!=null){%>
.updatebtn{
display:block;}
.submitbtn{
display:none;}
<%} %>
	
	</style>
</head>
<body class="background">
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.UserDaoImpl'%>
<%@page import='com.adbl.dao.UserDao'%>
<%UserDao i=new UserDaoImpl(); %>
<%ResultSet role=(ResultSet)i.getroles(); %>
<%ResultSet existinguser=(ResultSet)i.getexistingusers(); %>

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
    				<form method="post"  id="form" name="Form1">
						<table class="table">
							<tbody>
								<tr>
									<td>
                                       <h5>Username</h5><span class="usercheck"></span> 
                                       <input type="text" name="username" class="form-control datepicker username"  form="form" value="${username }">
                                   		
                                   	</td>
                                   
								</tr>
								<tr>
									<td>
                                       <h5>Staffcode</h5><span class="staffcheck"></span>
                                       <input type="text" name="staffcode" class="form-control datepicker staffcode"  form="form" value="${staffcode }">
                                   	</td>
                                   
								</tr>
								
								<tr>
									<td>
                                       <h5>Role</h5> 
                                       <select name="roleid" form="form" class="form-control" >
                               
									<%if((request.getAttribute("update"))!=null){ %>
									  	<option value="${roleid }" selected="selected">${roledescription }</option>
									  	
                                       		<%while(role.next()){%>
                                      
                                       	<option value="<%=role.getString("roleid")%>"><%=role.getString("roledescription") %></option>
                                      
                                       		
                                       	<%}} else{  %>
                                        	<%while(role.next()){%>
                                      
                                       	<option value="<%=role.getString("roleid")%>"><%=role.getString("roledescription") %></option>
                                      
                                     
                                       	<%} }%>
                                       
                                       	
                                       </select>
                                   	</td> 
								</tr>
							</tbody>
						</table> 
						<input type="submit" name="button"  value="submit" class="btn btn-primary submitbtn" onclick="return OnButton1()" >
					
					<input type="submit" name="updatebtn" class="updatebtn btn btn-primary" value="update" onclick="return OnButton2()" >
					
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
    				<table class="table display" id="table">
							<thead>
								<tr>
									<th>S No.</th>
									<th>User Name</th>
									<th>User Number</th>
									<th>Staff Code</th>
									<th>Actions</th><!-- 
									<th><i class="fa fa-cog" aria-hidden="true"></i></th> -->
								</tr>
							</thead>
							<tbody>
							<%int sno=1;while(existinguser.next()){ %>
							
							
							<tr>
							<td><%=sno %></td>
							<td><%=existinguser.getString("username") %></td>
							<td><%=existinguser.getString("userid") %></td>
							<td><%=existinguser.getString("staffcode") %></td>
							<td><a href="edituser.click?id=<%=existinguser.getString("userid")%>"  class="btn btn-primary" value="">Edit</a>
							<a href="deleteuser.click?id=<%=existinguser.getString("userid")%>" class="btn btn-danger" id="deletebtn" value="">Delete</a></td>
							
							</tr>
								<%sno++;} %>
							
							
							</tbody>						</table>
    				
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
        <%String username=request.getParameter("username");
        	String staffcode=request.getParameter("staffcode");
        if(username!=null && staffcode!=null){%>
        	
          <p><b>${msg}</b></p><br>
    		Username:${username }<br>
    		Staffcode:${staffcode }
    	
         <%} %>
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

	$("#edit").click(function(){
		$(".username").val("hello");
		
	})
	
        
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
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
	 $( "#deletebtn" ).click(function( event ) {
		 return confirm("CONFIRM Deletion?");
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
<script >

function OnButton1()
{
    document.Form1.action = "adduseraction.add"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton2()
{
    document.Form1.action = "updateuser.add"
    document.Form1.submit();             // Submit the page
    return true;
}

</script>
</body>

</html>