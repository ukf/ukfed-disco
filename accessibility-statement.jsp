<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,java.lang.*,javax.servlet.http.*, java.net.*"%>
<%
   StringBuilder baseUrlBuilder = new StringBuilder();
   Map parmMap = request.getParameterMap();
%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Accessibility Statement</title>
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
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
<meta name="viewport" content="target-densitydpi=medium-dpi" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
	<link type="text/css" href="css/style.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jQuery/jquery-1.4.3.min.js"></script>
	<script type="text/javascript" src="js/detect.js"></script>

</head>
<body>

	<div class="content">
	<div id="accessibility-statement-view">
	<a href="#maincontent" tabindex="1" class="hide" accesskey="S">Skip to content</a>
	<a class="back" href="DS<%=baseUrlBuilder.toString()%>" tabindex="2">Back to search</a>
		<h1>Accessibility statement</h1>
		<p class="prompt">
We have made every effort to ensure this site is accessible to all.

As a way of assisting you around the site access keys have been setup on all major links and can be activated by using the keys below</p>
		<ul class="bullet">
			<li>S - Skip navigation</li>
			<li>1 - Home page</li>
		</ul>
		</div>
		<p id="footer-text">The UK Access Management Federation</p>
		</div>
	</div>

		
	</div>
</body>
</html>
