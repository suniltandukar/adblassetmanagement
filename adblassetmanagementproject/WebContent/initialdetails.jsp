<%@page import="java.sql.*"%>
<%@page import="com.adbl.daoimpl.InitialDetailDaoImpl"%>

<%ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
String companydb=userdetail.getString("branchdb");
InitialDetailDaoImpl i=new InitialDetailDaoImpl(companydb);
ResultSet company=(ResultSet)i.showcompany();
ResultSet company1=(ResultSet)i.showcompany();
ResultSet group=(ResultSet)i.showgroup();
ResultSet fundsource=(ResultSet)i.showfundsource();
ResultSet itemcondition=(ResultSet)i.showitemcondition();%>
<div class="panel panel-default" >
  		<div class="panel-heading">
  		<h4><strong>Add/Edit Initial Form Details</strong></h4>
  		</div>
  		<div class="panel-body">
  			<ul class="nav nav-tabs ">
  				<li class="active"><a data-toggle="tab" data-target="#1" class="clickable">View Added Details</a></li>
			  <li ><a data-toggle="tab" data-target="#2" class="clickable">Add Details</a></li>
			  <li><a data-toggle="tab" data-target="#3" class="clickable">Edit Details</a></li>
			</ul>
			<div class="tab-content">
			  	<div id="1" class="tab-pane fade in active">
			  		<table class="table">
			  		<caption>Inserted Initial Details</caption>
			  			<thead>
			  				<tr>
				  				<th>Company</th>
				  				<th>Group</th>
				  				<th>Fund Source</th>
				  				<th>Item Condition</th>
			  				</tr>
			  			</thead>
			  			<tbody>
			  				<tr>
			  					<td>
			  					<ol>
			  					<%while(company.next()){ %><li><a href="company.del?id=<%=company.getString("companyid")%>" class="action"><i class="fa fa-trash-o" aria-hidden="true" style="color:red"></i></a>  <a href="" data-toggle="tooltip" title="VAT/PAN:<%=company.getString("vatpan") %>" style="color:black;"><%=company.getString("companyname") %>&nbsp;</a> </li><%} %>
			  					</ol>
			  					</td>
			  					<td>
			  					<ol>
			  					<%while(group.next()){ %>
			  					<li><a href="group.del?id=<%=group.getString("groupcode")%>" class="action"><i class="fa fa-trash-o" aria-hidden="true" style="color:red"></i></a>  <a href="" data-toggle="tooltip" title="Group-Code:<%=group.getString("groupcode") %>" style="color:black;"><%=group.getString("groupname") %></a></li><%} %>
			  					</ol>
			  					</td>
			  					<td>
			  					<ol>
			  					<%while(fundsource.next()){ %>
			  					<li><a href="fundsource.del?id=<%=fundsource.getString("fundsourceid")%>" class="action"><i class="fa fa-trash-o" aria-hidden="true" style="color:red"></i></a> <%=fundsource.getString("sourcename") %></li> <%} %>
			  					</ol>
			  					</td>
			  					<td>
			  					<ol>
			  					<%while(itemcondition.next()){ %>
			  					<li><a href="itemcondition.del?id=<%=itemcondition.getString("itemconditionid")%>" class="action"><i class="fa fa-trash-o" aria-hidden="true" style="color:red"></i></a> <%=itemcondition.getString("itemconditionname") %></li><%} %>
			  					</ol>
			  					</td>
			  				</tr>
			  			</tbody>
			  			
			  		</table>
			  	</div>
				<div id="2" class="tab-pane fade in">
				<br>
				  	<ul class="nav nav-tabs">
					  <li ><a data-toggle="tab" data-target="#a" class="clickable">Company</a></li>
					  <li><a data-toggle="tab" data-target="#b" class="clickable">Group</a></li>
					  <li><a data-toggle="tab" data-target="#c" class="clickable">Fund Source</a></li>
					  <li><a data-toggle="tab" data-target="#d" class="clickable">Item Condition</a></li>
					</ul>
					<div class="tab-content">
						<div id="a" class="tab-pane fade in ">
							<form action="company.add" method="post" style="width:100%;margin-top:10px;" class="form" >
							<input type="hidden" value="<%=companydb%>" name="branchdb">
								<table class="table">
									<tr>
										<td>
										<h6><strong>Company VAT/PAN:</strong></h6>
										<input type="text" class="form-control" name="vatpan" required>
										</td>
										<td>
										<h6><strong>Company Name:</strong></h6>
										<input type="text" class="form-control" name="companyname" required>
										</td>
										<td>
										<h6><strong>Company Address:</strong></h6>
										<input type="text" class="form-control" name="companyaddress" required>
										</td>
									</tr>
									<tr>
										<td>
										<h6><strong>Company Contact no:</strong></h6>
										<input type="text" class="form-control" name="companycontactno">
										</td>
										<td>
										<h6><strong>Company Email:</strong></h6>
										<input type="email" class="form-control" name="companyemail" >
										</td>
										<td>
										<h6><strong>Company Contact Person:</strong></h6>
										<input type="text" class="form-control" name="companycontactperson" >
										</td>
									</tr>
									<tr>
										<td>
										<button type="submit" class="btn btn-success">+ ADD</button>
										</td>
									</tr>
										
										
								</table>
							</form>
						</div>
						<div id="b" class="tab-pane fade in ">
							<form method="post" action="group.add" style="width:20%;margin-top:10px;" class="form">
								<input type="hidden" value="<%=companydb%>" name="branchdb">
								<h6><strong>Group Code:</strong></h6>
								<input type="text" class="form-control" name="groupcode" maxlength="3" required><br>
								<h6><strong>Group Name:</strong></h6>
								<input type="text" class="form-control" name="groupname" required><br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div id="c" class="tab-pane fade in ">
							<form method="post" action="fundsource.add" style="width:20%;margin-top:10px;" class="form">
							<input type="hidden" value="<%=companydb%>" name="branchdb">
								<h6><strong>Fund Source Name:</strong></h6>
								<input type="text" class="form-control" name="sourcename" required><br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
						<div id="d" class="tab-pane fade in ">
							<form method="post" action="itemcondition.add" style="width:20%;margin-top:10px;" class="form">
								<input type="hidden" value="<%=companydb%>" name="branchdb">
								<h6><strong>Item Condition Name:</strong></h6>
								<input type="text" class="form-control" name="itemconditionname" required><br>
								<button type="submit" class="btn btn-success">+ ADD</button>
							</form>
						</div>
				</div>
			  </div>
			  <div id="3" class="tab-pane fade in">
			  	<div style="width:20%;"">
			  	
			  		<h6><strong>Select Edit Category:</strong></h6>
			  		<select class="form-control" name="" id="editoptions">
			  			<option value="0">None Selected</option>
			  			<option value="i">Company</option>
			  			<option value="ii">Group</option>
			  			<option value="iii">Fund Source</option>
			  			<option value="iv">Item Condition</option>
			  		</select>
			  	</div>
			  	<div id="i" style="display:none;">
			  		<form action="company.update" method="post" style="width:100%;margin-top:10px;" class="form" >
							<input type="hidden" value="<%=companydb%>" name="branchdb">
								<table class="table">
									<tr>
										<td>
										<h6><strong>Company Name:</strong></h6>
										<select class="form-control" name="companyname" required>
											<option value="">Non Selected</option>
											<%while(company1.next()){ %>
											<option value="<%=company1.getString("companyid")%>"><%=company1.getString("companyname") %>/<%=company1.getString("vatpan") %></option>
											<%} %>
										</select>
										</td>
										<td>
										<h6><strong>Company VAT/PAN:</strong></h6>
										<input type="text" class="form-control" name="vatpan" required>
										</td>
										<td>
										<h6><strong>Company Address:</strong></h6>
										<input type="text" class="form-control" name="companyaddress" required>
										</td>
									</tr>
									<tr>
										<td>
										<h6><strong>Company Contact no:</strong></h6>
										<input type="text" class="form-control" name="companycontactno">
										</td>
										<td>
										<h6><strong>Company Email:</strong></h6>
										<input type="email" class="form-control" name="companyemail" >
										</td>
										<td>
										<h6><strong>Company Contact Person:</strong></h6>
										<input type="text" class="form-control" name="companycontactperson" >
										</td>
									</tr>
									<tr>
										<td>
										<button type="submit" class="btn btn-success">+ UPDATE</button>
										</td>
									</tr>
								</table>
							</form>
			  	</div>
			  	<div id="ii" style="display:none;">
					<form method="post" action="group.add" style="width:20%;margin-top:10px;" class="form">
								<input type="hidden" value="<%=companydb%>" name="branchdb">
								<h6><strong>Group Code:</strong></h6>
								<input type="text" class="form-control" name="groupcode" maxlength="3" required><br>
								<h6><strong>Group Name:</strong></h6>
								<input type="text" class="form-control" name="groupname" required><br>
								<button type="submit" class="btn btn-success">+ UPDATE</button>
					</form>
				</div>
			  	<div id="iii" style="display:none;">fundsource</div>
			  	<div id="iv" style="display:none;">item condition</div>
			  </div>
			</div>
  		</div>
</div>
<script>
	$('.form').submit(function() {
	    return confirm('CONFIRM SUBMIT?'); 
	});
	$('.action').click(function() {
	    return confirm('CONFIRM ACTION?'); 
	});
	$('[data-toggle="tooltip"]').tooltip();  
	$("#editoptions").change(function(){
		 if($(this).val() == '0'){
		    	document.getElementById('i').style.display ='none';
		    	document.getElementById('ii').style.display ='none';
		    	document.getElementById('iii').style.display ='none';
		    	document.getElementById('iv').style.display ='none';
		    }
		 if($(this).val() == 'i'){
		    	document.getElementById('i').style.display ='block';
		    	document.getElementById('ii').style.display ='none';
		    	document.getElementById('iii').style.display ='none';
		    	document.getElementById('iv').style.display ='none';
		    }
		 if($(this).val() == 'ii'){
		    	document.getElementById('i').style.display ='none';
		    	document.getElementById('ii').style.display ='block';
		    	document.getElementById('iii').style.display ='none';
		    	document.getElementById('iv').style.display ='none';
		    }
		
	});
	</script>
