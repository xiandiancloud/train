$(document).ready(function() {	    
		var new_subsection=function ()
		{
			var ele=$(this).parent().parent().prev().children().last();
			ele.toggle();
		};
		
		var new_section=function ()
		{
			var ele=$(".new-section");
			ele.toggle();
		};
		
		
		var all_drag_or_drop=function ()
		{
			var ele=$('.button-toggle-expand-collapse').children().children();
			var span=ele.last();
			var i=ele.first();
			if(span.html()==="折叠所有章节"){
				$('.outline-section').addClass("is-collapsed");
				span.html("展开所有章节");
				i.removeClass().addClass("icon-arrow-down");
			}
			else{
				$('.outline-section').removeClass("is-collapsed");
				span.html("折叠所有章节");
				i.removeClass().addClass("icon-arrow-up");
			}			
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
		
		var hide=function(){
			//var ele=$(".new-subsection");
			var ele=$(this).parent().parent().parent().parent();
			ele.hide();
		};
				
		var show_div=function(){
			$("#contain").css("height",$(document).height());  
	        $("#contain").css("width",$(document).width());  
	        $("#contain").show();
			var win = $("#dialog");
			var left=($(window).width() - win.width())/2 + $(document).scrollLeft();
			var top=($(window).height() - win.height())/2 + $(document).scrollTop();
			win.css("left",left).css("top",top);
			win.show();
		};
			
		//this.addButtonActions($('#content'));
		//$('.configure-button').bind('click', show_div);
		$('.new-section-name-cancel').bind('click', hide);
		$('.new-subsection-name-cancel').bind('click', hide);
		$('.button-new-section').bind('click', new_section);
		$('.button-new-subsection').bind('click', new_subsection);
		$('.section-header-details').bind('click', section_drag_or_drop);
		$('.subsection-header-details').bind('click', subsection_drag_or_drop);
		$('.button-toggle-expand-collapse').bind('click', all_drag_or_drop);
		
});

