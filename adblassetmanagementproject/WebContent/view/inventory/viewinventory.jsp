<link rel="import" href="new.jsp">

        
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
InventoryDao i=new InventoryDaoImpl(branchdb.getString("branchdb"));
ResultSet inventory=(ResultSet) i.getinventorydata();%>
<html>
<head>

</head>
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
    <div class="panel-heading">
        <h3>
        <p id="message"></p>
            <strong>INVENTORY</strong>
        </h3>
    </div>
    <div class="panel-body">
        <div class="container">
        
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" data-target="#menu1">View
                        Inventory</a></li>
             </ul>
              <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
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
					                                        <th>Item Code</th>
					                                        <th>Item Name</th>
					                                        <th>Group Code</th>
					                                        <th>Model</th>
					                                        <th>Decission Date</th>
					                                        <th>Depreciation Rate</th>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <%while (inventory.next()){ %>
					                                    <tr>
					                                        <td><a href="editinventory.click?id=<%=inventory.getString("itemcode") %>"><%=inventory.getString("itemcode") %></a></td>
					                                        <td><%=inventory.getString("itemname") %></td>
					                                        <td><%=inventory.getString("groupcode") %></td>
					                                        <td><%=inventory.getString("model") %></td>
					                                        <td><%=inventory.getString("decisiondate") %></td>
					                                        <td><%=inventory.getString("depreciationrate") %></td>
					                                    </tr>
					                                    <%} %>
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
			                    </div>
			                    </div>
			                 </div>
			            </div>
			         </div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p>${msg }</p>
          <br>
         Updated Itemcode: ${inventory.updated_itemcode }<br>
         Item name: ${inventory.itemname }<br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
<script type="text/javascript">
		$(document).ready(function() {
			   $('#example').DataTable();
			   <%if(request.getAttribute("msg")!=null){%>
			   $('#myModal').modal('show');
			   <%}%>
			} );
		
</script>	
</html>
