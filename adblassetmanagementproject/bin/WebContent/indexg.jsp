<html>
	<head><title>Sahakari Login</title>
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/admin.css" type="text/css"></head>
    <body style="background-color: mediumaquamarine;">
    	<div class="col-md-6 col-centered" style="text-align: center;">
    		<img src="assets/images/adbl government logo.jpg" alt="logo" class="img-responsive" />
    		<form class="login-form" action="login.log" method="post">
    		<p style="color:red;">${msg}</p>
    		<br>
    		<br>
	   			<label >Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="username" class="form-control"
								placeholder="Username" required="" /></label><br>
	   			
				<label >Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" class="form-control"
								placeholder="Password" required="" /></label><br />
	   			<div style="text-align: center; padding-bottom: 60px;">
	   				<button type="submit" class="btn btn-primary col-centered">Login</button>
    			</div>
	   		</form>
	    </div>
    </body>
</html>