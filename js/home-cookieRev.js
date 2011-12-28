// persistance of cookie in days:
var expires=14;

$(document).ready(function(){

        if (typeof isPocket == "undefined"){
            isPocket = false;isTab = false;isIphone = false;isAndroid = false
        }

        handleCookies();

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
        // getLocation();
        
        // ajust the display and styling for capable devices
        // desktop version works without this call

        //$(".subheading").html(navigator.userAgent)
        // ajust the wording for smartphones to expand tooltip content
        // remove second option of choosing from a list- autosuggest disabled for smartphones
        if ((isIphone||isAndriod) &&(isPocket)){
            $(".subheading").html("Your organisation could be your School Network provider, College, University, Local authority or research Institution.<br/><br/>Choose your organisation and continue.")
                $(".assist").after($(".assist a:eq(0)").addClass("help")).remove()

                }

        // add autosuggest for desktop and tablets only
        if(!isPocket){
                
            // enable tooltips
            $(".tooltip").toolTip({'title':"",'text':$("#intro").html()})
                $(".tooltip").attr("tabindex","1")
                // demonstration datasource binds from the droplist items in to simple array
                var data = {items: []};
            $("#combobox option").each(function(){
                    data.items.push({value: $(this).val(), name: $(this).html()});
                });
            // hide the input field and disable the submit buton
            $("#combobox").after("<input tabindex=\"3\" type=\"text\"></input>").hide();
            $("#submit-btn").attr("disabled",true).attr("class","btn-disabled");
            // load the combobox with the array and set the search keys
            // then add ARIA flag and set the trigger for text change on the button                                     
            $("input[type=text]").autoSuggest(data.items, {selectedItemProp: "name", searchObjProps: "name, value"}).attr("aria-autocomplete","list").keypress(function(){$("#submit-btn").html("Search");$("#combobox").val("")
                                                                                                                                                                                                       });

            // form submission 
            $("#submit-btn").click(function(e){

                    if ($("#combobox").val() != ''){
                        
                        var newURL = theURL + encodeURIComponent($("#combobox").val());
                        location.href=newURL;
                        //
                        // and thats that
                        //
                    } else {
                        var as = $("#SearchInput");
                        if (as.val() != '') {
                            //
                            // convert the selection into a search
                            //
                            var newURL = theURL.replace("selection","search");
                            newURL = newURL.replace("origin","string");
                            //
                            // and bung in the value
                            //
                            newURL = newURL + as.val();
                            location.href=newURL;
                        }
                    }
                    return false;
                })
                
                // read hints form the cookie
                loadHints();
                        

        }
    })

var  cookieYes = function ( ) {
    var s = theURL.replace("cache=none","cache=perm");
    theURL = s;
    writeCookie("CookieMonitor","yes");
    $("#CookieMsgAnchor").hide();
}
 
function cookieNo( ) {
    // Note that we cannot record this event
    deleteCookie("CookieMonitor","");
    deleteCookie("_saml_idp","");
    $("#CookieMsgAnchor").hide();
}

function handleCookies()
{
    var cookieOK = readCookie("CookieMonitor");

    if (cookieOK == "yes") {
        var s = theURL.replace("cache=none","cache=perm");
        theURL = s;
    } else {

        var anchor = $("#CookieMsgAnchor");
        anchor.html("We use cookies to make your experience of this website better. To comply with 'The Privacy and Electronic Communications (EC Directive) (Amendment) Regulations 2011' we have to ask for your consent to set these cookies. <button onclick=cookieYes()>I agree</button>&nbsp;<button onclick=cookieNo()>No thanks</button>&nbsp;<a href=\"help\cookies.jsp"+theParams+"\">Find out more</a>");
    }
}
