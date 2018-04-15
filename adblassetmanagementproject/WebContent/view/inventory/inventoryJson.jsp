<script>
$(document).ready(function() {
	   
	 var t=$('#datatableaa').DataTable( {
		 
	 	
		 "processing": true,
		 "scrollX": true,
		 "scrollY":  "400px",
	    	"paging":  false,
	 
		  "ajax": "inventoryList.adbl",
		 
	        "columns":[
	        	{"data":"itemcode"},
	        	{  "targets": 1,
	        	    "data": "itemcode",
	        	    "render": function ( data, type, row, meta ) {
	        	      return '<a class="a" href="editinventorydisplay.click?id='+data+'">'+data+'</a>';
	        	    }
	        	},
	        	{"data":"transactionid"},
	        	{"data":"groupcode"},
	        	{"data":"itemname"},
	        	{"data":"model"},
	        	{"data":"purchasedate"},
	        	{"data":"rate"},
	        	{  "targets": 1,
	        	    "data": "itemcode",
	        	    "render": function ( data, type, row, meta ) {
	        	      return '<a  class="btn btn-default" data-toggle="confirmation" href="deleteinventory.del?itemcode='+data+'">Delete</a>';
	        	    }
	        	},
	        ],
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
	                    return (intVal(a) + intVal(b)).toFixed(2);
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
	                	 columns: [1, 2, 3,4,5,6,7 ]
	                }
	    		},
	    		{
	    			extend: 'pdfHtml5',
	    			 messageTop: 'Asset Management System',
	                exportOptions: {
	                	 columns: [1, 2, 3,4,5,6,7]
	                }
	    		},
	    		 {
	                extend: 'excelHtml5',
	                messageTop: 'Asset Management System',
	                exportOptions: {
	                	columns: [1, 2, 3,4,5,6,7 ]
	                }
	            }
	    	],
	        initComplete: function () {
	            this.api().columns([3,4]).every( function () {
	                var column = this;
	                var select = $('<select style="width:80%"><option value="">Search</option></select>')
	                    .appendTo( $(column.footer()).empty() )
	                    .on( 'change', function () {
	                        var val = $.fn.dataTable.util.escapeRegex(
	                            $(this).val()
	                        );
	 
	                        column
	                            .search( val ? '^'+val+'$' : '', true, false )
	                            .draw();
	                    } );
	 
	                column.data().unique().sort().each( function ( d, j ) {
	                    select.append( '<option value="'+d+'">'+d+'</option>' )
	                } );
	            } );
	        }
	    } );
	
	 t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            var c=cell.innerHTML = i+1;
	            $('.count').val(c);
	        } );
	    } ).draw();
	 
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