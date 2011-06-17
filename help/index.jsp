<?xml version="1.0" encoding="utf-8" ?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,java.lang.*,javax.servlet.http.*, java.net.*"%>
<%
   StringBuilder baseUrlBuilder = new StringBuilder();
   Map parmMap = request.getParameterMap();
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<%
    //
    // Grab parameters
    //
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
%>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title>Help logging in</title>
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
	<meta name="viewport" content="target-densitydpi=medium-dpi" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
	<script type="text/javascript" src="../js/jQuery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../js/detect.js"></script>

	<link type="text/css" href="../css/style.css" rel="stylesheet" />
</head>
<body >
	<div class="content">
		<div id="help-top-view" >
			<a href="#maincontent" class="hide" tabindex="0" accesskey="S">Skip to content</a><span class="hide">|</span>
			<a class="back" href="../DS<%=baseUrlBuilder.toString()%>" tabindex="2">Back to search</a>
			<h1 name="maincontent" id="maincontent">Help logging in</h1>
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
			<p class="subheading">Select an option which describes you best:</p>
			<dl>
			<dt><a href="schools/index.jsp<%=baseUrlBuilder.toString()%>">Schools</a></dt>
			<dd>Primary, first, infant, junior, secondary school
Reception to Year 11
Key Stage 1 to GCSE</dd>
<dt><a href="others/index.jsp<%=baseUrlBuilder.toString()%>">help for all other users</a></dt>
<dd>Universities, colleges, local authorities, academic and research institutions and councils, and other relevant organisations.</dd>
			</dl>
			
			
			
			
			<p id="footer-text">The UK Access Management Federation<br /><a href="../accessibility-statement.html" accesskey="0">Accessibility statement</a></p>

		</div>
	</div>

</body>
</html>
