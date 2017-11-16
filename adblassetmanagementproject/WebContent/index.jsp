<html>
	<head>
		<link href="assets/css/index.css" rel="stylesheet">
	</head>
	<body>
		<div class="login-page">
		  <div class="form">
		  	<p style="color:red;">${msg}</p>
		    <form class="login-form" action="login.adbl" method="post">
		      <input type="text" name="staffcode" placeholder="staff-code"/>	
		      <input type="text" name="username" placeholder="username"/>
		      <input type="password" name="password" placeholder="password"/>
		      <button type="submit">login</button>
		    </form>
		  </div>
		</div>
	</body>
</html>