<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/includefile"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Branch Select</title>
</head>
<body class="background">
	<%String[] branches=(String[])request.getAttribute("branchesAllowed"); %>
	<div class="col-md-4 col-xs-4">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					<strong>SWITCH BRANCH</strong>
				</h2>
				
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="switchbranc.click">
				<h5>
					<strong>Branch Select</strong>
				</h5>
				<select name="branch" class="form-control selectpicker">

					<%for(int i=0;i<branches.length;i++){ %>
					<option value="<%=branches[i] %>" selected="selected"><%=branches[i] %></option>
					<%} %>
				</select>
				<%--    <h5>Branch Name</h5><span class="staffcheck"></span>
                                       <select name="usercid" class="form-control"  form="form">
                                     
                                       <option value="">Select Branch Name</option>
                                       <%while(branchname.next()){ %>
                                       <option  value="<%=branchname.getString("cid")%>"><%=branchname.getString("name")%> </option>
                                      
                                       <%} %>
                                       </select> --%>

				<br> <br> <input type="submit" value="change"
					class="btn btn-info form-control">
			</form>
			</div>
		</div>
	</div>
</body>
</html>