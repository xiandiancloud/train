$(document).ready(function() {	    
		var show_or_hide=function ()
		{
			target=document.getElementById('test_subsection');
            if (target.style.display=="block"){
                //target.style.display="none";
            	alert("refreash!");
            } else {
                target.style.display="block";
            }
		};
		
		var section_drag_or_drop=function ()
		{
			var ele=$('.outline-section');
			if(!ele.hasClass("is-collapsed")){
				ele.addClass("is-collapsed");
			}
			else
				ele.removeClass("is-collapsed");
		};
		
		var subsection_drag_or_drop=function ()
		{
			var ele=$('.outline-subsection');
			if(!ele.hasClass("is-collapsed")){
				ele.addClass("is-collapsed");
			}
			else
				ele.removeClass("is-collapsed");
		};
	
		//this.addButtonActions($('#content'));
		$('.button-new-subsection').bind('click', show_or_hide);
		$('.section-header-details').bind('click', section_drag_or_drop);
		$('.subsection-header-details').bind('click', subsection_drag_or_drop);
});

