<script>
$(document).ready(function() {
	 var t=$('#datatableaa').DataTable( {
	        
	        "ajax": "viewDep.adbl",
	        "columns":[
	        	{"data":"rate"},
	        	{  "targets": 0,
	        	    "data": "itemcode",
	        	    "render": function ( data, type, row, meta ) {
	        	      return '<a href="editinventory.click?id='+data+'">'+data+'</a>';
	        	    }
	        	},
	        	{"data":"itemname"},
	        	{"data":"rate"},
	        	{"data":"lastyrdep"},
	        	
	        	{"data":"curyrdep"},
	        	
	        	{"data":"totaldep"},
	        	{"data":"balance"},
	        	{"orderable":false,
				"searchable":false,
				"render":function(data, type,row, meta) {return '<a class="a" href="editDepreciation.click?id='+row.did+'&itemcode='+row.itemcode+'&lastyrdep='+row.lastyrdep+ '">Edit</a>';}
				},
	        ]
	    } );
	 t.on( 'order.dt search.dt', function () {
	        t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
	            var c=cell.innerHTML = i+1;
	            $('.count').val(c);
	        } );
	    } ).draw();
} );
</script>