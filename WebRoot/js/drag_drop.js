$(document).ready(function() { 
	(function (){

		
		/*var elems=$('.course-content');*/

/*            new Sortable(sections, {
				draggable: '.list-sections',
				handle: '.section-drag-handle',
				revert: true,
			});*/
			
		/*	[].forEach.call(sections.getElementsByClassName('section-content'), function (el){
				new Sortable(el, { group: 'photo' });
			});*/

			
			$( "#sections" ).sortable({
				//connectWith: ".column",
				handle: ".section-drag-handle",
			});
			
			$( ".section-content" ).sortable({
				connectWith: ".section-content",
				handle: ".subsection-drag-handle",
			});
			
			$( ".subsection-content" ).sortable({
				connectWith: ".subsection-content",
				handle: ".unit-drag-handle",
			});
		
	})();
});