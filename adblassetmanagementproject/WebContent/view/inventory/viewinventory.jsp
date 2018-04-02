<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import='com.adbl.daoimpl.InventoryDaoImpl'%>
<%@page import='com.adbl.dao.InventoryDao'%>
<%
InventoryDao i=new InventoryDaoImpl();
ResultSet group=(ResultSet) i.getgroup();
DecimalFormat f = new DecimalFormat("##.00");
%>
<jsp:include page="/includefile"></jsp:include>
<html>
<head>


</head>
<body class="background">
<div class="breadcrumb-line ">
	<nav aria-label="breadcrumb" role="navigation">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><i class="fa fa-home"
				aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Items</li>
			<li class="breadcrumb-item active" aria-current="page">View
				Inventory</li>
		</ol>
	</nav>
</div>
<div class="panel panel-default" style="width: 95%; margin: auto;">
	<div class="panel-heading ">
		<h5>
			<strong>Inventory Item Details</strong>
		</h5>
		
	</div>
	<div class="panel-heading count">
			Total Items <input type="text" form="form"
				style="width: 50px; height: 20px; text-align: center;"
				class="totalstock count" readonly> &nbsp
			<table cellpadding="3" cellspacing="0" border="0" class="pull-right">
				<tbody>
					<tr id="filter_col2" data-column="1">
						<td align="center"><select name="groupcode" form="form"
							class="column_filter form-control" id="col1_filter" required>
								<option value="" selected>Search By Group</option>
								<%while(group.next()){ %>

								<option value="<%=group.getString("groupcode")%>"><%=group.getString("groupname") %></option>

								<%} %>

						</select></td>
					</tr>
				</tbody>
			</table>

		</div>
	<div class="panel-body">
		<table id="datatableaa" class="table jambo_table table-striped table-bordered resulttable display nowrap" >
			<thead>
				<tr>
					<th>Item Code</th>
					<th>Transaction Id</th>
					<th>Group Code</th>
					<th>Item Name</th>
					<th>Model</th>
					<th>Purchase Date</th>
					<th>Rate</th>
					<!-- <th id="remove"><i class="fa fa-cog" aria-hidden="true"></i></th> -->
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Total</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body">
				<p>${msg }</p>
				<br>
				<%if(request.getAttribute("action")==null) {%>
				Updated Itemcode: ${inventory.updated_itemcode }<br> Item name:
				${inventory.itemname }<br>
				<%} %>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div> 
<script type="text/javascript">
		$(document).ready(function() {
			 $('#datatableaa').DataTable( {
				  "ajax": "inventoryList.adbl",
			        "columns":[
			        	{  "targets": 0,
			        	    "data": "itemcode",
			        	    "render": function ( data, type, row, meta ) {
			        	      return '<a href="editinventory.click?id='+data+'">'+data+'</a>';
			        	    }
			        	},
			        	{"data":"transactionid"},
			        	{"data":"groupcode"},
			        	{"data":"itemname"},
			        	{"data":"model"},
			        	{"data":"purchasedate"},
			        	{"data":"rate"},
			        ]
			    } );
			} );
		
		<%if(request.getAttribute("msg")!=null){%>
		   $('#myModal').modal('show');
		   <%}%>
		   
		   function filterGlobal () {
			    $('#example').DataTable().search(
			        $('#global_filter').val(),
			        $('#global_regex').prop('checked'),
			        $('#global_smart').prop('checked')
			        
			    ).draw();
			}
			 

			function filterColumn ( i ) {
			   $('#example').DataTable().column( i ).search(
			       $('#col'+i+'_filter').val(),
			       $('#col'+i+'_regex').prop('checked'),
			       $('#col'+i+'_smart').prop('checked')
			   ).draw();
			}
			
			  $('select.global_filter').on( 'keyup click', function () {
			        filterGlobal();
			    } );

			    $('select.column_filter').on( 'keyup click', function () {
			        filterColumn( $(this).parents('tr').attr('data-column') );
			 	  
			    } );
			    t.on( 'order.dt search.dt', function () {
			        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
			            var c=cell.innerHTML = i+1;
			            $('.count').val(c);
			        } );
			    } ).draw();
				
</script>
</body>
</html>
 <%-- 
		
		
		
</script>

<script>


$(document).ready(function() {
    var t = $('#datatableaa').DataTable( {
    	"scrollY":  "400px",
    	"scrollCollapse":  true,
    	"paging":  false,
    	"footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\Rs,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
            // Total over this page
            pageTotal = api
                .column( 7, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            $( api.column( 7 ).footer() ).html(
                'Rs '+pageTotal +' '
            );
           
        },
    	
    	dom:'Bfrtip',
    	buttons:[
    		
    		{
    			extend: 'print',
    			 messageTop: 'Asset Management System',
                exportOptions: {
                	 columns: [1, 2, 3,4,5,6,7,8 ]
                }
    		},
    		{
    			extend: 'pdfHtml5',
    			 messageTop: 'Asset Management System',
                exportOptions: {
                	 columns: [1, 2, 3,4,5,6,7,8 ]
                }
    		},
    		 {
                extend: 'excelHtml5',
                messageTop: 'Asset Management System',
                exportOptions: {
                	columns: [1, 2, 3,4,5,6,7,8 ]
                }
            }
    	],
        "columnDefs": [ {
            "searchable": false,
            "orderable": false,
            "targets": 0
        } ],
        "order": [[ 1, 'asc' ]],
   		 "iDisplayLength": 50
    } );
 
   
   
	
  
   
    
 } ); --%>
