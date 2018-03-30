<%@page import="java.sql.*"%>
<%ResultSet i=(ResultSet)request.getAttribute("issueditemdetails"); %>
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
					                                <strong>Issued Item Details</strong>
					                            </h6>
					                        </div>
					                        <div class="panel-body">
					                            <table id="example" class="table table-striped table-bordered"
					                                cellspacing="0" width="100%">
					                                <thead>
					                                    <tr>
					                                    	<th>Issued Date(B.S)</th>
					                                    	<th>Issued Date(A.D)</th>
					                                        <th>Item Code</th>
					                                        <th>Item Name</th>
					                                        <th>Group Code</th>
					                                        <th>Model</th>
					                                        <th>Confirmation</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                <%while(i.next()){ %>
					                                    <tr>
					                                    	<td><%=i.getString("issueddate") %></td>
					                                    	<td><%=i.getString("issueddateen") %></td>
					                                        <td><a href="viewinventoryitem.click?id=<%=i.getString("itemcode") %>"><%=i.getString("itemcode") %></a></td>
					                                        <td><%=i.getString("itemname") %></td>
					                                        <td><%=i.getString("groupcode") %></td>
					                                        <td><%=i.getString("model") %></td>
					                                        <td>
					                                        <%if(i.getString("statusname").equals("0")) {%>
					                                        Rejected
					                                        <%}else if(i.getString("statusname").equals("1")) { %>
					                                        Accepted
					                                        <%} else if(i.getString("statusname").equals("p")) { %>
															    	<a class="clickbtn" href="issueconfirmation.adbl?id=2&issueid=<%=i.getString("issueid") %>"  style="color:green;"><i class="fa fa-check" aria-hidden="true"></i> Yes</a>
															    	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
															    	<a class="clickbtn" href="issueconfirmation.adbl?id=1&issueid=<%=i.getString("issueid") %>"  style="color:red;"><i class="fa fa-times" aria-hidden="true"></i> No</a>
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