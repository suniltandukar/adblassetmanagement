<jsp:include page="/includefile"></jsp:include>
<html>
<head></head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit</li>
				<li class="breadcrumb-item active" aria-current="page">Edit
					Depreciation</li>
			</ol>
		</nav>
	</div>
	<div class="panel panel-default" style="width:30%; margin:auto">
		<div class="panel-heading">
			<h4>
				<strong>Edit Depreciaton</strong>
			</h4>
		</div>
		<div class="panel-body">
			<form method="post" action="updateDepreciation.update"
				 class="form">
				<h6>
					<strong>Item Code</strong>
				</h6>
				<input type="hidden" name="did" value="${id }">
				<input type="text" class="form-control" name="itemcode"
					 value="${itemcode }" readonly><br>
				<h6>
					<strong>Last Year Depreciation:</strong>
				</h6>
				<input type="text" class="form-control" name="lastyrdep" value="${lastyrdep }" required><br>
				<button type="submit" class="btn btn-success">+ SAVE</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	$('.form').submit(function() {
	    return confirm('CONFIRM SUBMIT?'); 
	});
	</script>
</body>
</html>

