<jsp:include page="/includefile"></jsp:include>
<html>
<head>
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
    					<strong>User Detail</strong>
    				</div>
    				<div class="panel-body">
    				<form method="post"  id="form" name="Form1">
						<table class="table">
							<tbody>
								<tr>
								
									<td>
                                   <h5>Username</h5><span class="usercheck"></span>   
                                       <input type="hidden" form="form" value="<%=request.getParameter("id")%>" name="useridforupdate">
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
									<label><input type="checkbox" id="view" name="role" value="#nav1"> View Inventory</label><br>
  									<label><input type="checkbox" id="add" name="role" value="#nav2"> Add Inventory</label><br>
 									<label> <input type="checkbox" id="edit" name="role" value="#nav3"> Edit Inventory</label><br>
 									 <label><input type="checkbox" id="transfer" name="role"  value="#nav4"> Transfer Items</label><br>
 									 
 									 </td>
 									 <td>
									<label><input type="checkbox" id="staff"  name="role" value="#nav1,#nav2,#nav3,#nav4,#nav5,#nav6,#nav7,#nav8,#nav9,#nav10"> Staff(all)</label><br>
  									<label><input type="checkbox"  id="admin" name="role" value="#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14"> Admin(all)</label><br>
 									 <label><input type="checkbox" id="update" name="role" value="#nav6"> Update</label><br>
 									 <label><input type="checkbox" id="delete" name="role" value="#nav6"> Delete</label><br>
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
							<td><%=existinguser.getString("staffcode") %></td>
							<td><a href="edituser.click?id=<%=existinguser.getString("userid")%>"   ><i class="fa fa-pencil-square-o"></i></a>
						
							<a class="confirmbtn" href="deleteuser.click?id=<%=existinguser.getString("userid")%>"   ><i  class="fa fa-trash" id="deletebtn" aria-hidden="true" style="color:red"></i></a></td>
							
							</tr>
								<%sno++;} %>
							
							
							</tbody>						</table>
    				
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog" tabindex="-1">
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
	
	var $others = $('input[name="role"]').not('#admin')
	$('#admin').change(function () {
	    if (this.checked) {
	        $others.prop('checked', false)
	    }
	});
	$others.change(function () {
	    if (this.checked) {
	        $('#admin').prop('checked', false)
	    }
	})
	
	$('#table').DataTable();
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
	 $( ".confirmbtn" ).click(function( event ) {
		 return confirm("CONFIRM?");
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
	        var user=$('.staffcheck').html().val();
	        if(user="Unavailable!"){
	        	alert('hello');
	        }
	        } 
	        });
		 
	});
});
</script>
<script >

function OnButton1()
{
    document.Form1.action = "adduseraction.add"
    document.Form1.submit();            
    return true;
}

function OnButton2()
{
    document.Form1.action = "updateuser.add"
   
    document.Form1.submit();         
    return true;
}

</script>
</body>

</html>