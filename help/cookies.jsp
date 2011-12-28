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
	<title>About Cookies</title>
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
	<meta name="viewport" content="target-densitydpi=medium-dpi" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;">
	<script type="text/javascript" src="../js/jQuery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../js/detect.js"></script>
	<script type="text/javascript" src="../js/cookie.js"></script>
	<script type="text/javascript" src="../js/help-others.js"></script>
	<script type="text/javascript" src="../js/cookiepage.js"></script>
	<link type="text/css" href="../css/style.css" rel="stylesheet" />
</head>
<body >
	<div class="content">
		<div id="help-others-view">
			        	<a href="#maincontent" tabindex="1" class="hide" accesskey="S">Skip to content</a>
            <a class="back" href="../uk.ds<%=baseUrlBuilder.toString()%>" title="back">Back to Search</a>
			<h1 id="maincontent">Cookie use on this website</h1>
			<p></p>
		
	<p> This website can use two cookies whose use is described below.  A cookie is a small file of
letters and nuber that we put on your computer if you agree.  We do
not use these cookies to distinguish or track you in any way.  They
are used purely to simplify your future experience on this website.
				<dt >The "_saml_idp" cookie</dt>
				<dd><p>This cookie contains the list of IdPs that you have selected.  Its format is standardized in the <a href="http://docs.oasis-open.org/security/saml/v2.0/saml-profiles-2.0-os.pdf"> SAML2 profile specification</a>.
				</dd>
				
				<dt >The "CookieMonitor" cookie</dt>
				<dd><p>If this cookie is present and contains the text "yes", then it records the fact that you will allow this webpage to save cookies. </p>
				</dd>
				
				<dt >Third party cookies</dt>
				<dd>
					<p>This website makes no use of any privacy invasive technology and this includes "third party cookies"</p>
				</dd>
				
				<dt >Change my cookie settings</dt>
				<dd id="changeCookies">
					<p>You need to have javascript enabled to change your cookie settings</p>
				</dd>
				
				<dt >JavaScript</dt>
				<dd>
					<p>Cookies are only user or saved if your browser has JavaScript enabled.  Whilst JvaScrtipt is disabled no cookies are stored.
				</dd>
		
									
			</dl>
			<p id="footer-text">The UK Access Management Federation<br /><a href="../accessibility-statement.jsp<%=baseUrlBuilder.toString()%>" accesskey="0">Accessibility statement</a></p>
		</div>
		
	</div>

</body>
