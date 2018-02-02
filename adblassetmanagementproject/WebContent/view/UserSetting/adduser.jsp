<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="/includefile"></jsp:include>
<html>
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
h6{
font-weight:bold;}

<%--
<%
if (request.getAttribute ("updatebtn ") != null ) { %> .updatebtn {
	display: block;
}

.submitbtn {
	display: none;
}
<%
}
%>
--%>
</style>
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
				<li class="breadcrumb-item active" aria-current="page">Add
					Users</li>
			</ol>
		</nav>
	</div>

	<div class="panel panel-default" style="width: 100%; margin: auto;">

		<div class="panel-body">
			<div class="panel panel-default" style="width: 100%;">
				<div class="panel-heading count">
					<strong>Add New User</strong>
				</div>
				<div class="panel-body">
					<form method="post" action="adduseraction.user" id="form" name="form">
						<table class="table">
							<tbody>
								<tr>

									<td>
										<h6>Username</h6> <input type="hidden" form="form"
										value="${userid}" name="useridforupdate"> <input
										type="text" name="username" class="form-control" form="form"
										data-validation="number" value="${username }" required>
									</td>
									<td>
										<h6>Role Name</h6> <select class="form-control"
										name="givenRole" form="form">
											<c:forEach items="${rolename }" var="role">
												<option value="${role }">${role }</option>
											</c:forEach>

									</select>
									</td>
									<td>
										<h6>Full Name</h6> <input type="text" class="form-control"
										name="fullName" data-sanitize-insert-right=" $"
										data-sanitize="insertLeft" form="form">
									</td>

								</tr>
								<tr>
									<td>
										<h6>Post</h6> <input type="text" class="form-control"
										name="post" data-sanitize="insertRight"
										data-sanitize-insert-right=" $" form="form">
									</td>
									<td>
										<h6>Staff Code</h6> <input type="text" class="form-control"
										name="staffCode" form="form" required>
									</td>
									<td>
										<h6>Branch Code</h6> <input type="text" class="form-control"
										name="branchCode" form="form" required>
									</td>
								</tr>
								<tr>
									<td>
										<h6>Start Date</h6> <input type="text" class="form-control"
										name="startDate" form="form">
									</td>
									<td>
										<h6>End Date</h6> <input type="text" class="form-control"
										name="endDate" form="form" required >
									</td>
									<td>
										<h6>Branch Allowed</h6> <select multiple 
										name="branchAllowed" form="form">
										<option value="">Select Branches</option>
											<c:forEach items="${branchlist }" var="b">
												<option value="${b.branchCode }-${b.branchName}">${b.branchCode }-${b.branchName}</option>
											</c:forEach>
									</select>
									</td>
								</tr>

								<tr>
									<td>

										<h6>Function Allowed</h6> <input form="form" id="tags" type="text"
										name="functionAllowed" class=" " value=""
										data-role="tagsinput" data-sanitize="insertLeft"
										data-sanitize-insert-left="#" />


									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<caption>
								<h4>Additional Functions</h4>
							</caption>
							<tr>

								<td><label><input form="form" type="checkbox" id="dashboard"
										name="additionalFunctions" value="#dashboard"
										class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#dashboard')}"> checked="checked"</c:if>>
										Dashboard &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input form="form" type="checkbox" id="items"
										name="additionalFunctions" value="#items" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#items')}"> checked="checked"</c:if>>
										Items &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input form="form" type="checkbox" id="transferissue"
										name="additionalFunctions" value="#transferissue"
										class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#transferissue')}"> checked="checked"</c:if>>
										Transfer/Issue &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input form="form" type="checkbox"
										id="bill" name="additionalFunctions"
										value="#bill" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#bill')}"> checked="checked"</c:if>>
										Bill&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input form="form" type="checkbox"
										id="settings" name="additionalFunctions"
										value="#settings" class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#settings')}"> checked="checked"</c:if>>
										Settings &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
								<td><label><input form="form" type="checkbox" id="usersettings"
										name="additionalFunctions" value="#usersettings"
										class="js-switch"
										<c:if test="${fn:contains(functionAllowed,'#usersettings')}"> checked="checked"</c:if>>
										User Settings &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
							</tr>
						</table>

						<br> <input type="submit" name="button" value="submit"
							class="btn btn-primary" form="form">

					<!-- 	<input type="submit" name="updatebtn"
							class="updatebtn btn btn-primary" value="update"
							onclick="return OnButton2()"> -->

					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="panel panel-default" style="width: 100%; margin: auto;">

		<div class="panel-body">
			<div class="panel panel-default" style="width: 100%;">
				<div class="panel-heading count">
					<strong>Existing Users</strong>
				</div>
				<div class="panel-body">
				
					<table
						class="table display jambo_table table-striped table-bordered"
						id="datatable">
						<thead>
							<tr>
								<th>User Name</th>
								<th>Actions</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userInfo}" var="user">
								<tr>
									<td>${user.username }</td>

									<td><a href="edituser.user?userid=${user.userid })"><i
											class="fa fa-pencil-square-o"></i></a> <a class="confirmbtn"
										href="deleteuser.user?userid=${user.userid }"><i
											class="fa fa-trash" id="deletebtn" aria-hidden="true"
											style="color: red"></i></a></td>


								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<script>
		$.validate({
			lang : 'en',
			modules : 'date,toggleDisabled,sanitize',
			disabledFormFilter : 'form.toggle-disabled',
			showErrorDialogs : false

		});
	</script>

	<script>
		$(document).ready(function() {

			$('#button').click(function() {
				$('input[type="text"]').val('');
			});
			var $others = $('input[name="role"]').not('#admin')
			$('#admin').change(function() {
				if (this.checked) {
					$others.bootstrapToggle('off')
				}
			});
			$others.change(function() {
				if (this.checked) {
					$('#admin').bootstrapToggle('off')
				}
			})

			var t = $('#table').DataTable({
				"iDisplayLength" : 50
			});
			t.on('order.dt search.dt', function() {
				t.column(0, {
					search : 'applied',
					order : 'applied'
				}).nodes().each(function(cell, i) {
					var c = cell.innerHTML = i + 1;
				});
			}).draw();

			$(".username").blur(function() {
				var id = $(this).val();
				var dataString = 'id=' + id;
				$.ajax({
					type : "POST",
					url : "checkusername.check",
					data : dataString,
					cache : false,
					success : function(html) {
						$(".usercheck").html(html);
					}
				});

			});
			$(".confirmbtn").click(function(event) {
				return confirm("CONFIRM?");
			});
			$(".staffcode").blur(function() {
				var id = $(this).val();
				var dataString = 'id=' + id;
				$.ajax({
					type : "POST",
					url : "checkstaffcode.check",
					data : dataString,
					cache : false,
					success : function(html) {
						$(".staffcheck").html(html);
						var user = $('.staffcheck').html().val();
						if (user = "Unavailable!") {
							alert('hello');
						}
					}
				});

			});
		});
	</script>
	<script>
		/* function OnButton1() {
			document.Form1.action = "adduseraction.user"
			document.Form1.submit();
			return confirm('Confirm submission?');
		} */

		function OnButton2() {
			document.Form1.action = "updateuser.user"

			document.Form1.submit();
			return true;
		}
	</script>

	<c:if test="${msg!=null }">
		<script>
			$('#myModal').modal('show');
		</script>
	</c:if>
	<!-- <script>
$('.hash').on('keypress',function(e){
	var value=$(this).val();
	$('.hash').val('#'+value);
});
</script> -->

	<script
		src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
		type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$('#branches').multiselect({
				includeSelectAllOption : true
			});
			$('#btnSelected').click(function() {
				var selected = $("#lstFruits option:selected");
				var message = "";
				selected.each(function() {
					message += $(this).text() + " " + $(this).val() + "\n";
				});
				alert(message);
			});
		});
	$('form').submit(function(){
		return confirm('Confirm Submission?');
	})
	</script>
</body>

</html>
