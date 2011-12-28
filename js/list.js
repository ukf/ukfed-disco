// persistance of cookie in days:
var expires=14;

$(document).ready(function(){

        if (typeof isPocket == "undefined"){
            isPocket = false;isTab = false;isIphone = false;isAndroid = false
                                                                }
        
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
        
        // demonstration function to retrieve document location (lat,long)
        // assuming lat,long info available for each idp or idp region
        // where the drop list items are sorted by locality to the user     
        //getLocation();
        
        // ajust the display and styling for capable devices
        // desktop version works without this call

        //$(".subheading").html(navigator.userAgent)
        // ajust the wording for smartphones to expand tooltip content
        // remove second option of choosing from a list- autosuggest disabled for smartphones
        if ((isIphone||isAndriod) &&(isPocket)){
            $(".subheading").html("Your organisation could be your School Network provider, College, University, Local authority or research Institution.<br/><br/>Choose your organisation and continue.")
                $(".assist").after($(".assist a:eq(0)").addClass("help")).remove();

        }

        if (!isPocket) {
            // enable tooltips
            $(".tooltip").toolTip({'title':"",'text':$("#intro").html()})
                $(".tooltip").attr("tabindex","1");
        }

        
        // form submission 
        $("#submit-btn").click(function(e){


                if ($("#combobox").val() != ''){
                    // user has made a specific selection from the list
                    // record the hint  

                    var newURL = theURL + encodeURIComponent($("#combobox").val());
                    location.href=newURL;
                                
                }
                                
                return false;
            })
                
            // read hints form the cookie
            loadHints();
                
                

    })
