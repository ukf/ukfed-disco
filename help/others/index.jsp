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
	<title>Help for all other users</title>
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
	<meta name="viewport" content="target-densitydpi=medium-dpi" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
	<script type="text/javascript" src="../../js/jQuery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../../js/detect.js"></script>
	<script type="text/javascript" src="../../js/help-others.js"></script>
	<link type="text/css" href="../../css/style.css" rel="stylesheet" />
</head>
<body>

	<div class="content">
		<div id="help-others-view">
			        	<a href="#maincontent" tabindex="1" class="hide" accesskey="S">Skip to content</a>
            <a class="back" href="../<%=baseUrlBuilder.toString()%>" title="back">Back to help logging in</a>
			<h1 id="maincontent">Help for all other users</h1>
			<p></p>
		
	
			<p>Click a question below to see the answer. If you have any other issues or are having trouble logging in, then either try logging in through your organisation's portal, or contact your network administrator, teacher, or lecturer.</p>
			<dl>
				<dt >Why am I here?</dt>
				<dd><p>You tried to access some content that needs you to be logged into your organisation. Your organisation could be one of:</p>
					<ul>
						<li>Your College</li>
						<li>Your University or Research Institution</li>
						<li>Your Local Authority</li>
					</ul>
				</dd>
				
				<dt >What do I need to do?</dt>
				<dd>
					<p>You need to select your organisation, using the search box on this site. If you begin typing in the box, suggestions will appear to help you select your organisation.</p>
					<p>Once you've selected an organisation, you'll be taken to its log in page. When you've logged in, you'll be taken back to view the content you originally clicked on.</p>
				</dd>
				
				<dt >How do I find an organisation?</dt>
				<dd>
					<p>You can find an organisation using the search box on this site. If you begin typing in the box, suggestions will appear to help you select your organisation.</p>
				</dd>
				
		
									
			</dl>
			<p id="footer-text">The UK Access Management Federation<br /><a href="../../accessibility-statement.html" accesskey="0">Accessibility statement</a>&nbsp;<a href="../cookies.jsp<%=baseUrlBuilder.toString()%>" access=key="c">Cookie statement</a></p>
		</div>
		
	</div>
</body>
</html>
