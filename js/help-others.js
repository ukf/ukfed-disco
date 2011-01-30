
$(document).ready(function(){	

if (typeof isPocket == "undefined"){
	isPocket = false;isTab = false;isIphone = false;isAndroid = false
}

	$("dt").wrapInner($("<a/>").attr("href","#"))
	
	$('dd').hide();
	$('dt a').click(function(e)	{
		e.preventDefault();
		$(this).parent().next().slideToggle();
		$(this).parent().toggleClass('open');
		
	});
	
	if(!isPocket && !isTab){
		$("a").focus(function(){
			$("a").removeClass("focus")
			$(this).toggleClass("focus")
		});

		$("a").blur(function(){
			$(this).toggleClass("focus")
		});
		$("a").mousedown(function(){
			$(this).unbind("focus").removeClass("focus")
		}); 
	}
});
