//-------------------------------------------DATE CONVERTER---------------------
		$('#englishDate1').change(function(){
			$('#nepaliDate1').val(AD2BS($('#englishDate1').val()));
		});

		$('#nepaliDate1').change(function(){
			$('#englishDate1').val(BS2AD($('#nepaliDate1').val()));
		});
		$('#englishDate2').change(function(){
			$('#nepaliDate2').val(AD2BS($('#englishDate2').val()));
		});

		$('#nepaliDate2').change(function(){
			$('#englishDate2').val(BS2AD($('#nepaliDate2').val()));
		});
		$('#englishDate3').change(function(){
			$('#nepaliDate3').val(AD2BS($('#englishDate3').val()));
		});

		$('#nepaliDate3').change(function(){
			$('#englishDate3').val(BS2AD($('#nepaliDate3').val()));
		});
		
		$('#nepaliDate4').change(function(){
			$('#englishDate4').val(BS2AD($('#nepaliDate4').val()));
		});
		$('#englishDate4').change(function(){
			$('#nepaliDate4').val(AD2BS($('#englishDate4').val()));
		});

		$('#nepaliDate5').change(function(){
			$('#englishDate5').val(BS2AD($('#nepaliDate5').val()));
		});
		$('#englishDate5').change(function(){
			$('#nepaliDate5').val(AD2BS($('#englishDate5').val()));
		});

		$('#nepaliDate6').change(function(){
			$('#englishDate6').val(BS2AD($('#nepaliDate6').val()));
		});
		$('#englishDate6').change(function(){
			$('#nepaliDate6').val(AD2BS($('#englishDate6').val()));
		});

		$('#nepaliDate7').change(function(){
			$('#englishDate7').val(BS2AD($('#nepaliDate7').val()));
		});
		$('#englishDate7').change(function(){
			$('#nepaliDate7').val(AD2BS($('#englishDate7').val()));
		});

		$('#nepaliDate8').change(function(){
			$('#englishDate8').val(BS2AD($('#nepaliDate8').val()));
		});
		$('#englishDate8').change(function(){
			$('#nepaliDate8').val(AD2BS($('#englishDate8').val()));
		});

		$('#nepaliDate9').change(function(){
			$('#englishDate9').val(BS2AD($('#nepaliDate9').val()));
		});
		$('#englishDate9').change(function(){
			$('#nepaliDate9').val(AD2BS($('#englishDate9').val()));
		});

		$('#nepaliDate10').change(function(){
			$('#englishDate10').val(BS2AD($('#nepaliDate10').val()));
		});
		$('#englishDate10').change(function(){
			$('#nepaliDate10').val(AD2BS($('#englishDate10').val()));
		});

		$('#nepaliDate11').change(function(){
			$('#englishDate11').val(BS2AD($('#nepaliDate11').val()));
		});
		$('#englishDate11').change(function(){
			$('#nepaliDate11').val(AD2BS($('#englishDate11').val()));
		});

		$('#nepaliDate12').change(function(){
			$('#englishDate12').val(BS2AD($('#nepaliDate12').val()));
		});
		$('#englishDate12').change(function(){
			$('#nepaliDate12').val(AD2BS($('#englishDate12').val()));
		});

		$('#nepaliDate13').change(function(){
			$('#englishDate13').val(BS2AD($('#nepaliDate13').val()));
		});
		$('#englishDate13').change(function(){
			$('#nepaliDate13').val(AD2BS($('#englishDate13').val()));
		});
		$('#nepaliDate14').change(function(){
			$('#englishDate14').val(BS2AD($('#nepaliDate14').val()));
		});
		$('#englishDate14').change(function(){
			$('#nepaliDate14').val(AD2BS($('#englishDate14').val()));
		});
		
//---------------------------------------AUTO - ON DATE TYPING------------------------
		$("#nepaliDate1,#nepaliDate2,#nepaliDate3,#nepaliDate4,#nepaliDate5,#nepaliDate6,#nepaliDate7,#nepaliDate8,#nepaliDate9,#nepaliDate10,#nepaliDate11,#nepaliDate12,#nepaliDate13,#nepaliDate14, #englishDate1,#englishDate2,#englishDate3,#englishDate4,#englishDate5,#englishDate6,#englishDate7,#englishDate8,#englishDate9,#englishDate10,#englishDate11,#englishDate12,#englishDate13,#englishDate14").keyup(function(){
	           if ($(this).val().length == 4){
	               $(this).val($(this).val() + "-");
	           }else if ($(this).val().length == 7){
	               $(this).val($(this).val() + "-");
	           }
	       });
