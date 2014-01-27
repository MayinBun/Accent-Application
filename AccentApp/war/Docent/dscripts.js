jQuery(function () { 
	
//////////Popup leerling toevoegen////////
	
	$('.+img').click(function(){
		alert("hello");
		loadPopupBox();
		
	});
	
	$('.popinkomen').keyup(function(){
		var inkomen = $('.popinkomen').val();
		$("#bruto").html(inkomen.toString());
		
	});
	
	$('#popcancel').click( function() {
		unloadPopupBox();
	});
		 function loadPopupBox() {    // To Load the Popupbox
	            $('#popup_box').fadeIn("slow");
		 };
		 
		 
		 function unloadPopupBox() {    // TO Unload the Popupbox
	            $('#popup_box').fadeOut("slow");
		 };
})