function removeHint(el){
        
    var stored = readCookie("_saml_idp")
        if (stored != null){
            stored = stored.replace("null","");
            var delItem = $.base64Encode($(el).attr("rel"))
            delItem = encodeURIComponent(delItem);
            var value = stored.replace(delItem,"");
            //
            // and strip of any trailing '+'
            //
            var x = value.substring(value.length-1);
            while (value.substring(value.length-1) == "+") {
                value = value.substring(0,value.length-1);
            }
            writeCookie("_saml_idp",value)
        }
    $(el).parent("li").remove();
}       

// read hints from the cookie
// and add them to the DOM

function loadHints(){
    var stored = readCookie("_saml_idp")
        if (stored != null ){
            stored = stored.replace("null","")
            var hints = stored.split("+");
            for(i=0;i<=hints.length-1;i++){
                if (i <=2){
                    // decode a cookie string
                    var eId = $.base64Decode(decodeURIComponent(hints[i]));
                        if (eId != ""){
                            var text = $("#combobox option[value='" +eId+ "']").text();
			    if (null != text && "" != text) {
                                var hint = $("<li class='hint'><a class='hint-link' href=\"" + theURL + encodeURIComponent(eId) + "\">" + text +"</a></li>")
                                var remove = $("<span class='hide'> | </span><a href='#' title='remove this link' rel='" + eId + "' class='remove-org-btn' id=''>remove &times;</a>").click(function(){removeHint(this)})
                                var imgURL = theLogos[eId];
                                var imgWid = theWidths[eId];
                                if (imgWid > 90) {
				    imgWid = 90;
				}
                                var img = $(".hint-link", hint).append($("<img src='"+imgURL+"' width='"+imgWid+"' alt='' title=''/>").error(function() {$(this).remove();}))
                                hint.append(img);
                                hint.append(remove);
                                $("#hints").append(hint);
			    }
                        }
                }
            }
        }
}
// write hints to a cookie

function writeCookie(name, value) {
    var date = new Date();
    date.setDate(date.getDate()+ 365);
    document.cookie = name + "=" + value + "; path=/; " + "expires=" + date.toUTCString();
}


function deleteCookie(name) {
    var date = new Date();
    date.setDate(0);
    document.cookie = name + "=" + "; path=/; " + "expires=" + date.toUTCString();
}


function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return ;
}
