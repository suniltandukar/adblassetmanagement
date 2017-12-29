<%@page import="java.sql.*"%>
<%ResultSet t=(ResultSet)request.getAttribute("transferdetails");%>

<jsp:include page="/includefile"></jsp:include>
<html>
	<head>
	</head>
	<body>
		<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="page">Transfer/Issue</li>
			    <li class="breadcrumb-item active" aria-current="page">Issue Confirmation</li>
			  </ol>
			</nav>
		</div>
		<div class="panel panel-default" style="width: 100%; margin: auto;">
    		<div class="panel-body">
					<div class="panel panel-default" style="width: 100%;">
					                        <div class="panel-heading">
					                            <h6>
					                                <strong>Transfered Item Details</strong>
					                            </h6>
					                        </div>
					                        <div class="panel-body">
					                            <table id="example" class="table table-striped table-bordered"
					                                cellspacing="0" width="100%">
					                                <thead>
					                                    <tr>
					                                    	<th>Transferred From</th>
					                                    	<th>Transfered Date(A.D)</th>
					                                        <th>Item Code</th>
					                                        <th>Item Name</th>
					                                        <th>Group Code</th>
					                                        <th>Model</th>
					                                        <th>Confirmation</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                
					                               <%while(t.next()){ %>
					                                    <tr>
					                                    	<td><%=t.getString("transferedby") %></td>
					                                    	<td><%=t.getString("transfereddateen") %></td>
					                                        <td><a href="viewinventoryitem.click?id=<%=t.getString("itemcode") %>"><%=t.getString("itemcode") %></a></td>
					                                        <td><%=t.getString("itemname") %></td>
					                                        <td><%=t.getString("groupcode") %></td>
					                                        <td><%=t.getString("model") %></td>
					                                        <td>
					                                        <%if(t.getString("statusname").equals("0")) {%>
					                                        Rejected
					                                        <%}else if(t.getString("statusname").equals("1")) { %>
					                                        Accepted
					                                        <%} else if(t.getString("statusname").equals("p")) { %>
															    	<a class="clickbtn" href="transferconfirm.adbl?cid=<%=t.getString("branchto") %>&statusid=2&transferid=<%=t.getString("transferid") %>"  style="color:green;"><i class="fa fa-check" aria-hidden="true"></i> Yes</a>
															    	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
															    	<a class="clickbtn" href="transferconfirm.adbl?cid=<%=t.getString("branchto") %>&statusid=1&transferid=<%=t.getString("transferid") %>"  style="color:red;"><i class="fa fa-times" aria-hidden="true"></i> No</a>
															<% }%>
															</td>
					                                    </tr>
					                                <%} %>
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
			            </div>
			         </div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p><b>${msg }</b></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
	<script type="text/javascript">
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
		$(document).ready(function() {
			   $('#example').DataTable();
			} );
		$('.clickbtn').click(function(){
			return confirm("Confirm?");
		})
		
	</script>
	</body>
</html>