// persistance of cookie in days:
var expires=14

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
	getLocation();
	
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
		$("input[type=text]").autoSuggest(data.items, {selectedItemProp: "name", searchObjProps: "name"}).attr("aria-autocomplete","list").keypress(function(){$("#submit-btn").html("Search");$("#combobox").val("")
		});

		// form submission 
		$("#submit-btn").click(function(e){


			if ($("#combobox").val() != ''){
				// user has made a specific selection from the list
				// record the hint	
				createCookie("_saml_idp",$.base64Encode($("#combobox").val()),expires, "append")
				
				//construct the URL to redirect
				// eg:
				// var entityURI = "";
				// entityURI = $('#hid1').val() + $('#hid2').val() + $('#hid3').val() + $('#hid4').val() + $('#hid5').val(); location.href= entityURI;
				// location.href = entityURI

			}
				//simulate a submission for a search
				// hide any previous
				$(".as-results").hide();
				//clear the results and load the new ones
				$("#results").html($(".as-results ul li").clone(true)).before(function(){if ($("h1.results").length == 0) return"<h1 class=\"results\">Your search results</h1>"});
				return false;
			})
		
		// read hints form the cookie
		loadHints();
			

	}
})


function getLocation(){
	if(navigator.geolocation){
	    browserSupportFlag = true;
	    navigator.geolocation.getCurrentPosition(showLocation, errorHandler);
	} 
}

function showLocation(position){
	  var latitude = position.coords.latitude;
	  var longitude = position.coords.longitude;
	  sortEntities(latitude,longitude)
	  
}
function sortEntities(lat,lng){
	// alert(lat +lng)
	// sort the entities by lat long
	// not implemented
	// console.log("Latitude : " + latitude + " Longitude: " + longitude);
}
function errorHandler(err){
	if(err.code == 1){
		//console.log("Error: Access is denied!");
	}else if( err.code == 2){
		//console.log("Error: Position is unavailable!");
	}
}
	
function removeHint(el){
	
	var stored = readCookie("_saml_idp")
	if (stored != null){
		stored = stored.replace("null","");
		var delItem = $.base64Encode($(el).attr("rel"))
		var value = (stored+= " ").replace(delItem,"").replace("null","");
		createCookie("_saml_idp",value)
		
		
	}
	$(el).parent("li").remove();
}	
// read hints from the cookie
// and add them to the DOM
function loadHints(){
	var stored = readCookie("_saml_idp")
	if (stored != null ){
		stored = stored.replace("null","")
		var hints = stored.split(" ");
		for(i=0;i<=hints.length-1;i++){
		if (i <=2){
			// decode a cookie string
			var eId = $.base64Decode(hints[i].toString())
			if (eId != ""){
			var text = $("#combobox option[value^='" +eId+ "']").text();
			var hint = $("<li class='hint'><a class='hint-link' href=\"" +eId + "\">" + text +"</a></li>")
			var remove = $("<span class='hide'> | </span><a href='#' title='remove this link' rel='" + eId + "' class='remove-org-btn' id=''>remove &times;</a>").click(function(){removeHint(this)})
			var img = $(".hint-link", hint).append($("<img src='images/logos/glow.gif' width='90' alt='' title=''/>").error(function() {$(this).remove();}))
				hint.append(img);
				hint.append(remove);
				$("#hints").append(hint);
				}
			}
		}
	}
}


// write hints to a cookie
// expiry and append options
function createCookie(name, value, days,action) {
	if (value==" "){ 
		value = null
	}
	var current = readCookie(name)
	if((current != undefined && current !="")&&(action == "append")){
		// check if the cookie already contains the value
		if (current.match(value)== null){
		value = (value + " "+ current )
		}
	}

	if(days === null){
		document.cookie = name + "=" + value + " ; path=/;"
	}
	else{
		var date = new Date();
		date.setDate(date.getDate()+ days);
		document.cookie = name + "=" + value + "; path=/; " + "expires=" + date.toUTCString();
   
	}

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

   
