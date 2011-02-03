isPocket=false;
isTab=false;
isIphone = false;
isAndriod = false;
        
$(document).ready(function(){
        testDevice()
            })


    function testDevice(){


    // handle orientation change event
    if (window.orientation != undefined){
        isPocket=true;
        isTab = true;
        window.onorientationchange = updateView;
    }
    else{
        if($(window).width() <=500 ){
            isPocket=true;
            $("body").addClass("mobile");
        }
    }
    var browser = navigator.userAgent.toLowerCase()

        // add CSS enhancements for anything other than ie
        if((browser.indexOf('msie')==-1) )
            {
                var link = $("<link>").attr({type: 'text/css',rel: 'stylesheet',href: '/css/enhanced.css'});
                $("head").append( link );       
            }
    // add CSS enhancements for iphone, not ipad
    if ((browser.indexOf('iphone') != -1) && (browser.indexOf('ipad')==-1)){
        isIphone = true;
        isPocket=true;
        var link = $("<link>").attr({type: 'text/css',rel: 'stylesheet',href: '/css/iphone.css'});
        $("head").append( link );
                
    }
    // add CSS enhancements for andriod smartphones
    if ((browser.indexOf('android') != -1) && (browser.indexOf('sch-i800') == -1)) {
        isAndriod = true;
        isPocket=true;
        var link = $("<link>").attr({type: 'text/css',rel: 'stylesheet',href: '/css/android.css'});
        $("head").append( link ); 
    }
    // ipad, galaxy tab
    if((browser.indexOf('ipad')>0)||(browser.indexOf('sch-i800') >0)){
        isTab = true;
        isPocket=false;
    }
    else{
        isTab = false;
    }
        

    if(isPocket || isTab){
        

        if(!isTab){
            $("body").addClass("mobile");
            $(".back").html(function(){return $(this).html().substring(0,4)});
            $(".back").next("h1").css({padding:"15px  0 0 8px"})
                $(".prompt").css({paddingLeft:"8px",textAlign:"left"})
                }
        else{
            $("body").addClass("tab");
        }
                
                
        if (window.addEventListener) {   
            window.addEventListener('load', function(){
                    updateView();
                    setTimeout(scrollTo, 0, 0, 1);
                }, false)
                return true;    
        } 
        else if (window.attachEvent) {   
            window.attachEvent('on' + 'load', function(){
                    updateView();
                    setTimeout(scrollTo, 0, 0, 1);
                }, false);   
        }
    }
        

}
        
// device rotation for smartphones
function updateView(){
    if (isPocket || isTab){

        if(window.orientation != undefined){
            if (window.orientation != 0){
                $("body").addClass("landscape");
            }
            else{
                $("body").removeClass("landscape");
            }
        }
        else if($(window).width()<$(window).height()){
            $("body").addClass("landscape");
        }
        else{
            $("body").removeClass("landscape");
        }
                
    }
}
