
<%String id=request.getParameter("id");%>
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
InventoryDao i=new InventoryDaoImpl();
ResultSet idetail= (ResultSet)i.getinventoryeditdata(id);
ResultSet supplier=(ResultSet) i.getcompanylist();
ResultSet companylist1=(ResultSet) i.getcompanylist();
ResultSet companylist2=(ResultSet) i.getcompanylist();
ResultSet companylist3=(ResultSet) i.getcompanylist();
ResultSet fundsource=(ResultSet) i.getfundsourcelist();
ResultSet itemcondition=(ResultSet) i.getitemcondition();
ResultSet group=(ResultSet) i.getgroup();
if(idetail.next()){ %>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
</head>
<body>
	<div class="panel panel-default" style="width: 100%; margin: auto;">
		<div class="panel-body">
			<div class="container">
				<div class="tab-content">
					<div id="menu2" class="tab-pane fade in active">
						<br>
						<ul class="nav nav-tabs">
							<li><button id="change" type="submit"
									class="btn btn-success" form="form">Update</button>&nbsp;&nbsp;&nbsp;</li>
							<li class="active"><a data-toggle="tab" data-target="#1">Basic
									Details</a></li>
							<li><a data-toggle="tab" data-target="#2">Additional
									Details</a></li>
							<li><a data-toggle="tab" data-target="#3">AMC Details</a></li>
							<li><a data-toggle="tab" data-target="#4">Insurance
									Details</a></li>

							<li><a data-toggle="tab" data-target="#5">Warranty
									Details</a></li>
							<li><a data-toggle="tab" data-target="#6">Vehicle
									Details</a></li>
							<li><a data-toggle="tab" data-target="#7">Software
									Details</a></li>
							<li><a data-toggle="tab" data-target="#8">Computer
									Details</a></li>

						</ul>
						<div class="tab-content">
							<div id="1" class="tab-pane fade in active">
								<form method="post" action="updateinventory.adbl" id="form">
									<input type="hidden" form="form" name="amcid"
										value="<%=idetail.getString("amcid")%>"> <input
										type="hidden" form="form" name="insuranceid"
										value="<%=idetail.getString("insuranceid")%>"> <input
										type="hidden" form="form" name="inventoryotherdetailid"
										value="<%=idetail.getString("inventoryotherdetailid")%>">
									<input type="hidden" form="form" name="warrantyid"
										value="<%=idetail.getString("warrantyid")%>"> <input
										type="hidden" name="previousgroupcode"
										value="<%=idetail.getString("groupcode") %>" form="form">
									<table class="table" style="width: 80%;">
										<tbody>
											<tr>
												<td>
													<h5>Legacy Id</h5> <input type="text" name="legacyid"
													class="form-control" form="form"
													value="<%=idetail.getString("legacyid") %>">
												</td>
												<td>
													<h5>Item code</h5> <input type="text" name="itemcode"
													class="form-control" form="form"
													value="<%=idetail.getString("itemcode") %>" readonly
													required>
												</td>
												<td>
													<h5>Transaction Id</h5> <input type="text"
													name="transactionid" class="form-control" form="form"
													value="<%=idetail.getString("transactionid") %>" readonly>
												</td>
											</tr>
											<tr>
												<td>
													<h5>Group Name</h5> <select class="form-control"
													name="groupcode" form="form" required>
														<option value="<%=idetail.getString("groupcode") %>"
															selected><%=idetail.getString("groupname") %></option>
														<%while(group.next()){ %>
														<option value="<%=group.getString("groupcode")%>"><%=group.getString("groupname") %></option>
														<%} %>
												</select>
												</td>
												<td>
													<h5>Item name</h5> <input type="text" name="itemname"
													class="form-control" form="form"
													value="<%=idetail.getString("itemname")%>" required>
												</td>
												<td>
													<h5>Model</h5> <input type="text" name="model"
													class="form-control" form="form"
													value="<%=idetail.getString("model") %>">
												</td>
											</tr>
											<tr>
												<td>
													<h5>Decision Date (B.S.)</h5> <input type="text"
													name="decisiondate" class="form-control" id="nepaliDate1"
													placeholder="YYYY-MM-DD" form="form"
													value="<%=idetail.getString("decisiondate")%>">
												</td>
												<td>
													<h5>Decision Date (A.D.)</h5> <input type="text"
													name="decisiondateen" class="form-control"
													id="englishDate1" placeholder="YYYY-MM-DD" form="form"
													value="<%=idetail.getString("decisiondateen") %>">
												</td>
											</tr>
											<tr>
												<td>
													<h5>Purchase Date (B.S.)</h5> <input type="text"
													name="purchasedate" class="form-control" id="nepaliDate2"
													placeholder="YYYY-MM-DD" form="form"
													value="<%=idetail.getString("purchasedate") %>" required>
												</td>
												<td>
													<h5>Purchase Date (A.D.)</h5> <input type="text"
													name="purchasedateen" class="form-control"
													id="englishDate2" placeholder="YYYY-MM-DD" form="form"
													value="<%=idetail.getString("purchasedateen") %>" required>

													<%String year=idetail.getString("purchasedateen");
                                                  String[] splittedyear=year.split("-");%>

													<input type="hidden" name="previousdate"
													value="<%=splittedyear[0]%>" form="form">

												</td>
											</tr>
											<tr>
												<td>
													<h5>Depreciation Rate(%)</h5> <input type="text"
													name="depreciationrate" class="form-control" form="form"
													value="<%=idetail.getString("depreciationrate")%>">
												</td>
										</tbody>
									</table>
								</form>
							</div>
							<div id="2" class="tab-pane fade in">
								<table class="table" style="width: 80%;">
									<tbody>
										<tr>
											<td>
												<h5>Supplier</h5> <select class="form-control"
												name="supplierid" form="form">
													<%while(supplier.next()){%>
													<option value="<%=supplier.getString("companyid")%>"
														<% if(supplier.getString("companyid").equals(idetail.getString("supplierid"))) {%>
														selected<%}%>"><%=supplier.getString("companyname") %></option>
													<%}%>
											</select>
											</td>
											<td>
												<h5>Fund Source</h5> <select class="form-control"
												name="fundsource" form="form">
													<%while(fundsource.next()){%>
													<option value="<%=fundsource.getString("fundsourceid") %>"
														<%if(fundsource.getString("fundsourceid").equals(idetail.getString("fundsourceid"))){%>
														selected<%}%>"><%=fundsource.getString("sourcename") %></option>
													<%}%>
											</select>
											</td>
											<td>
												<h5>Donation (%)</h5> <input type="text"
												class="form-control" name="donationpercentage" value="<%=idetail.getString("donationpercentage") %>" form="form">

											</td>

										</tr>
										<tr>
											<td>
												<h5>Item Condition</h5> <select name="itemconditionid"
												class="form-control" form="form">
													<%while(itemcondition.next()){ %>
													<option
														value="<%=itemcondition.getString("itemconditionid")%>"
														<%if(itemcondition.getString("itemconditionid").equals(idetail.getString("itemconditionid"))){%>
														selected<%}%>"><%=itemcondition.getString("itemconditionname") %></option>
													<%} %>
											</select>
											</td>

											<td>
												<h5>Unit Name</h5> <input type="text" name="unitname"
												class="form-control" form="form"
												value="<%=idetail.getString("unitname")%>"><br>
											</td>
											<td>
												<h5>Item Size</h5> <input type="text" name="itemsize"
												class="form-control" form="form"
												value="<%=idetail.getString("itemsize")%>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>Rate</h5> <input type="text" name="rate"
												class="form-control" form="form"
												value="<%=idetail.getString("rate")%>">
											</td>

										</tr>
									</tbody>
								</table>
							</div>
							<div id="3" class="tab-pane fade in">
								<table class="table" style="width: 60%;">
									<tbody>
										<tr>
											<td>
												<h5>AMC Start (B.S.)</h5> <input type="text" name="amcstart"
												class="form-control" placeholder="YYYY-MM-DD" form="form"
												id="nepaliDate3" value="<%=idetail.getString("amcstart") %>">
											</td>
											<td>
												<h5>AMC Start (A.D.)</h5> <input type="text"
												name="amcstarten" class="form-control"
												placeholder="YYYY-MM-DD" form="form" id="englishDate3"
												value="<%=idetail.getString("amcstarten")%>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>AMC End (B.S.)</h5> <input type="text" name="amcend"
												class="form-control" placeholder="YYYY-MM-DD" form="form"
												id="nepaliDate4" value="<%=idetail.getString("amcend")%>">
											</td>
											<td>
												<h5>AMC End (A.D.)</h5> <input type="text" name="amcenden"
												class="form-control" placeholder="YYYY-MM-DD" form="form"
												id="englishDate4" value="<%=idetail.getString("amcenden")%>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>AMC Cost</h5> <input type="text" name="amccost"
												class="form-control" form="form"
												value="<%=idetail.getString("amccost") %>">
											</td>
											<td>
												<h5>Company Name</h5> <select class="form-control"
												name="amccompanyid" form="form">
													<%while(companylist1.next()){ %>
													<option value="<%=companylist1.getString("companyid") %>"
														<%if(companylist1.getString("companyid").equals(idetail.getString("amccompanyid"))) {%>
														selected <%} %>><%=companylist1.getString("companyname") %></option>
													<%} %>

											</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="4" class="tab-pane fade in">
								<table class="table" style="width: 60%;">
									<tbody>
										<tr>
											<td>
												<h5>Insurance Start (B.S.)</h5> <input type="text"
												name="insurancestart" class="form-control" id="nepaliDate5"
												placeholder="YYYY-MM-DD" form="form"
												value="<%=idetail.getString("insurancestart") %>">
											</td>
											<td>
												<h5>Insurance Start (A.D.)</h5> <input type="text"
												name="insurancestarten" class="form-control"
												id="englishDate5" placeholder="YYYY-MM-DD" form="form"
												value="<%=idetail.getString("insurancestarten") %>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>Insurance End (B.S.)</h5> <input type="text"
												name="insuranceend" class="form-control" id="nepaliDate6"
												placeholder="YYYY-MM-DD" form="form"
												value="<%=idetail.getString("insuranceend") %>">
											</td>
											<td>
												<h5>Insurance End (A.D.)</h5> <input type="text"
												name="insuranceenden" class="form-control" id="englishDate6"
												placeholder="YYYY-MM-DD" form="form"
												value="<%=idetail.getString("insuranceenden") %>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>Premium Amount</h5> <input type="text"
												name="insurancepremuimamount" id="insuranceamount"
												class="form-control" form="form"
												value="<%=idetail.getString("insurancepremiumamount") %>">
											</td>
											<td>
												<h5>Company Name</h5> <select class="form-control"
												name="insurancecompanyid" form="form">
													<%while(companylist2.next()){ %>
													<option value="<%=companylist2.getString("companyid") %>"
														<%if(companylist2.getString("companyid").equals(idetail.getString("insurancecompanyid"))) {%>
														selected <%} %>><%=companylist2.getString("companyname") %></option>
													<%} %>
											</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="5" class="tab-pane fade in">
								<table class="table" style="width: 80%;">
									<tbody>
										<tr>
											<td>
												<h5>Warranty Start (B.S.)</h5> <input type="text"
												name="warrantystart" class="form-control" form="form"
												placeholder="YYYY-MM-DD" id="nepaliDate7"
												value="<%=idetail.getString("warrantystart") %>">
											</td>

											<td>
												<h5>Warranty Start (A.D.)</h5> <input type="text"
												name="warrantystarten" class="form-control" form="form"
												placeholder="YYYY-MM-DD" id="englishDate7"
												value="<%=idetail.getString("warrantystarten") %>">
											</td>
										</tr>
										<tr>
											<td>
												<h5>Warranty End (B.S.)</h5> <input type="text"
												name="warrantyend" class="form-control" form="form"
												placeholder="YYYY-MM-DD" id="nepaliDate8"
												value="<%=idetail.getString("warrantyend") %>">
											</td>
											<td>
												<h5>Warranty End (A.D.)</h5> <input type="text"
												name="warrantyenden" class="form-control" form="form"
												placeholder="YYYY-MM-DD" id="englishDate8"
												value="<%=idetail.getString("warrantyenden") %>">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="6" class="tab-pane fade in">
								<table class="table" style="width: 80%;">
									<tbody>
										<tr>
											<td>
												<h5>Vehicle No.</h5> <input type="text" name="vehicleno"
												class="form-control" form="form"
												value="<%=idetail.getString("vehicleno") %>">
											</td>
											<td>
												<h5>Chesisno</h5> <input type="text" name="chesisno"
												class="form-control" form="form"
												value="<%=idetail.getString("chesisno") %>">
											</td>
											<td>
												<h5>Engine No.</h5> <input type="text" name="engineno"
												class="form-control" form="form"
												value="<%=idetail.getString("engineno") %>">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="7" class="tab-pane fade in">
								<table class="table" style="width: 20%;">
									<tbody>
										<tr>
											<td>
												<h5>License No.</h5> <input type="text" name="licenseno"
												class="form-control" form="form"
												value="<%=idetail.getString("licenseno") %>">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="8" class="tab-pane fade in">
								<table class="table" style="width: 20%;">
									<tbody>
										<tr>
											<td>
												<h5>MAC Address</h5> <input type="text" name="macaddress"
												class="form-control" form="form"
												value="<%=idetail.getString("macaddress")%>">
											</td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="assets/js/dateConverter.js"></script>
</body>
</html>

<%} %>
