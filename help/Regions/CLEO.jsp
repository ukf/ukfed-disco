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
   String Region = theURL + java.net.URLEncoder.encode("ENTITY_ID_FOR_REGION");
%>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>You've chosen the Cumbria and Lancashire region</title>
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
			<h1 id="maincontent" title="maincontent">You've chosen the Cumbria and Lancashire region</h1>
                        <p>No Regions in your area have subscribed to this service</p>
                        <p>Please ask a teacher for help or log in to your School's Portal</p>
<!--
			<p>Find your organisation in the list below, and select it to log in.</p>
			<p>If you're still having problems, ask your teacher or log into your school's portal.</p>	
			<ul class="rounded">
				<li><a href='<%=Region%>'>Cumbria</a></li>
				<li><a href='<%=Region%>'>Lancashire</a></li>
			</ul>
-->
		</div><p id="footer-text">The UK Access Management Federation<br /><a href="accessibility-statement.html"  accesskey="0">Accessibility statement</a></p>
		
	</div>
</body>
</html>
