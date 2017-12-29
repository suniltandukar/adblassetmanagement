<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.UserDaoImpl'%>
<%@page import='com.adbl.dao.UserDao'%>
<%@page import='com.adbl.daoimpl.TransferDaoImpl'%>
<%@page import='com.adbl.dao.TransferDao'%>
<jsp:include page="/includefile"></jsp:include>
<%UserDao i=new UserDaoImpl(); %>
<%ResultSet role=(ResultSet)i.getroles(); %>
<%ResultSet existinguser=(ResultSet)i.getexistingusers();

ResultSet userdetail=(ResultSet) session.getAttribute("userdetail");
TransferDao tdao=new TransferDaoImpl(userdetail.getString("branchdb"));
ResultSet branchname=(ResultSet) tdao.getbranchdetails(); %>
<html>
<head>
<style>
label{
color:#808080}
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
    		<div class="col-md-5">
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
                                       <h5>Role</h5> 
                                       <select name="roleid" form="form" class="form-control" >
									<%if((request.getAttribute("update"))==null){ %>
									 	<option value="">Select Role</option>
                                       	<%while(role.next()){%>
                                      	<option value="<%=role.getString("roleid")%>"><%=role.getString("roledescription") %></option>
                                      	<%}} else{  %>
									  	<option value="${roleid }" selected="selected">${roledescription }</option>
                                       		<%while(role.next()){%>
                                       	<option value="<%=role.getString("roleid")%>"><%=role.getString("roledescription") %></option>
                                       		  	<%} }%>
                                       </select>
                                   	</td> 
								</tr>
										<tr>
									
                                   	<td>
                                       <h5>Branch Name</h5><span class="staffcheck"></span>
                                       <select name="usercid" class="form-control"  form="form">
                                       <%if((request.getAttribute("update"))==null){ %>
                                       <option value="">Select Branch Name</option>
                                       <option  value="<%=branchname.getString("cid")%>"><%=branchname.getString("name")%> </option>
                                       <%while(branchname.next()){ %>
                                       <option  value="<%=branchname.getString("cid")%>"><%=branchname.getString("name")%> </option>
                                      
                                       <%} } else{ %>
                                       <option value="${branchdbname }" selected>${branchname }</option>
                                       <%while(branchname.next()){ %>
                                        <option  value="<%=branchname.getString("cid")%>"><%=branchname.getString("name")%> </option>
                                      <%}} %>
                                       </select>
                                   	</td>
								</tr>
								
							</tbody>
						</table> 
						<table>
							<caption>Check User Roles</caption>
							<tr>
							<tr>
										<c:set var="givenrole" value="${givenrole }" />
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="view"
												name="role" value="#nav1"
												<c:if test="${fn:contains(givenrole,'#nav1')}"> checked="checked"</c:if>>
												View Inventory &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   id="add" data-toggle="toggle" data-size="small" 
												name="role" value="#nav2"
												<c:if test="${fn:contains(givenrole,'#nav2')}"> checked="checked"</c:if>>
												Add Inventory&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>

									</tr>
									<tr>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="add"
												name="role" value="#nav3"
												<c:if test="${fn:contains(givenrole,'#nav3')}"> checked="checked"</c:if>>
												Edit Inventory</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"  
												data-toggle="toggle" data-size="small"  id="staff" name="role"
												value="#nav1,#nav2,#nav3,#nav4,#nav5,#nav6,#nav7,#nav8,#nav9,#nav10">

												Staff(all)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									</tr>
									<tr>

										<td><label><input type="checkbox" id="admin" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  
												name="role"
												value="#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove, #pendingtransfer, #transferhistory"
												<c:if test="${givenrole eq '#nav1, #nav2, #nav3, #nav4, #nav5, #nav6, #nav7, #nav8, #nav9, #nav10, #nav11, #nav12, #nav13, #nav14, #change, #remove, #pendingtransfer, #transferhistory'}"> checked="checked"</c:if>>Admin(all)</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="transfer"
												name="role" value="#transfer" 
												<c:if test="${fn:contains(givenrole,'#transfer')}"> checked="checked"</c:if>> Transfer Items</label></td>
										

									</tr>
									<tr>
									<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="update"
												name="role" value="#nav6"
												<c:if test="${fn:contains(givenrole,'#nav2')}"> checked="checked"</c:if>>Update&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  name="role"
												value="#remove"
												<c:if test="${fn:contains(givenrole,'#remove')}"> checked="checked"</c:if>>Delete</label></td>
										
									</tr>
									<tr>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="createuser"
												name="role" value="#nav10"
												<c:if test="${fn:contains(givenrole,'#nav10')}"> checked="checked"</c:if>>Create
												User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small" data-offstyle="warning" id="deluser"
												name="role" value="#remove">Delete User</label></td>
									</tr>
										<tr>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="createuser"
												name="role" value="#pendingtransfer"
												<c:if test="${fn:contains(givenrole,'#pendingtransfer')}"> checked="checked"</c:if>>Pending
												Transfers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
										<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small"  id="createuser"
												name="role" value="#transferhistory"
												<c:if test="${fn:contains(givenrole,'#transferhistory')}"> checked="checked"</c:if>>Transfer History
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
									</tr>
									
								<!-- 	<tr>
									<td><label><input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small" data-offstyle="warning" 
												name="branch" value="1" required>Head Office</label></td>
											<td><label>	<input type="checkbox" data-onstyle="success" data-offstyle="danger"   data-toggle="toggle" data-size="small" data-offstyle="warning" 
												name="branch" value="2" required>Kalimati</label></td>
											
									</tr> -->
								
									<tr>
										<td>Effective Date: <input type="text" name="edate" form="form" id="Date1"
                                                placeholder="YYYY-MM-DD" value="${edate }"></td>
										<td>End Date: <input type="text" name="enddate" form="form" id="Date2"
                                                placeholder="YYYY-MM-DD" value="${enddate }"></td>
                                                </tr>
						</table>
						<br>
						<input type="submit" name="button"  value="submit" class="btn btn-primary submitbtn" onclick="return OnButton1()" >
					
					<input type="submit" name="updatebtn" class="updatebtn btn btn-primary" value="update" onclick="return OnButton2()" >
					
					   			</form>	
					   			
    				</div>
    			</div>
    		</div>
    		<div class="col-md-7">
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
									<th id="remove" >Actions</th><!-- 
									<th><i class="fa fa-cog" aria-hidden="true"></i></th> -->
								</tr>
							</thead>
							<tbody>
							<%int sno=1;while(existinguser.next()){ %>
							<tr>
							<td><%=sno %></td>
							<td><%=existinguser.getString("username") %></td>
							<td><%=existinguser.getString("staffcode") %></td>
							<td id="remove" ><a href="edituser.click?id=<%=existinguser.getString("userid")%>"   ><i class="fa fa-pencil-square-o"></i></a>
						
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
          <button type="button" id="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>

<script>
$(document).ready(function()
        {
	
        	$("#Date1,#Date2").keyup(function(){
                if ($(this).val().length == 4){
                    $(this).val($(this).val() + "-");
                }else if ($(this).val().length == 7){
                    $(this).val($(this).val() + "-");
                }
            });
	
	$('#button').click(function(){
		   $('input[type="text"]').val('');
		});
	var $others = $('input[name="role"]').not('#admin')
	$('#admin').change(function () {
	    if (this.checked) {
	    	$others.bootstrapToggle('off')
	    }
	});
	$others.change(function () {
	    if (this.checked) {
	    	$('#admin').bootstrapToggle('off') 
	    }
	})
	
	$('#table').DataTable({
	    "iDisplayLength": 50
	  } );
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