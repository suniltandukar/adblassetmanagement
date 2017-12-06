<jsp:include page="/includefile"></jsp:include>
<html>
<head>
</head>
<body>
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Settings</li>
				<li class="breadcrumb-item active" aria-current="page">User
					Settings</li>
				<li class="breadcrumb-item active" aria-current="page">Change
					Username/Password</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default" style="width: 40%; margin: auto;">
		<div class="panel-heading">
			<strong>User Detail</strong>
		</div>
		<div class="panel-body">
			<form method="post" id="form" name="Form1" action="updateusernamepassword.add">
				<table class="table">
					<tbody>
						<tr>
							<td>
								<h5>Username</h5> <input type="hidden" form="form" value=""
								name="useridforupdate"> <input type="text"
								name="username" class="form-control datepicker username"
								form="form" value="${username}" readonly>
							</td>
						</tr>
					
						<tr>
							<td>
								<%String oldpwd="";
								if(request.getAttribute("password")!=null){
									oldpwd=request.getAttribute("password").toString();
								}; %>
								<h5>Old Password</h5> <span class="passwordcheck"></span> <input
								type="text" name="oldpassword" id="oldpassword"
								class="form-control datepicker staffcode" form="form" value="" required>
							</td>

						</tr>
						<tr>
							<td>
								<h5>New Password</h5> <input type="text" name="newpassword"
								class="form-control" form="form" value=""required>
							</td>
						</tr>
						<tr>
							<td><input type="submit" name="updatebtn"
								class="updatebtn btn btn-primary" value="update"
								required></td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>
	</div>
	
	<script>
	
	$('#form').submit(function() {
		
	    var id1 = $('#oldpassword').val(); //if #id1 is input element change from .text() to .val() 
	    if (id1 == '<%=oldpwd%>') {
	       return confirm("CONFIRM?");
	        return true;
	    }
	    else
	    {
	    	 alert('Old password did not matched');
	        return false;
	    }
	});
	</script>
</body>
</html>