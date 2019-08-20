$(document).on('turbolinks:load', function() {

    $('.new_address').on('click', function(){
    	$('.new_address').hide();
    	$('.confirmation_btn').hide();
    	$('.address_writing').show();

    	$('.order_confirmation_container').on('mouseover',function() {
	    $('.no_link').show();
	      return false;
		   });
		  $('.order_confirmation_container').on('mouseout',function() {
		    $('.no_link').hide();
		        return false;
	     });
    });
});