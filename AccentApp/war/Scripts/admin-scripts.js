/*jQuery(function () { 
	
	$( document ).ready(function() {
		
		$( "#imgw" ).click(function( event ) {
	        loadPopupBox2();
	    });
		
		$('#popcancel2').click( function() {
			unloadPopupBox2();
		});
		 
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
		
		function loadPopupBox2() {    // To Load the Popupbox
            $('#popup_box2').fadeIn("slow");
		}
		
		function unloadPopupBox2(){
			$('#popup_box2').fadeOut("slow");
		}
		
	});		
		 
});
//////////Popup leerling toevoegen////////	 