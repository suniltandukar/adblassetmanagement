  <%@page import="java.sql.*" %>
  <%@page import="com.adbl.daoimpl.UserDaoImpl" %>
   <%@page import="com.adbl.dao.UserDao" %>
<%ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
UserDao u=new UserDaoImpl();
ResultSet username=u.selectusernames();%>
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
<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="page">Transfer/Issue</li>
			    <li class="breadcrumb-item active" aria-current="page">Issue Items</li>
			  </ol>
			</nav>
		</div>
<div class="row">
	<div class="col-md-7">
		<div class="panel panel-default">

    				<div class="panel-heading">
    					<strong>Fill Issue Details</strong>

    				</div>
    				<div class="panel-body">
    				<form method="post" action="issueitem.add" id="form">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<input type="submit" name="button"  value="submit" class="btn btn-primary submitbtn"  >
									</td>
								</tr>
								<tr>
                                   <td>
										<input type="hidden" name="branchdb" value="<%=userdetail.getString("branchdb")%>">
                                       <h5>Issued to (username):</h5><span class="staffcheck"></span>
                                       <select name="issuedto" class="form-control"  form="form" required>
                                       <%while(username.next()){ %>
                                       <option value="<%=username.getString("username")%>"><%=username.getString("username")%></option>
                                       <%} %>
                                       </select>
                                   	</td>
								</tr>
								
								<tr>
									<td>
                                       <h5>Issued Date (B.S):</h5> 
                                       <input type="text" name="issueddate" class="form-control"  form="form" value="" id="nepaliDate1" required>
                                   	</td>
                                   	<td>
                                       <h5>Issued Date (A.D):</h5> 
                                       <input type="text" name="issueddateen" class="form-control"  form="form" value="" id="englishDate1" required>
                                   	</td> 
								</tr>
							</tbody>
						</table> 
					   </form>	
					   			
    				</div>
    			</div>
    		</div>
    		<div class="col-md-5">
    			<div class="panel panel-default">
    				<div class="panel-heading">

    					<strong>Fill Item Codes</strong>

    				</div>
    				<div class="panel-body">
						<table class="table" id="table">
							<tbody>
								<tr>
									<td>
										<input type="submit" name="button"  value="+ Add Item" class="btn btn-primary" onclick="myFunction()">
									</td>
								</tr>
								<tr>
									<td>
                                       <h5>Item Code:</h5> 
                                       <input type="text" name="itemcode" class="form-control"  form="form" value=""required>
                                   	</td> 
								</tr>
							</tbody>
						</table> 
					   </form>	
					   			
    				</div>
    			</div>
    		</div>
    	</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p><b>${msg }</b></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
    	<script src="assets/js/dateConverter.js"></script>
   <script>
function myFunction() {
    var table = document.getElementById("table");
    var row = table.insertRow(2);
    var cell1 = row.insertCell(0);
    cell1.innerHTML = "<a><i class='fa fa-times' aria-hidden='true' style='color:red;'></i></a><input type='text' name='itemcode' class='form-control'  form='form' required>";
}
$('table').on('click','tr a',function(e){
    e.preventDefault();
   $(this).parents('tr').remove();
 });
<%if(request.getAttribute("msg")!=null){%>
$('#myModal').modal('show');
<%}%>
$('#form').submit(function(){
	return confirm('Confirm?');
});
</script>
  </body>
  </html>