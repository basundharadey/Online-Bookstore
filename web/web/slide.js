/* Created by Debashis Biswas (gotechwithme@gmail.com) */

window.addEvent('domready', function() {
	var status = {
		'true': 'Read less...',
		'false': 'Read more...'
	};
	
	//-vertical

	var myVerticalSlide = new Fx.Slide('read_more_content');

	myVerticalSlide.slideOut();
	
	$('read_more_button').addEvent('click', function(e){
		e.stop();
		myVerticalSlide.toggle();
	});

	// When Vertical Slide ends its transition, we check for its status
	// note that complete will not affect 'hide' and 'show' methods
	myVerticalSlide.addEvent('complete', function() {
		$('read_more').set('html', status[myVerticalSlide.open]);
	});
});

/* Created by Debashis Biswas (gotechwithme@gmail.com) */