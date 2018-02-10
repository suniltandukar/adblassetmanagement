<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
    <%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
InventoryDao i=new InventoryDaoImpl();
ResultSet companylist1=(ResultSet) i.getcompanylist(); %>
<jsp:include page="/includefile"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home"
				aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Bill</li>
			<li class="breadcrumb-item active" aria-current="page">Upload
				Bill</li>
		</ol>
		</nav>
	</div>
	<div class="panel">

		<div class="panel-heading">
			<strong>Fill Bill Detail</strong>
		</div>
		<div class="panel-body">
			<form method="POST" action="billupdate.add">

				<table class="table">
					<tbody>
						<tr>
							<td><input type="submit" name="button" value="Update"
								class="btn btn-primary"></td>
						</tr>

						<tr>
							<td>
							<input type="hidden" name="billid"
								class="form-control" value="${billdata.billid}"required>
								<h5>Input Bill NO.</h5> <input type="text" name="billno"
								class="form-control" value="${billdata.billno}"required>
							</td>
							<td>
								  <h5>Company Name</h5> <select class="form-control"
                                            name="companyid"  required>
                                                <option value="${billdata.companyid}" selected>${billdata.companyname}</option>
                                                <%while(companylist1.next()){%>
                                                	<option value="<%=companylist1.getString("companyid") %>"><%=companylist1.getString("companyname") %></option>
                                                <%}%>
                                        </select>
							</td>

						</tr>

						<tr>
							<td>
								<h5>Input Bill Date(B.S.)</h5>
								<span class="staffcheck"></span> <input type="text"
								name="billdate" class="form-control" id="nepaliDate1" value="${billdata.billdate}"
								required>
							</td>
							<td>
								<h5>Input Bill Date(A.D.)</h5>
								<span class="staffcheck"></span> <input type="text"
								name="billdateen" class="form-control" id="englishDate1"
								value="${billdata.billdateen}" required>
							</td>

						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>