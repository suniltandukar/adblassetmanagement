<html>
	<head><title>ADBL Login</title>
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/admin.css" type="text/css"></head>
    <body style="background-color: mediumaquamarine;">
    	<div class="col-md-6 col-centered" style="text-align: center;">
    		<img src="assets/images/adbl government logo.jpg" alt="logo" class="img-responsive" />
    		<form class="login-form" action="login.adbl" method="post">
    		<p style="color:red;">${msg}</p>
    		<br>
    		<br>
    			<label >Staff Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  name="staffcode" size=45 placeholder="Enter your code" class="uname" /></label><br>
	   			<label >Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="username" size=45 placeholder="Enter your username" class="uname" /></label><br>
	   			
				<label >Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" size=45 placeholder="Enter your password" class="uname" /></label><br />
	   			<div style="text-align: center; padding-bottom: 60px;">
	   				<button type="submit" class="btn btn-primary col-centered">Login</button>
    			</div>
	   		</form>
	    </div>
    </body>
</html>