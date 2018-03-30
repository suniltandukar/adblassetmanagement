<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
<head>
<title></title>
</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">User
					Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Add User
					Group</li>
			</ol>
		</nav>
	</div>
	<form method="post" action="insertusergroup.user" >
	<div class="col-md-4 col-xs-4">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					<strong>New User Group</strong>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				
					<h6>Group Name</h6>

					<input type="text" name="groupname" class="form-control"
						 value=""><br><br>
						
					<input type="submit" value="Save" class="form-control btn btn-success">
				


			</div>
		</div>
	</div>
	<div class="col-md-8 col-xs-8">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					<strong>Select Roles</strong>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<table>
						<tr>
							<td><label><input type="checkbox" id="dashboard"
									name="givenRoles" value="#dashboard" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#dashboard')}"> checked="checked"</c:if>>
									Dashboard &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="member"
									name="givenRoles" value="#member" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#member')}"> checked="checked"</c:if>>
									Member &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="shareholder"
									name="givenRoles" value="#shareholder" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#shareholder')}"> checked="checked"</c:if>>
									Shareholder &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="retailoperation"
									name="givenRoles" value="#retailoperation" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#retailoperation')}"> checked="checked"</c:if>>
									Retail Operations &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							</tr><tr><td><label><input type="checkbox" id="generaltransaction"
									name="givenRoles" value="#generaltransaction" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#generaltransaction')}"> checked="checked"</c:if>>
									General Transaction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="loanmodule"
									name="givenRoles" value="#loanmodule" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#loanmodule')}"> checked="checked"</c:if>>
									Loan Module &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="nonfundbusiness"
									name="givenRoles" value="#nonfundbusiness" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#nonfundbusiness')}"> checked="checked"</c:if>>
									Non-fund Business &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="otherutilities"
									name="givenRoles" value="#otherutilities" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#otherutilities')}"> checked="checked"</c:if>>
									Other Utilities &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							</tr><tr><td><label><input type="checkbox" id="reports"
									name="givenRoles" value="#reports" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#reports')}"> checked="checked"</c:if>>
									Reports &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							<td><label><input type="checkbox" id="adminsettings"
									name="givenRoles" value="#adminsettings" class="js-switch"
									<c:if test="${fn:contains(functionAllowed,'#adminsettings')}"> checked="checked"</c:if>>
									Admin Settings &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
						</tr>
					</table>
			</div>
		</div>
	</div>

</form>

<script type="text/javascript">
	<%if (request.getAttribute("msg") != null) {%>
		$('#myModal').modal('show');
	<%}%>
	</script>
</body>
</head>