<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ADBL Login</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <style >
        body {
    background-image: url("view/bg.jpg");
   }
   .row{
   color:white;}
</style>
    </head>
    <body>
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-3 text">
                            <h1><strong>Agricultural Development Bank Ltd.</strong></h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Login to <strong>ASSET MANAGEMENT</strong></h3>
                            		<p>Enter your username and password to log on:</p>
                            		<p style="color:red;">${msg}</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="login.adbl" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Staff Code</label>
			                        	<input type="text" name="staffcode" placeholder="Your staff code..." class="form-username form-control" id="form-username">
			                        </div>
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="username" placeholder="Username..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        
			                        </div>
			                       <center> <button  type="submit" class="btn btn-primary">Sign in!</button></center>
                                    <div class="description">
                                        <center><a href="#" style="color: white">Forgot password?</a></center>
                                    </div>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
        <script src="assets/js/bootstrap.min.js"></script>

    </body>

</html>