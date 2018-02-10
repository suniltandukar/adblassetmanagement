<%@page import="java.sql.*"%>
<%ResultSet i=(ResultSet)request.getAttribute("issuehistory"); %>
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
			    <li class="breadcrumb-item active" aria-current="page">Issue History</li>
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
					                                    	<th>Issue Id</th>
					                                    	<th>Item Code</th>
					                                    	<th>Item Name</th>
					                                    	<th>Issued Date</th>
					                                        <th>Issued By</th>
					                                        <th>Room No</th>
					                                       
					                                       
					                                        
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                <%while(i.next()){ %>
					                                    <tr>
					                                    	<td><%=i.getString("issueid") %></td>
					                                     	<td><a href="viewinventoryitem.click?id=<%=i.getString("itemcode") %>"><%=i.getString("itemcode") %></a></td>
					                                    	<td><%=i.getString("itemname") %></td>
					                                    	<td><%=i.getString("issueddateen") %>
					                                    	<td><%=i.getString("issuedby") %></td>
					                                    	<td><%=i.getString("roomno") %>
					                                    	
					                                        
					                                    
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