<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
InventoryDao i=new InventoryDaoImpl(branchdb.getString("branchdb"));
ResultSet companylist1=(ResultSet) i.getcompanylist();
%>
</head>
<body>
<jsp:include page="/includefile"></jsp:include> 
<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="page">Bill</li>
			    <li class="breadcrumb-item active" aria-current="page">Upload Bill</li>
			  </ol>
			</nav>
		</div>
<div class="panel">
	
    				<div class="panel-heading">
    					<strong>Fill Bill Detail</strong>
    				</div>
    				<div class="panel-body">
    				<form method="POST" action="bill.upload" class="confirm" enctype="multipart/form-data">
    				
    				<input type="hidden" name="branchdb" value="<%=branchdb.getString("branchdb")%>">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<input type="submit" name="button"  value="submit" class="btn btn-primary"  >
									</td>
								</tr>
								
								<tr>
									<td>
                                       <h5>Input Bill NO.</h5>
                                       <input type="text" name="billno" class="form-control"  required>
                                   	</td>
                                   	<td>
                                      <h5>Company Name</h5> <select class="form-control"
                                            name="companyid"  required>
                                                <option value="" selected>Select company</option>
                                                <%while(companylist1.next()){%>
                                                	<option value="<%=companylist1.getString("companyid") %>"><%=companylist1.getString("companyname") %></option>
                                                <%}%>
                                        </select>
                                   	</td>
                                   	
								</tr>
								
								<tr>
									<td>
                                       <h5>Input Bill Date(B.S.)</h5><span class="staffcheck"></span>
                                       <input type="text" name="billdate" class="form-control" id="nepaliDate1"  value="" required>
                                   	</td>
                                   	<td>
                                       <h5>Input Bill Date(A.D.)</h5><span class="staffcheck"></span>
                                       <input type="text" name="billdateen" class="form-control" id="englishDate1"  value="" required>
                                   	</td>
                                   
								</tr>
								<tr>
									<td>
                                       <h5>Attach Bill Image</h5> 
                                       <input type="file" name="billimagename" class="form-control"   value="" required>
									</td> 
                                   	</tr>
							</tbody>
						</table> 
					   </form>	
					   			
    				</div>
    			</div>
    			<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p><b>${msg }</b></p>
          Bill No.:: ${billno }<br>
          Company Name:: ${companyname }<br>
          Image Name:: ${billname }<br>
          
          <a href="view/uploadedbills/${billname }" target="_blank">View</a>
         
          
         
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
    		
    	
    	

</body>
<script src="assets/js/dateConverter.js"></script>
<script>
$(document).ready(function()
        {
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	   $('.confirm').submit(function(){
		  return confirm('sure?'); 
	   });
        });
</script>	


</html>