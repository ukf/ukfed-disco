// adds the tooltips into the page. 
// Version: 1.0 26/11/09
// Author: Jon Jones (jon@s8080.com)


(function($) {
 
   $.fn.toolTip = function(options) {
     var defaults = {xhtml: '<div class="tool-tip" ><div><div class="tool-title"></div><div class="tool-text"></div></div></div>',title:'',text:''};
	 var options = $.extend(defaults, options);

	 var tipTitle,tipBody;	
	 $("body").append(options.xhtml);
     this.each(function(i) {


			

 		$(this).focus(function(e){
			 var o = options;
			getContent(this,o);
			$(this).attr("title","");
			
			var X = 550;
			var Y = 100 ;

			var relX = e.pageX - this.offsetLeft;
			var relY = e.pageY - this.offsetTop;

			$(".tool-title").text(o.title);
			$(".tool-text").html(o.text.replace(/[:,]/gi,"<br/>"));
			if ($(this).attr("rel")){$(".tool-text").html($(".tool-text").html() + "<img src='"+ $(this).attr("rel") +"' alt='' />")}
			$(".tool-tip").css({'top':Y+5 +'px','left':X+5 +'px','position':'absolute'}).fadeIn("fast");
		});		

	  	$(this).focusout(function(e){
			$(".tool-tip").fadeOut("fast");
			$(this).attr("title",options.title +"::"+options.text)
		});
	  	
		$(this).mouseenter(function(e){
			 var o = options;
			getContent(this,o);
			$(this).attr("title","");
			
			var X = e.pageX ;
			var Y = e.pageY ;
			var relX = e.pageX - this.offsetLeft;
			var relY = e.pageY - this.offsetTop;

			$(".tool-title").text(o.title);
			$(".tool-text").html(o.text.replace(/[:,]/gi,"<br/>"));
			if ($(this).attr("rel")){$(".tool-text").html($(".tool-text").html() + "<img src='"+ $(this).attr("rel") +"' alt='' />")}
			$(".tool-tip").css({'top':Y+5 +'px','left':X+5 +'px','position':'absolute'}).fadeIn("fast");
		});
	  
	  	$(this).mouseleave(function(e){
			$(".tool-tip").fadeOut("fast");
			$(this).attr("title",options.title +"::"+options.text)
		})
		
		$(this).mousemove(function(e){
			var X = e.pageX ;
			var Y = e.pageY ;
			var relX = e.pageX - this.offsetLeft;
			var relY = e.pageY - this.offsetTop;
			$(".tool-tip").css({'top':Y+5 +'px','left':X+5 +'px'})
		})
	  

     });
	function getContent(obj,opts){
	if(opts.text == ""){
	//opts.title = "";
		if ($(obj).attr("title").indexOf("::") >=0){
			opts.title = $(obj).attr("title").split("::")[0];
			opts.text = $(obj).attr("title").split("::")[1];
			}
		else{
			opts.title = "";
			opts.text = $(obj).attr("title")

			}
		}
	  }
     return this;
 
   };
 
 })(jQuery);
 
