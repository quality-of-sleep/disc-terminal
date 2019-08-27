$(document).on('turbolinks:load', function() {
	var _window = $(window),
	    _praiceBox = $('.table-bordered'),
	    heroBottom;

	_window.on('scroll',function(){
	    heroBottom = $('.hero').outerHeight(true);
	    if(_window.scrollTop() > heroBottom){
	        _praiceBox.addClass('fixed');
	    }
	    else{
	        _praiceBox.removeClass('fixed');
	    }
	});

	_window.trigger('scroll');
});