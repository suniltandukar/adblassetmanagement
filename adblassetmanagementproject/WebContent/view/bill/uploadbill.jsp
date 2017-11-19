<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="import" href="new.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
%>
</head>
<body>
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
    				<form method="POST" action="bill.upload"  enctype="multipart/form-data">
    				
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
                                       <input type="text" name="billno" class="form-control"  >
                                   	</td>
                                   	<td>
                                       <h5>Company Name</h5> 
                                       <input type="text" name="companyname" class="form-control">
                                   	</td>
                                   	
								</tr>
								
								<tr>
									<td>
                                       <h5>Input Bill Date(B.S.)</h5><span class="staffcheck"></span>
                                       <input type="text" name="billdate" class="form-control"   value="">
                                   	</td>
                                   	<td>
                                       <h5>Input Bill Date(A.D.)</h5><span class="staffcheck"></span>
                                       <input type="text" name="billdateen" class="form-control"   value="">
                                   	</td>
                                   
								</tr>
								<tr>
									<td>
                                       <h5>Attach Bill Image</h5> 
                                       <input type="file" name="billimagename" class="form-control"   value="">
                                   	</td> 
                                   	</tr>
							</tbody>
						</table> 
					   </form>	
					   			
    				</div>
    			</div>
    		
    		

</body>
</html>