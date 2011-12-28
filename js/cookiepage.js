
function cookieYes() {
  writeCookie("CookieMonitor","yes");
  doCookie();
}

function cookieNo() {
  deleteCookie("CookieMonitor");
  deleteCookie("_saml_idp");
  doCookie();
}

function doCookie() {
    var cookieOK = readCookie("CookieMonitor");
    var anchor = $("#changeCookies");
        
    if (cookieOK == "yes") {
      anchor.html("Cookie storing is currently enabled <button onclick=cookieNo()>Turn off</button>");
    } else {
      anchor.html("Cookie storing is currently disabled <button onclick=cookieYes()>Turn on</button>");
    }
}

$(document).ready(function(){
    doCookie();
});

