<html>
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.TransferDaoImpl'%>
<%@page import='com.adbl.dao.TransferDao'%>
<%@page import='com.adbl.model.UserModel'%>
<%
UserModel userdetail=(UserModel) session.getAttribute("userDetail");
TransferDao tdao=new TransferDaoImpl();
ResultSet branchname=(ResultSet) tdao.getbranchdetails();
%>
<jsp:include page="/includefile"></jsp:include>
<head>
<style>
.green {
	color: green
}

.red {
	color: red
}

.updatebtn {
	display: none;
}

<%
if (request.getAttribute ("updatebtn")!=null){ %> .updatebtn { display:block;
	
}

.submitbtn {
	display: none;
}
<%
}
%>
</style>
</head>
<body class="background">
	<div class="breadcrumb-line">
		<nav aria-label="breadcrumb" role="navigation">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home"
					aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page">Transfer/Issue</li>
				<li class="breadcrumb-item active" aria-current="page">Transfers</li>
			</ol>
		</nav>
	</div>
	<div class="row">
		<div class="col-md-7">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Fill Transfer Detail</strong>
				</div>
				<div class="panel-body">
					<form method="post" action="transferitem.add" id="form">
						<table class="table">
							<tbody>
								<tr>
									<td><input type="submit" name="button" value="submit"
										class="btn btn-primary submitbtn"></td>
								</tr>

								<tr>

									<td>
										<h5>Transferred To (branchname):</h5>
										<span class="staffcheck"></span> <select name="tobranch"
										class="form-control showbranch" form="form">
											<option value="">Select Branch Name</option>
	<%if(branchname!=null) {%>
											<%while(branchname.next()){ %>
											<option value="<%=branchname.getString("branchcode")%>"><%=branchname.getString("branchcode")%>-<%=branchname.getString("name")%>
											</option>
											<%}} %>
									</select>
									</td>


								</tr>

								<tr>
									<td>
										<h5>Transferred Date (B.S):</h5> <input type="text"
										name="transferdate" class="form-control" id="nepaliDate1"
										form="form" value="">
									</td>
									<td>
										<h5>Transferred Date (A.D):</h5> <input type="text"
										name="transferdateen" class="form-control" form="form"
										id="englishDate1" value="">
									</td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Fill Item Codes</strong>
				</div>
				<div class="panel-body">
					<table class="table" id="table">
						<tbody>
							<tr>
								<td><input name="button" value="+ Add Item"
									class="btn btn-primary" onclick="myFunction()"></td>
							</tr>
							<tr>
								<td>
									<h5>Item Code:</h5> <input type="text" name="itemcode"
									class="form-control" form="form">
								</td>
							</tr>
						</tbody>
					</table>
					</form>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<p>
						<b>${msg }</b>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/js/dateConverter.js"></script>


	<script>
function myFunction() {
    var table = document.getElementById("table");
    var row = table.insertRow(2);
    var cell1 = row.insertCell(0);
    cell1.innerHTML = "<a><i class='fa fa-times' aria-hidden='true' style='color:red;'></i></a><input type='text' name='itemcode' class='form-control'  form='form'>";
}
$('table').on('click','tr a',function(e){
    e.preventDefault();
   $(this).parents('tr').remove();
 });
</script>
	<script>

$(".showbranch").change(function()
		{
		var id=$(this).val();
		var dataString = 'id='+ id;
		$.ajax
		({
		type: "POST",
		url: "getuserdetail.click",
		data: dataString,
		cache: false,
		success: function(html)
		{
		$(".showuser").html(html);
		} 
		});
});
<%if(request.getAttribute("msg")!=null){%>
$('#myModal').modal('show');
<%}%>
</script>
</body>
</html>