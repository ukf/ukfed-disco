<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,edu.internet2.middleware.shibboleth.wayf.*,java.lang.*,org.opensaml.xml.*, edu.internet2.middleware.shibboleth.wayf.idpdisco.*,javax.servlet.http.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setCharacterEncoding("UTF-8");%>

<%
    StringBuilder baseUrlBuilder = new StringBuilder();
    Map parmMap = request.getParameterMap();

    Set keySet = parmMap.keySet();
    for (Object o:keySet) {
      String parmName =  o.toString();
      String parms[] = (String[])parmMap.get(o);
      String parm = parms[0];
      if (baseUrlBuilder.length() == 0) {
         baseUrlBuilder.append('?');
      } else {
         baseUrlBuilder.append('&');
      }
      baseUrlBuilder.append(parmName).append('=').append(parm);
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
 
   StringBuilder urlBuilder = new StringBuilder();
   urlBuilder.append("../../ukfull.ds").append(baseUrlBuilder);
   if (cookieOn) {
     urlBuilder.append("&cache=perm");
   }
   urlBuilder.append("&action=selection&origin=");
   
   String theURL = urlBuilder.toString();
   //   String theURL = "../../ukfull.ds" + baseUrlBuilder.toString() + "&cache=perm&action=selection&origin=";

   String SWGFL = theURL + java.net.URLEncoder.encode("https://idp.merlin.swgfl.org.uk/shibboleth");
   String Somerset = theURL + java.net.URLEncoder.encode("https://fronter.com/shibboleth/somerset/idp");
%>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>You've chosen the South West region</title>
<link type="text/css" href="../../css/style.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
<meta name="viewport" content="target-densitydpi=medium-dpi" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
</head>
<body>

	<div class="content">
		<div id="region-list-view">
						<a href="#maincontent" tabindex="1" class="hide" accesskey="S">Skip to content</a><span class="hide">|</span>
			<a href="../schools/index.jsp<%=baseUrlBuilder.toString()%>" class="back" tabindex="2">Back to help logging in</a>
			<h1 id="maincontent" title="maincontent">You've chosen the South West region</h1>
			<p>Find your organisation in the list below, and select it to log in.</p>
			<p>If you're still having problems, ask your teacher or log into your school's portal.</p>	
			<ul class="rounded">
				<li><a href='<%=SWGFL%>'>SWGfL Merlin</a></li>
				<li><a href='<%=SWGFL%>'>Bath and NE Somerset</a></li>
				<li><a href='<%=SWGFL%>'>Bournemouth</a></li>
				<li><a href='<%=SWGFL%>'>Bristol</a></li>
				<li><a href='<%=SWGFL%>'>Cornwall</a></li>
				<li><a href='<%=SWGFL%>'>Devon</a></li>
				<li><a href='<%=SWGFL%>'>Dorset</a></li>
				<li><a href='<%=SWGFL%>'>Gloucestershire</a></li>
				<li><a href='<%=SWGFL%>'>Isles of Scilly</a></li>
				<li><a href='<%=SWGFL%>'>North Somerset</a></li>
				<li><a href='<%=SWGFL%>'>Plymouth</a></li>
				<li><a href='<%=SWGFL%>'>Poole</a></li>
				<li><a href='<%=Somerset%>'>Somerset</a></li>
				<li><a href='<%=SWGFL%>'>South Gloucestershire</a></li>
				<li><a href='<%=SWGFL%>'>Swindon</a></li>
				<li><a href='<%=SWGFL%>'>Torbay</a></li>
				<li><a href='<%=SWGFL%>'>Wiltshire</a></li>
				<li><a href='<%=SWGFL%>'><img src="../../images/logos/SWGfL.jpg" alt="SWGfL Merlin" /></li></a>
			</ul>		
		</div><p id="footer-text">The UK Access Management Federation<br /><a href="../../accessibility-statement.html"  accesskey="0">Accessibility statement</a>&nbsp;<a href="../cookies.jsp<%=baseUrlBuilder.toString()%>" access=key="c">Cookie statement</a></p>
		
	</div>
	

</body>
</html>
