$(document).on('turbolinks:load', function() {

    $('.new_address').on('click', function(){
    	$('.new_address').addClass('hidden');
    	$('.confirmation_btn').addClass('hidden');
    	$('.address_writing').removeClass('hidden');

    	$('.order_confirmation_container').on('mouseover',function() {
	    $('.no_link').show();
	      return false;
		   });
		  $('.order_confirmation_container').on('mouseout',function() {
		    $('.no_link').hide();
		        return false;
	     });
		  });

		  $('.credit_card').on('click', function(){
	    	$('.credit_card_button').removeClass('hidden');
	    });
	    $('.not_credit_card').on('click', function(){
	    	$('.credit_card_button').addClass('hidden');
	    });
});