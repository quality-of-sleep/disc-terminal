$(document).on('turbolinks:load', function() {
	var _window = $(window),
	    _praiceBox = $('.genre-table'),
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