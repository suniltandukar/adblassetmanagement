<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="/includefile"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Branch Select</title>
</head>
<body>

<div class="panel panel-default">
	<div class="panel-heading">
		<form method="post" action="getbranchview.click" id="form">
			   <h5><strong>Branch Select</strong></h5> 
                                       <select name="branch" form="form" class="form-control selectpicker" >
									
									  	<option value="1" selected="selected">Head Office</option>
                                       		
                                       	<option value="2">Kalimati</option>
                                       		
                                       </select>
                                       <br>
                                       <br>
                                       <input type="submit" value="change" class="btn btn-info form-control">
		</form>
	</div>
</div>

</body>
</html>