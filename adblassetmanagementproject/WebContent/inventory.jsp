<%@page import='java.sql.*'%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
ResultSet branchdb=(ResultSet) session.getAttribute("userdetail");
InventoryDao i=new InventoryDaoImpl();
ResultSet inventory=(ResultSet) i.getinventorydata(branchdb.getString("branchdb")); %>
<div class="panel panel-default" style="width: 100%; margin: auto;">
    <div class="panel-heading">
        <h3>
            <strong>INVENTORY</strong>
        </h3>
    </div>
    <div class="panel-body">
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" data-target="#menu1">View
                        Inventory</a></li>
                <li><a data-toggle="tab" data-target="#menu2">Add Inventory</a></li>
            </ul>
            <div class="tab-content">
                <div id="menu1" class="tab-pane fade in active">
                    <div class="panel panel-default" style="width: 90%;">
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
                                        <td><%=inventory.getString("itemcode") %></td>
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
                <div id="menu2" class="tab-pane fade">
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
                        <li><a data-toggle="tab" data-target="#5">Vehicle Details</a></li>
                        
                    </ul>
                    <div class="tab-content">
                        <div id="1" class="tab-pane fade in active">
                            <form method="post" action="" id="form">
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
                                                <h5>Group Code</h5> <input type="text" name="groupcode"
                                                class="form-control"  form="form">
                                            </td>
                                            <td>
                                                <h5>Item namee</h5> <input type="text" name="itemname"
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
                                                name="desisiondateen" class="form-control" id="englishDate1"
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
                                            <h5>Fund Source</h5> <select class="form-control"
                                            name="fundsource"  form="form">
                                                <option>1</option>
                                        </select>
                                        </td>
                                        <td>
                                            <h5>Unit Name</h5> <input type="text" name="unitname"
                                            class="form-control" form="form"><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Rate</h5> <input type="text" name="rate"
                                            class="form-control">
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
                                    <tr>
                                        <td>
                                            <h5>Item Size</h5> <input type="text" name="itemsize"
                                            class="form-control"  form="form">
                                        </td>
                                        <td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="3" class="tab-pane fade in">
                            <form method="" action="" id="form"></form>
                            <table class="table" style="width: 80%;">
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
                                            name="companyid">
                                                <option>Company</option>
                                        </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                        </div>
                        <div id="4" class="tab-pane fade in">
                            <table class="table" style="width: 80%;">
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
                                            <h5>Insurance Start (B.S.)</h5> <input type="text"
                                            name="insuranceend" class="form-control" id="nepaliDate6"
                                            placeholder="YYYY-MM-DD"  form="form">
                                        </td>
                                        <td>
                                            <h5>Insurance Start (B.S.)</h5> <input type="text"
                                            name="insuranceenden" class="form-control" id="englishDate6"
                                            placeholder="YYYY-MM-DD"  form="form">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h5>Premium Amount</h5> <input type="text"
                                            name="insurancepremuimamount" class="form-control"  form="form">
                                        </td>
                                        <td>
                                            <h5>Company Name</h5> <select class="form-control"
                                            name="companyid"  form="form">
                                                <option>Company</option>
                                        </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                        </div>
                        <div id="5" class="tab-pane fade in">
                            
                            <table class="table" style="width: 80%;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <h5>Vehicle No.</h5> <input type="text" name="vehicleno"
                                            class="form-control" form="form">
                                        </td>
                                    </tr>
                                    <tr>
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
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(document).ready(function() {
   $('#example').DataTable();
} );
</script>
<script src="assets/js/dateConverter.js"></script>
