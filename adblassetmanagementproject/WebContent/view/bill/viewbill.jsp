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
					                                     	 <td><a  href="view/uploadedbills/<%=bill.getString("billimageoriginalname") %>" class="btn btn-primary" >View Bill</a></td>
					                                     
															<td>   <a href="#" class="thumbnail img-responsive" data-toggle="modal" data-caption="test caption text" data-image="view/uploadedbills/<%=bill.getString("billimageoriginalname") %>" data-target="#trslphotos"><img src="view/uploadedbills/<%=bill.getString("billimageoriginalname") %>" alt="recent photo" width="0px" style="{display:hidden;}">Show</a></td>
					                                    
					                                    <td><a href="#" data-toggle="modal" data-target="#modalRegister" id="view"> Register</a></td></tr>
					                                   
 <%} %>
					                                </tbody>
					                            </table>
					                        </div>
					                    </div>
			            </div>
			         </div>

	<div id="modalRegister" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="text-align-last: center">Register</h4>
                  <img src="" class="imagepreview" style="width: 100%;" >
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
			         <div class="modal fade" id="trslphotos" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body"><img src="" class="img-responsive"></div>
         
        </div>
    </div>
</div>

<script>
$(document).ready(function()
        {
	$('#trslphotos').on('shown.bs.modal', function (a, b,c) {
		 var clickedImageUrl = a.relatedTarget.childNodes[0].src;
		  displayPhotos(clickedImageUrl);
		})
		function displayPhotos(url) {
		 $('.modal-body img').attr('src',url);
		 $('#trslphotos').modal();
		}
	   
	 
        });
</script>	
</html>
