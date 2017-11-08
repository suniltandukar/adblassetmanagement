<html>
<head>
<link rel="import" href="new.jsp">
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
    		<div class="col-md-4">
    			<div class="panel panel-default">
    				<div class="panel-heading">
    					<strong>Add User</strong>
    				</div>
    				<div class="panel-body">
    				<form method="" action="" id="form"></form>
						<table class="table">
							<tbody>
								<tr>
									<td>
                                       <h5>Username</h5> 
                                       <input type="text" name="username" class="form-control datepicker"  form="form" value="">
                                   	</td>
								</tr>
								<tr>
									<td>
                                       <h5>Staffcode</h5> 
                                       <input type="text" name="staffcode" class="form-control datepicker"  form="form" value="">
                                   	</td>
								</tr>
								<tr>
									<td>
                                       <h5>Role</h5> 
                                       <select name="role" form="form" class="form-control">
                                       	<option value="admin">Admin</option>
                                       </select>
                                   	</td>
								</tr>
							</tbody>
						</table>    				
    				</div>
    			</div>
    		</div>
    		<div class="col-md-8">
    			<div class="panel panel-default">
    				<div class="panel-heading">
    					<strong>Existing Users</strong>
    				</div>
    				<div class="panel-body">
    				
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>
</body>
</html>