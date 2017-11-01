<%@page import="java.sql.*"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
InventoryDao i=new InventoryDaoImpl(branchdb.getString("branchdb"));
ResultSet supplier=(ResultSet) i.getcompanylist();
ResultSet companylist1=(ResultSet) i.getcompanylist();
ResultSet companylist2=(ResultSet) i.getcompanylist();
ResultSet fundsource=(ResultSet) i.getfundsourcelist();
ResultSet itemcondition=(ResultSet) i.getitemcondition();
ResultSet group=(ResultSet) i.getgroup();%>
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
                <li class="active"><a data-toggle="tab" data-target="#menu2">Add Inventory</a></li>
            </ul>
            <div class="tab-content">
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
                            <form method="post" action="addinventory.adbl" id="form">
                            <input type="hidden" name="inventory" value="/inventory" form="form">
                            <input type="hidden" value="<%=branchdb.getString("branchdb")%>" name="branchdb">
                                <table class="table" style="width: 80%;">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <h5>Legacy Id</h5> <input type="text" name="legacyid"
                                                class="form-control"  form="form">
                                            </td>
                                            <td>
                                                <h5>Item code</h5> <input type="text" name="itemcode"
                                                class="form-control"  form="form">
                                            </td>
                                            <td>
                                                <h5>Transaction Id</h5> <input type="text"
                                                name="transactionid" class="form-control"  form="form">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Group Name</h5>
                                                <select class="form-control" name="groupcode" form="form">
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
                                                placeholder="YYYY-MM-DD"  form="form">
                                            </td>
                                            <td>
                                                <h5>Decision Date (A.D.)</h5> <input type="text"
                                                name="decisiondateen" class="form-control" id="englishDate1"
                                                placeholder="YYYY-MM-DD"  form="form">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Purchase Date (B.S.)</h5> <input type="text"
                                                name="purchasedate" class="form-control" id="nepaliDate2"
                                                placeholder="YYYY-MM-DD"  form="form"> 
                                            </td>
                                            <td>
                                                <h5>Purchase Date (A.D.)</h5> <input type="text"
                                                name="purchasedateen" class="form-control" id="englishDate2"
                                                placeholder="YYYY-MM-DD"  form="form">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h5>Depreciation Rate</h5> <input type="text"
                                                name="depreciationrate" class="form-control"  form="form">
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
                                            name="supplierid"  form="form">
                                                <option value="" selected>Select supplier</option>
                                                <%while(supplier.next()){%>
                                                	<option value="<%=supplier.getString("companyid") %>"><%=supplier.getString("companyname") %></option>
                                                <%}%>
                                        </select>
                                        </td>
                                		<td>
                                            <h5>Fund Source</h5> <select class="form-control"
                                            name="fundsource"  form="form">
                                                <option value="" selected>Select fund source</option>
                                                <%while(fundsource.next()){%>
                                                	<option value="<%=fundsource.getString("fundsourceid") %>"><%=fundsource.getString("sourcename") %></option>
                                                <%}%>
                                        </select>
                                        </td>
                                        <td>
                                            <h5>Item Condition</h5> <select name="itemconditionid"
                                            class="form-control"  form="form" >
                                            	<option value="">None Selected</option>
                                            	<%while(itemcondition.next()){ %>
                                            	<option value="<%=itemcondition.getString("itemconditionid")%>"><%=itemcondition.getString("itemconditionname") %></option>
                                            	<%} %>
                                            </select>
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
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Rate</h5> <input type="text" name="rate"
                                            class="form-control" form="form">
                                        </td>
                                        <td>
                                            <h5>Quantity</h5> <input type="text" name="quantity"
                                            class="form-control"  form="form">
                                        </td>
                                        <td>
                                            <h5>Amount</h5> <input type="text" name="amount"
                                            class="form-control"  form="form">
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
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="nepaliDate3">
                                        </td>
                                        <td>
                                            <h5>AMC Start (A.D.)</h5> <input type="text"
                                            name="amcstarten" class="form-control"
                                            placeholder="YYYY-MM-DD"  form="form" id="englishDate3">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>AMC End (B.S.)</h5> <input type="text" name="amcend"
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="nepaliDate4">
                                        </td>
                                        <td>
                                            <h5>AMC End (A.D.)</h5> <input type="text" name="amcenden"
                                            class="form-control" placeholder="YYYY-MM-DD"  form="form" id="englishDate4">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>AMC Cost</h5> <input type="text" name="amccost"
                                            class="form-control"  form="form">
                                        </td>
                                        <td>
                                            <h5>Company Name</h5> <select class="form-control"
                                            name="amccompanyid" form="form">
                                                <option value="" selected>Select Company</option>
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
                                            placeholder="YYYY-MM-DD"  form="form">
                                        </td>
                                        <td>
                                            <h5>Insurance Start (A.D.)</h5> <input type="text"
                                            name="insurancestarten" class="form-control" id="englishDate5"
                                            placeholder="YYYY-MM-DD"  form="form">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Insurance End (B.S.)</h5> <input type="text"
                                            name="insuranceend" class="form-control" id="nepaliDate6"
                                            placeholder="YYYY-MM-DD"  form="form">
                                        </td>
                                        <td>
                                            <h5>Insurance End (A.D.)</h5> <input type="text"
                                            name="insuranceenden" class="form-control" id="englishDate6"
                                            placeholder="YYYY-MM-DD"  form="form">
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
                                              <option value="" selected>Select Company</option>
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
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="nepaliDate7">
                                        </td>
                                        
                                        <td>
                                            <h5>Warranty Start (A.D.)</h5> <input type="text" name="warrantystarten"
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="englishDate7">
                                        </td>
                                        </tr>
                                        <tr>
                                        <td>
                                            <h5>Warranty Start (B.S.)</h5> <input type="text" name="warrantyend"
                                            class="form-control" form="form" placeholder="YYYY-MM-DD" id="nepaliDate8">
                                        </td>
                                         <td>
                                            <h5>Warranty End (A.D.)</h5> <input type="text" name="warrantyenden"
                                            class="form-control"  form="form" placeholder="YYYY-MM-DD" id="englishDate8">
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
    </div>
</div>
<script>
$("#insuranceamount").change(function(){
   var value=$('#insuranceamount').val();
   if(value.length==0){
	   $('#insuranceamount').val("0");
   }
});
$( "#form" ).submit(function( event ) {
	 return confirm("CONFIRM SUBMISSION?");
	});
</script>
<script src="assets/js/dateConverter.js"></script>