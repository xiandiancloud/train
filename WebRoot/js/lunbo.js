$(document).ready(function(){
/*	//3个div的统一class = 'div'
	var index =0;
	//3秒轮播一次
	var timer = setInterval(function(){
	    index = (index == 1) ? 0 : index + 1;          
	    //某个div显示，其他的隐藏
	    $(".oneByOne_item").hide().eq(index).show();    
	}, 3000);*/
	(function(){
		
		$(".pagination .course").click(function(){
			var index = $(this).children().html()-1;
			$(".oneByOne_item").hide().eq(index).show();
			$(".active").removeClass("active");
			$(this).addClass("active");
		});
		
		$(".pagination .prev").click(function(){
			var index = $(".active").children().html()-1;
			var length = $(".course").length;
			if(index<0)
				index=length-1;
			else
				index=index-1;
			$(".oneByOne_item").hide().eq(index).show();
			$(".active").removeClass("active");
			$(".pagination .course").eq(index).addClass("active");
			//alert(index);
			//$(this).addClass("active");
		});
		
		$(".pagination .next").click(function(){
			var index = $(".active").children().html()-1;
			var length = $(".course").length;
			if(index+1==length)
				index=0;
			else
				index=index+1;
			$(".oneByOne_item").hide().eq(index).show();
			$(".active").removeClass("active");
			$(".pagination .course").eq(index).addClass("active");
			//alert(index);
			//$(this).addClass("active");
		});
		
	})();
});