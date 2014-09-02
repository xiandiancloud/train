$(document).ready(function() {	    
		var new_subsection=function ()
		{
			var ele=$(this).parent().parent().prev().children().last();
			ele.toggle();
		};
		
		var new_section=function ()
		{
			//var ele=$(this).parent().prev();
			var ele=$(".new-section");
			//alert(ele.attr("class"));
			ele.toggle();
		};
		
		var section_drag_or_drop=function(event)
		{
			var ele=$(this).parent().parent();//$('.outline-section');
			if(!ele.hasClass("is-collapsed")){
				ele.addClass("is-collapsed");
			}
			else
				ele.removeClass("is-collapsed");
		};
		
		var subsection_drag_or_drop=function ()
		{
			var ele=$(this).parent().parent();//var ele=$('.outline-subsection');
			if(!ele.hasClass("is-collapsed")){
				ele.addClass("is-collapsed");
			}
			else
				ele.removeClass("is-collapsed");
		};
			
		//this.addButtonActions($('#content'));
		$('.button-new-section').bind('click', new_section);
		$('.button-new-subsection').bind('click', new_subsection);
		$('.section-header-details').bind('click', section_drag_or_drop);
		$('.subsection-header-details').bind('click', subsection_drag_or_drop);
		
});

