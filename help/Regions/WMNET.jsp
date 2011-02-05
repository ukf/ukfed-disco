<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,edu.internet2.middleware.shibboleth.wayf.*,java.lang.*,org.opensaml.xml.*, edu.internet2.middleware.shibboleth.wayf.idpdisco.*,javax.servlet.http.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>

<%request.setCharacterEncoding("UTF-8");%>
<%response.setCharacterEncoding("UTF-8");%>

<%
   String theURL = (String) session.getAttribute("returnURL");
   if (null == theURL) { %>
<jsp:forward page = "noBookmark.html"/>
   <% }
   String Birmingham = theURL + java.net.URLEncoder.encode("https://idp.myvle.org/idp/shibboleth");
   String Warwickshire = theURL + java.net.URLEncoder.encode("https://idp.we-learn.com/shibboleth");
   String Worcestershire = theURL + java.net.URLEncoder.encode("https://shibboleth.networcs.net/SSO/shibboleth");
%>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>You've chosen the West Midlands region</title>
<link type="text/css" href="../../css/style.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
<meta name="viewport" content="target-densitydpi=medium-dpi" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
</head>
<body>

	<div class="content">
		<div id="region-list-view">
						<a href="#maincontent" tabindex="1" class="hide" accesskey="S">Skip to content</a><span class="hide">|</span>
			<a href="../schools/" class="back" tabindex="2">Back to help logging in</a>
			<h1 id="maincontent" title="maincontent">You've chosen the West Midlands region</h1>
			<p>Find your organisation in the list below, and if possible select it to log in.</p>
			<p>If you're still having problems, ask your teacher or log into your school's portal.</p>	
			<ul class="rounded">
				<li><a href='<%=Birmingham%>'>Birmingham</a></li>
                                <li>Coventry  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Dudley  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Herefordshire  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Sandwell  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Shropshire  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Solihull  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Staffordshire  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Stoke on Trent  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Telford & Wrekin  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
                                <li>Walsall  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>

				<li><a href='<%=Warwickshire%>'>Warwickshire</a></li>
Wolverhampton  - This local authority has not subscribed to this service, please ask your teacher or log into your school's portal.</li>
				<li><a href='<%=Worcestershire%>'>Worcestershire</a></li>
			</ul>		
		</div><p id="footer-text">The UK Access Management Federation<br /><a href="accessibility-statement.html"  accesskey="0">Accessibility statement</a></p>
		
	</div>
	

</body>
</html>
