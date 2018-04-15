<link rel="import" href="new.jsp">
<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%@page import='java.util.Date' %>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>
</head>
<body>
<%
InventoryDao i=new InventoryDaoImpl();
ResultSet supplier=(ResultSet) i.getcompanylist();
ResultSet companylist1=(ResultSet) i.getcompanylist();
ResultSet companylist2=(ResultSet) i.getcompanylist();
ResultSet fundsource=(ResultSet) i.getfundsourcelist();
ResultSet itemcondition=(ResultSet) i.getitemcondition();
ResultSet group=(ResultSet) i.getgroup();%>
	<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			      <li class="breadcrumb-item active" aria-current="page">Items</li>
			    <li class="breadcrumb-item active" aria-current="page">Add Inventory</li>
			  </ol>
			</nav>
		</div>
<div class="panel panel-default" style="width: 100%; margin: auto;">
    
    <div class="panel-body">
                <div id="menu2" class="tab-pane fade in active">
                <br>
                    <ul class="nav nav-tabs">
                        <li><button type="submit" class="btn btn-success" form="form">Submit</button>&nbsp;&nbsp;&nbsp;</li>
                        <li class="active"><a data-toggle="tab" data-target="#1">Basic
                                Details</a></li>
                        <li><a data-toggle="tab" data-target="#2">Additional
                                Details</a></li>
                        <li><a data-toggle="tab" data-target="#3">AMC Details</a></li>
                        <li><a data-toggle="tab" data-target="#4">Insurance
                                Details</a></li>
                                
                        <li><a data-toggle="tab" data-target="#5">Warranty Details</a></li>
                        <li><a data-toggle="tab" data-target="#6">Vehicle Details</a></li>
                         <li><a data-toggle="tab" data-target="#7">Software Details</a></li>
                        <li><a data-toggle="tab" data-target="#8">Computer Details</a></li>
                        
                    </ul>
            
	
                    <div class="tab-content">
                        <div id="1" class="tab-pane fade in active">
                            <form class="submitform" id="form" method="post" action="addinventory.adbl">
                            <input type="hidden" name="inventory" value="/inventory" form="form">
                           
                                <table class="table" style="width: 80%;">
                                    <tbody>
                                        <tr>
                                        	 <% Date date=new Date(); %>
                                            <td>
                                                <h5>Transaction Date</h5> <input type="text"
                                                name="transactiondateen" class="form-control datepicker"  form="form" value="<%=date%>" readonly>
                                                <input type="hidden" name="year" id="year" value="" maxlength="10">
                                            </td>
                                            <td>
                                                <h5>Legacy Id</h5> <input type="text" name="legacyid"
                                                class="form-control"  form="form">
                                            </td>
                                           
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Group Name</h5>
                                                <select class="form-control" name="groupcode" form="form" required>
                                                	<option value="" selected>Select group</option>
                                                	<%while(group.next()){ %>
                                                	<option value="<%=group.getString("groupcode")%>"><%=group.getString("groupname") %></option>
                                                	<%} %>
                                                </select>
                                            </td>
                                            <td>
                                                <h5>Item name</h5> <input type="text" name="itemname"
                                                class="form-control"  form="form">
                                            </td>
                                            <td>
                                                <h5>Model</h5> <input type="text" name="model"
                                                class="form-control"  form="form">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Decision Date (B.S.)</h5> <input type="text"
                                                name="decisiondate" class="form-control" id="nepaliDate1"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                            </td>
                                            <td>
                                                <h5>Decision Date (A.D.)</h5> <input type="text"
                                                name="decisiondateen" class="form-control" id="englishDate1"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                            </td>
                                            <td>
													<h5>Last Year Depreciation</h5> <input type="text" name="lastyrdep"
													class="form-control" form="form"
													value="" >
												</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Purchase Date (B.S.)</h5> <input type="text"
                                                name="purchasedate" class="form-control" id="nepaliDate2"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10" required> 
                                            </td>
                                            <td>
                                                <h5>Purchase Date (A.D.)</h5> <input type="text"
                                                name="purchasedateen" class="form-control" id="englishDate2"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Depreciation Rate(%)</h5> <input type="text" 
                                                name="depreciationrate" class="form-control"  form="form" >
                                            </td>
                                               <td>
                                                <h5>Effective Date (B.S.)</h5> <input type="text"
                                                name="depeffectivedate" class="form-control" id="nepaliDate9"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10" > 
                                            </td>
                                               <td>
                                                <h5>Effective Date (A.D.)</h5> <input type="text"
                                                name="depeffectivedateen" class="form-control" id="englishDate9"
                                                placeholder="YYYY-MM-DD"  form="form" maxlength="10" > 
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
                                            name="supplierid"  form="form" required>
                                               
                                                <%while(supplier.next()){%>
                                                	<option value="<%=supplier.getString("companyid") %>"><%=supplier.getString("companyname") %></option>
                                                <%}%>
                                        </select>
                                        </td>
                                		<td>
                                            <h5>Fund Source</h5> <select class="form-control"
                                            name="fundsource"  form="form" >
                                                <%while(fundsource.next()){%>
                                                	<option value="<%=fundsource.getString("fundsourceid") %>"><%=fundsource.getString("sourcename") %></option>
                                                <%}%>
                                        </select>
                                        </td>
                                        <td>
                                            <h5>Donation (%)</h5> <input type="text" class="form-control"
                                            name="donationpercentage" value="0"  form="form" >
                                               
                                        </td>
                                       
                                	</tr>
                                    <tr>
                                        
                                        <td>
                                            <h5>Unit Name</h5> <input type="text" name="unitname"
                                            class="form-control" form="form"><br>
                                        </td>
                                        <td>
                                            <h5>Item Size</h5> <input type="text" name="itemsize"
                                            class="form-control"  form="form">
                                        </td>
                                         <td>
                                            <h5>Item Condition</h5> <select name="itemconditionid"
                                            class="form-control"  form="form" required>
                                            	
                                            	<%while(itemcondition.next()){ %>
                                            	<option value="<%=itemcondition.getString("itemconditionid")%>"><%=itemcondition.getString("itemconditionname") %></option>
                                            	<%} %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Rate</h5> <input type="text" name="rate" id="rate"
                                            class="form-control" form="form" value="0">
                                        </td>
                                        <td>
                                            <h5>Quantity</h5> <input type="text" name="quantity" id="quantity"
                                            class="form-control"  form="form" value="1" >
                                        </td>
                                        <td>
                                            <h5>Amount</h5> <input type="text" name="amount" id="amount"
                                            class="form-control"  form="form" value="">
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
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="nepaliDate3" maxlength="10">
                                        </td>
                                        <td>
                                            <h5>AMC Start (A.D.)</h5> <input type="text"
                                            name="amcstarten" class="form-control"
                                            placeholder="YYYY-MM-DD"  form="form" id="englishDate3" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>AMC End (B.S.)</h5> <input type="text" name="amcend"
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="nepaliDate4" maxlength="10">
                                        </td>
                                        <td>
                                            <h5>AMC End (A.D.)</h5> <input type="text" name="amcenden"
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="englishDate4" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>AMC Cost</h5> <input type="text" name="amccost"
                                            class="form-control"  form="form" id="amccost" value="0">
                                        </td>
                                        <td>
                                            <h5>Company Name</h5> <select class="form-control"
                                            name="amccompanyid" form="form">
                                                <%while(companylist1.next()) {%>
                                                <option value="<%=companylist1.getString("companyid")%>"><%=companylist1.getString("companyname") %></option>
                                                <%} companylist1.close();%>
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
                                            placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                        </td>
                                        <td>
                                            <h5>Insurance Start (A.D.)</h5> <input type="text"
                                            name="insurancestarten" class="form-control" id="englishDate5"
                                            placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Insurance End (B.S.)</h5> <input type="text"
                                            name="insuranceend" class="form-control" id="nepaliDate6"
                                            placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                        </td>
                                        <td>
                                            <h5>Insurance End (A.D.)</h5> <input type="text"
                                            name="insuranceenden" class="form-control" id="englishDate6"
                                            placeholder="YYYY-MM-DD"  form="form" maxlength="10">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Premium Amount</h5> <input type="text"
                                            name="insurancepremuimamount" id="insuranceamount" value="0"  class="form-control"  form="form">
                                        </td>
                                        <td>
                                            <h5>Company Name</h5> <select class="form-control"
                                            name="insurancecompanyid"  form="form">
                                                <%while(companylist2.next()) {%>
                                                <option value="<%=companylist2.getString("companyid")%>"><%=companylist2.getString("companyname") %></option>
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
                                            <h5>Warranty Start (B.S.)</h5> <input type="text" name="warrantystart"
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="nepaliDate7" maxlength="10">
                                        </td>
                                        
                                        <td>
                                            <h5>Warranty Start (A.D.)</h5> <input type="text" name="warrantystarten"
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="englishDate7" maxlength="10">
                                        </td>
                                        </tr>
                                        <tr>
                                        <td>
                                            <h5>Warranty Start (B.S.)</h5> <input type="text" name="warrantyend"
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="nepaliDate8" maxlength="10">
                                        </td>
                                         <td>
                                            <h5>Warranty End (A.D.)</h5> <input type="text" name="warrantyenden"
                                            class="form-control"  form="form" placeholder="YYYY-MM-DD" id="englishDate8" maxlength="10">
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
                                            class="form-control" form="form">
                                        </td>
                                         <td>
                                            <h5>Chesisno</h5> <input type="text" name="chesisno"
                                            class="form-control"  form="form">
                                        </td>
                                        <td>
                                            <h5>Engine No.</h5> <input type="text" name="engineno"
                                            class="form-control" form="form">
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
                                            class="form-control" form="form">
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
                                            class="form-control" form="form">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                    </div>
                </div>
    </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p><b>${msg }</b></p>
          <%String quantity=request.getParameter("quantity"); %>
          
          <%if(quantity!="1"){ %>
         Item Code:${inventory.generated_itemcode}
         TransactionID:${inventory.generated_transactionid }<br>
         Item Name:${inventory.itemname }<br>
          <%} else{ %>
           Item Code:${inventory.generated_itemcode}
         TransactionID:${inventory.generated_transactionid }<br>
         Item Name:${inventory.itemname }<br>
          <a href="editinventory.click?id=${inventory.generated_itemcode }" target="iframe_a"><i class="fa fa-circle-o" ></i> Edit Details</a>
          <%} %>
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
</body>
<script src="assets/js/dateConverter.js"></script>
<script>
$("#insuranceamount, #amccost").change(function(){
   var value=$('#insuranceamount').val();
   var value1=$('#amccost').val();
   if(value.length==0){
	   $('#insuranceamount').val("0");
   }
   else if(value1.length==0){
	   $('#amccost').val("0");
   }
});
$("#quantity").change(function(){
	   var value=$('#quantity').val();
	   if(value.length==0){
		   $('#quantity').val("1");
	   }
	});
$( "#form" ).submit(function( event ) {
	 return confirm("CONFIRM SUBMISSION?");
	});
</script>
<script>
$(document).ready(function()
        {
	
	

	
	<%if(request.getAttribute("msg")!=null){%>
	   $('#myModal').modal('show');
	   <%}%>
	
	   $('#quantity, #rate').keyup(function(){
		   var rate = parseFloat($('#rate').val()) || 0;
		   var quantity = parseFloat($('#quantity').val()) || 0;
		     var amount = parseFloat($('#amount').val()) || 0;
	        $('#amount').val(rate * quantity);    
	    });
	 
	 $('#amount').keyup(function(){
		 var rate = parseFloat($('#rate').val()) || 0;
		  var quantity = parseFloat($('#quantity').val()) || 0;
		     var amount = parseFloat($('#amount').val()) || 0;
	        $('#rate').val(amount/quantity);    
	    });
	  var date=new Date();
	  var yr=date.getFullYear();
	$('#year').value(yr);
	$('.submitform').submit(function() {
	   
	    var id=$(this).attr('id');
		 $.ajax
	     ({
	       
	        url: id+".adbl",
	        cache: false,
	        success: function(html)
	        {
	        $(".view").html(html);
	        } 
	        });
	});
});

</script>
</html>
