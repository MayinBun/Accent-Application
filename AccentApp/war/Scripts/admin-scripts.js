jQuery(function () { 
	
	$( document ).ready(function() {
		 
		$( "#img" ).click(function( event ) {
	        loadPopupBox();
	    });
		
		$('#popcancel').click( function() {
			unloadPopupBox();
		});
		
		function loadPopupBox() {    // To Load the Popupbox
            $('#popup_box').fadeIn("slow");
		}
		
		function unloadPopupBox(){
			$('#popup_box').fadeOut("slow");
		}
		
	});		
		 
});
//////////Popup leerling toevoegen////////	 