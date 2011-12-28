<?xml version="1.0" encoding="utf-8" ?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,edu.internet2.middleware.shibboleth.wayf.*,java.lang.*,org.opensaml.xml.*, org.opensaml.saml2.common.*, org.opensaml.saml2.metadata.*,org.opensaml.samlext.saml2mdui.*,javax.servlet.http.*, java.net.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<%request.setCharacterEncoding("UTF-8");%>
<%response.setCharacterEncoding("UTF-8");%>

<%
   TreeSet<IdPSite> sites;
   StringBuilder baseUrlBuilder = new StringBuilder();
   StringBuilder allURL = new StringBuilder();
   StringBuilder theURL  = new StringBuilder();

   double bestRatio = Math.log(80.0/60.0);
   String shire = (String) request.getAttribute("shire");
   String target = (String) request.getAttribute("target");
   String providerId = (String) request.getAttribute("providerId");
   String time = (String) request.getAttribute("time");

   EntityDescriptor sp = (EntityDescriptor) request.getAttribute("providerObject");
   
   String entityId = (String) request.getAttribute("entityID");
   String returnX = (String) request.getAttribute("returnX");
   if (null == returnX) returnX = request.getParameter("returnX");
   String returnIDParam = (String) request.getAttribute("returnIDParam");
   
   Boolean saml1Protocol = (null == entityId);

   sites = (TreeSet<IdPSite>) request.getAttribute("sites");
  
   if (null == sites) { %>
<jsp:forward page = "noBookmark.html"/>
      <% 
   }

   saml1Protocol = (null == entityId);
   theURL.append((String) request.getAttribute("requestURL"));
   allURL.append("ukfull-list.ds");

   if (!saml1Protocol) {
      baseUrlBuilder.append("?entityID=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(entityId, "utf-8"));
      baseUrlBuilder.append("&returnX=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(returnX, "utf-8"));
      baseUrlBuilder.append("&returnIDParam=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(returnIDParam, "utf-8" ));

  } else {
      baseUrlBuilder.append("?target=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(target,"utf-8"));
      baseUrlBuilder.append("&shire=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(shire,"utf-8"));
      baseUrlBuilder.append("&providerId=");
      baseUrlBuilder.append(java.net.URLEncoder.encode(providerId,"utf-8"));
      if (null != time) {
          baseUrlBuilder.append("&time");
          baseUrlBuilder.append(time);
      }
  }
   //
   // Look up the CookieMonitor cookie
   //
   Cookie cookieList[] = request.getCookies();
   boolean cookieOn = false;
   for (int i = 0; cookieList != null && i < cookieList.length; i++) { 
     Cookie cookie = cookieList[i];
     if ("CookieMonitor".equals(cookie.getName()) && "yes".equals(cookie.getValue())) { 
         cookieOn = true; 
         break; 
     }
   }

  if (cookieOn) {
    theURL.append(baseUrlBuilder).append("&cache=perm&action=selection&origin=");
  } else {
    theURL.append(baseUrlBuilder).append("&cache=none&action=selection&origin=");
  }
  allURL.append(baseUrlBuilder).append("&action=lookup");


  //
  // SP logo and text
  //
  String spName = null;
  String spLogo = null;
  String spDescription = null;

  if (null != sp) {
    List<RoleDescriptor> roles = sp.getRoleDescriptors();
    for (RoleDescriptor r:roles) {
      Extensions ex = r.getExtensions();
      if (null == ex) { 
	  continue;
      }
      List<XMLObject> splist = ex.getOrderedChildren();
      for (XMLObject o:splist) { 
        if (o instanceof UIInfo) { 
          UIInfo info=null;
          info = (UIInfo) o;
          if (info.getLogos() != null) {
            for (Logo logo : info.getLogos()) { 
              if (logo.getHeight() <= 16 && logo.getWidth() <= 16) continue;
              if (null == spLogo) spLogo = logo.getURL();
              break;
            }

            for (DisplayName dn : info.getDisplayNames()) { 
              if (null == spName) spName = dn.getName().getLocalString();
              break;
            }

            for (Description dn : info.getDescriptions()) { 
              if (null == spDescription) spDescription = dn.getDescription().getLocalString();
              break;
            }
          }
        }
      }
    }
    if (spName == null) {
      try {
        URI uriId = new URI(sp.getEntityID());
        String scheme = uriId.getScheme();
  
        if ("http".equals(scheme) || "https".equals(scheme)) {
          spName = uriId.getHost(); 
        } else {
          spName = sp.getEntityID();
        }

      } catch (URISyntaxException e) {
        // 
        // It wasn't an URI.  return full entityId.
        //
        spName = sp.getEntityID();
      }
    }
  } else {
      spName = "Unknown Service Provider";
  } 
  if (null == spDescription) {
    spDescription = "You have asked to login to " + spName;
  }
  %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Select from the list: Which organisation would you like to sign in with?</title>

<script  type="text/javascript">
var theURL = '<%=theURL.toString()%>';
var theIcons =[];
var theLogos=[];<%
  for (IdPSite site:sites) { 
     if (null == site.getExtensions()) { continue; }
     List<XMLObject> list = site.getExtensions().getOrderedChildren();
     UIInfo info=null;
     for (XMLObject o:list) { 
        if (o instanceof UIInfo) { 
          info = (UIInfo) o;
          break;
        }
     }
     if (info == null) { continue;}
     if (null == info.getLogos() || 0 == info.getLogos().size()) { continue;}
     String logoUrl = null;
     String iconUrl = null;
     double curRatio = 0;
     for (Logo logo : info.getLogos()) { 
        if (logo.getHeight() <= 16 && logo.getWidth() <= 16) {
	   iconUrl = logo.getURL();
           continue;
        }
        if (logoUrl == null) {
	   logoUrl = logo.getURL();
           curRatio = Math.log(logo.getWidth()/logo.getHeight());
           continue;
        }
        double ratio = Math.log(logo.getWidth()/logo.getHeight());
        double him = Math.abs(bestRatio - curRatio);
        double me = Math.abs(bestRatio - curRatio);
        if (him > me) {
	   logoUrl = logo.getURL();
           curRatio = ratio;
        }
     }
     if (logoUrl != null) {%> theLogos['<%=site.getName()%>']='<%=logoUrl%>';
<%}
     if (iconUrl != null) {%> theIcons['<%=site.getName()%>']='<%=iconUrl%>';
<%}
   }%>

</script>

<script type="text/javascript" src="js/jQuery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jQuery/plugins/jquery.tooltip.js"></script>
<script type="text/javascript" src="js/jQuery/plugins/jquery.base64.js"></script>
<script type="text/javascript" src="js/jQuery/plugins/jquery.tooltip.js"></script>

<script type="text/javascript" src="js/detect.js"></script>
<script type="text/javascript" src="js/cookie.js"></script>
<script type="text/javascript" src="js/list.js"></script>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
<meta name="viewport" content="target-densitydpi=medium-dpi" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link type="text/css" href="css/style.css" rel="stylesheet" />
<!--[if gte IE 9]>
<link type="text/css" href="css/enhanced.css" rel="stylesheet" />
<![endif]-->

</head>
<body >
	<div class="content">
		<div id="organisation-select-view">
			<div id="co-branding">
                           <% if (spLogo != null) { %>
                               <div id="co-branding-img">
                                 <img src="<%=spLogo%>" alt="<%=spName%>"/>
                               </div>
                           <% } %>
                           <div id="co-branding-text"><%=spDescription%></div>
                        </div>
			<h1>Which organisation would you like to sign in with?</h1>
			<div style="display:none;" id="intro">
				<h2>The content you clicked on needs you to log into your organisation</h2>
				<p>Your organisation could be your</p>
				<ul>
					<li>School Network provider</li>
					<li>College</li>
					<li>University</li>
					<li>Local authority</li>
					<li>research Institution</li>
				</ul>
			</div>
			<p class="subheading">Select the name of your <span class="tooltip" tabindex="1" title="School Network provider,College,University,Local authority or research Institution">organisation</span> (e.g. Anywhere College) in the search box, and options will appear below:</p>
			<ul id="hints"></ul>
			<fieldset>
			<legend>Choose an option below or type your organisation name in the box below to find your sign in page</legend>
			<form action="WAYF" name="organisation-select-form" id="organisation-select-form" method="get">

<% if (!saml1Protocol) { %>
			<input type="hidden" name="entityID" value="<%=entityId.toString()%>" />
			<input type="hidden" name="returnX" value="<%=returnX.toString() %>" />
                        <input type="hidden" name="returnIDParam" value="<%=returnIDParam.toString() %>" />
<% } else { %>
			<input type="hidden" name="shire" value="<%=shire.toString()%>" />
			<input type="hidden" name="target" value="<%=target.toString() %>" />
                        <input type="hidden" name="providerId" value="<%=providerId.toString() %>" />
                        <input type="hidden" name="time" value="<%=time.toString() %>" />
<% } 
   if (cookieOn) { %> <input type="hidden" name="cache" value="perm" /> <% } %>

            <input type="hidden" name="action" value="selection" />
			<div class="search">						
			<select id="combobox" class="as-selections" name="origin">
			<option value="">Select...</option>
<% for (IdPSite site:sites) { %><option value="<%=site.getName()%>"><%=site.getDisplayName()%></option><%}%>

					</select>
				<button id="submit-btn" class="btn-enabled" name="submit-btn"  tabindex="4">Continue</button>				
				</div>
			</form>
			</fieldset>
			
			
			<p class="assist"><a tabindex="4" href="help/index.jsp<%=baseUrlBuilder.toString()%>">Need help logging in?</a><br/>
			<em>or</em> <a  tabindex="5" href="DS<%=baseUrlBuilder.toString()%>">Let me search</a></p>
						<ul id="results"></ul>
			<p id="footer-text">The UK Access Management Federation<br /><a href="accessibility-statement.jsp<%=baseUrlBuilder.toString()%>"  accesskey="0">Accessibility statement</a>
                        &nbsp;<a href="help/cookies.jsp<%=baseUrlBuilder.toString()%>" access=key="c">Cookie statement</a>
</p>
<p id="footer-text">List <a href="<%=allURL%>">All Sites</a></p>

		</div>
	</div>

</body>
</html>
