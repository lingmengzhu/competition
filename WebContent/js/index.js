
$(function(){
	$(".nava").load("nava.jsp")
	$(".header").load("header.jsp")
	$(".bottom").load("footer.jsp")
}
);

function a1(){
	     $(".formBox1").css("display","");
		 $(".formBox").css("display","none");
		 $(".formBox3").css("display","none");
		 $(".formBox2").css("display","none");
		 $("#a1").addClass("active");
		 $("#a").removeClass("active");
		 $("#a2").removeClass("active");
		 $("#a3").removeClass("active");
}
function a(){
		 $(".formBox").css("display","");
		 $(".formBox2").css("display","none");
		 $(".formBox1").css("display","none");
		 $(".formBox3").css("display","none");
		 $("#a").addClass("active");
		 $("#a1").removeClass("active");
		 $("#a2").removeClass("active");
		 $("#a3").removeClass("active");	 
}
function a2(){
	 $(".formBox2").css("display","");
	 $(".formBox").css("display","none");
	 $(".formBox1").css("display","none");
	 $(".formBox3").css("display","none");
	 $("#a2").addClass("active"); 
	 $("#a").removeClass("active");
	 $("#a1").removeClass("active");
	 $("#a3").removeClass("active");
	 
}
function a3(){
	 $(".formBox3").css("display","");
	 $(".formBox2").css("display","none");
	 $(".formBox").css("display","none");
	 $(".formBox1").css("display","none");
	 $("#a3").addClass("active"); 
	 $("#a").removeClass("active");
	 $("#a1").removeClass("active");
	 $("#a2").removeClass("active");
	 
}

$(function(){

	$(".section ul li .rsp").hide();

	$(".section	 ul li").hover(function(){

		$(this).find(".rsp").stop().fadeTo(500,0.5)

		$(this).find(".text").stop().animate({left:'0'}, {duration: 500})

	},function(){

		$(this).find(".rsp").stop().fadeTo(500,0)

		$(this).find(".text").stop().animate({left:'318'}, {duration: "fast"})

		$(this).find(".text").animate({left:'-318'}, {duration: 0})

	});

});

$(".pagination li").click(function(){
	$(".pagination li").removeClass("active");
	$(this).addClass("active");
});