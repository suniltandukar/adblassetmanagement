<link rel="import" href="new.jsp">

        
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.OtherActionDAOImpl'%>
<%@page import='com.adbl.dao.OtherActionDAO' %>
<%ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
OtherActionDAO ac=new OtherActionDAOImpl();
ResultSet bill=(ResultSet) ac.viewbillDao(branchdb.getString("branchdb")); %>

<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			      <li class="breadcrumb-item active" aria-current="page">Items</li>
			    <li class="breadcrumb-item active" aria-current="page">View Inventory</li>
			  </ol>
			</nav>
		</div>
<div class="panel panel-default" style="width: 100%; margin: auto;">
    
    <div class="panel-body">
					<div class="panel panel-default" style="width: 100%;">
					                        <div class="panel-heading">
					                            <h6>
					                                <strong>Inventory Item Details</strong>
					                            </h6>
					                        </div>
					                        <div class="panel-body">
					                            <table id="example" class="table table-striped table-bordered"
					                                cellspacing="0" width="100%">
					                                <thead>
					                                    <tr>
					                                        <th>Bill No.</th>
					                                        <th>Bill Date(B.S.)</th>
					                                        <th>Bill Date(A.D.)</th>
					                                        <th>Company Name</th>
					                                        <th>Bill Generated Name</th>
					                                        <th><i class="fa fa-cog" aria-hidden="true"></i></th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <%while(bill.next()){%>
					                                    <tr>
					                                        <td><%=bill.getString("billno") %></td>
					                                        <td><%=bill.getString("billdate") %></td>
					                                        <td><%=bill.getString("billdateen") %></td>
					                                        <td><%=bill.getString("companyname") %></td>
					                                     	 <td><a href="viewbillimage.add?id=<%=bill.getString("billid") %>">View Bill</a></td>
					                                        
					                                       
															    
					                                    </tr>
					                                    <%} %>
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
			            </div>
			         </div>

<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">              
      <div class="modal-body">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <img src="view/uploadedbills/${billimageoriginalname }" class="imagepreview" style="width: 100%;" >
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function()
        {
	<%if(request.getAttribute("msg")!=null){%>
	
	   $('#imagemodal').modal('show');
	   <%}%>
        });
</script>	
</html>
