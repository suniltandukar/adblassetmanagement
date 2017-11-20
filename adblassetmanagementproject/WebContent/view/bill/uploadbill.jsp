<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="import" href="new.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<div class="panel panel-default" style="width:60%;margin:auto;">
	
    				<div class="panel-heading">
    					<strong>Fill Bill Detail</strong>
    				</div>
    				<div class="panel-body">
    					<form method="post" action="billupload.upload" id="form" enctype="multipart/form-data">	
						<table class="table" >
							<tbody>
								<tr>
									<td><input type="submit"  value="submit" class="btn btn-primary" form="form" ></td>
								</tr>
								<tr>
									<td>
                                       <h5>Input Bill NO.</h5>
                                       <input type="text" name="billno" class="form-control"  value="" form="form">
                                   	</td>
                                   	<td>
                                       <h5>Company Name</h5> 
                                       <input type="text" name="companyname" class="form-control"   value="" form="form">
                                   	</td>
								</tr>
								
								<tr>
									<td>
                                       <h5>Input Bill Date(B.S.)</h5>
                                       <input type="text" name="billdate" class="form-control"   value="" form="form">
                                   	</td>
                                   	<td>
                                       <h5>Input Bill Date(A.D.)</h5>
                                       <input type="text" name="billdateen" class="form-control"   value="" form="form">
                                   	</td>
								</tr>
								
								<tr>
									<td>
                                       <h5>Attach Bill Image</h5> 
                                       <input type="file" name="billimage" class="form-control"   value="" form="form">
                                   	</td> 
                                 </tr>
							</tbody>
						</table> 
						</form>
    				</div>
    			</div>
</body>
</html>