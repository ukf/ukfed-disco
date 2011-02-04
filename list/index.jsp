<?xml version="1.0" encoding="utf-8" ?> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ page language="java" import="java.util.*,edu.internet2.middleware.shibboleth.wayf.*,java.lang.*,org.opensaml.xml.*, edu.internet2.middleware.shibboleth.wayf.idpdisco.*,javax.servlet.http.*"%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<%request.setCharacterEncoding("UTF-8");%>
<%response.setCharacterEncoding("UTF-8");%>

<%
   TreeSet<IdPSite> sites = (TreeSet<IdPSite>) session.getValue("sites");
   StringBuilder urlBuilder = new StringBuilder();

   String shire = "shire";
   String target = "target";
   String providerId = "providerId";
   String time = "Time";
   
   String entityId = "entityID";
   String returnX = "returnX";
   String returnIDParam = "returnIdParam";

   Boolean saml1Protocol; saml1Protocol = (Boolean) session.getAttribute("saml1Protocol");

   if (null == saml1Protocol) { %>
<jsp:forward page = "noBookmark.html"/>
<% }
   urlBuilder.append((String) session.getAttribute("returnURL"));

   if (saml1Protocol) {
      shire = (String) session.getAttribute("shire");
      target = (String) session.getAttribute("target");
      providerId = (String) session.getAttribute("providerId");
      time = (String) session.getAttribute("time");
   } else {
      entityId = (String) session.getAttribute("entityID");
      returnX = (String) session.getAttribute("returnX");
      returnIDParam = (String) session.getAttribute("returnIDParam");
   }
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Select from the list: Which organisation would you like to sign in with?</title>

<script  type="text/javascript">
var theURL = '<%=urlBuilder.toString()%>';
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
     for (Logo logo : info.getLogos()) { 
        if (logo.getHeight() <= 16 && logo.getWidth() <= 16) continue;
        logoUrl = logo.getURL().getLocalString();
        break;
     }%>
     theLogos['<%=site.getName()%>']='<%=logoUrl%>';<%
   }%>
     theLogos['https://idp.cardiff.ac.uk/shibboleth']='https://iam.cf.ac.uk/images/CU-logo-64x63.png';
     theLogos['https://idp-dev.cardiff.ac.uk/idp/shibboleth']='https://iam.cf.ac.uk/images/CU-Dev-logo-80x60.png';
     theLogos['https://idp-preprod.cardiff.ac.uk/idp/shibboleth']='https://iam.cf.ac.uk/images/CU-Dev-logo-80x60.png';
     theLogos['https://idp.edina.ac.uk/shibboleth-devel']='https://dlib-adidp.ucs.ed.ac.uk:442/Images/edina-logo110x58.jpg';
     theLogos['https://idp.edina.ac.uk/shibboleth-devel-13']='https://dlib-adidp.ucs.ed.ac.uk:442/Images/edina-logo110x58.jpg';
     theLogos['https://idp.sussex.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/US_Corporate_Small-use_RGB_Flint.jpg';
     theLogos['https://idp.gla.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/university_of_glasgow.gif';
     theLogos['https://idptest.gla.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/university_of_glasgow.gif';
     theLogos['https://idp.bath.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/bath-logo.png';
     theLogos['https://idp.dundee.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/Dundee University Crest (85x60).GIF';
     theLogos['https://idptest.dundee.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/Dundee University Crest (85x60).GIF';
     theLogos['https://srvshibboleth.asfc.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/ashton-sixth-form.jpg';
     theLogos['https://shibsles.brunel.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/brunel_logo104x64.PNG';
     theLogos['https://idp.colegsirgar.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/csglogo.JPG';
     theLogos['https://idp-dev.sussex.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/US_Corporate_Small-use_RGB_Flint.jpg';
     theLogos['https://shib1.napier.ac.uk/entity']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/EdNapUniLogo_small.jpg';
     theLogos['https://idp.aquinas.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/aquinas_logo_09.jpg';
     theLogos['https://idp.bournemouth.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/bournemouth.gif';
     theLogos['https://idp.soas.ac.uk/entity']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/soas_logo_72dpi_rgb.jpg';
     theLogos['https://shibidp.soas.ac.uk/entity']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/soas_logo_72dpi_rgb.jpg';
     theLogos['https://idp-test.brighton.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/uob_logo_vsmall.jpeg';
     theLogos['https://idp.brighton.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/uob_logo_vsmall.jpeg';
     theLogos['https://idp.lincoln.ac.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/UniversityOfLincoln.gif';
     theLogos['https://shibboleth.cranfield.ac.uk/openathens']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/CranfieldUniversityLogo.gif';
     theLogos['https://shibboleth-test.cranfield.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/CranfieldUniversityLogo.gif';
     theLogos['https://shibboleth.cranfield.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/CranfieldUniversityLogo.gif';
     theLogos['https://lib.bsfc.ac.uk/shibboleth-idp']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/BSFC-Logo.png';
     theLogos['https://lib.bsfc.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/BSFC-Logo.png';
     theLogos['https://sso.bsfc.ac.uk/idp/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/BSFC-Logo.png';
     theLogos['urn:mace:eduserv.org.uk:athens:provider:liv.ac.uk']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/liverpool.gif';
     theLogos['https://idp.glowscotland.org.uk/shibboleth']='https://dlib-adidp.ucs.ed.ac.uk:442/images/others/glow.gif';
</script>

<script type="text/javascript" src="../js/jQuery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="../js/jQuery/plugins/jquery.tooltip.js"></script>
<script type="text/javascript" src="../js/jQuery/plugins/jquery.base64.js"></script>
<script type="text/javascript" src="../js/jQuery/plugins/jquery.tooltip.js"></script>

<script type="text/javascript" src="../js/detect.js"></script>
<script type="text/javascript" src="../js/list.js"></script>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
<meta name="viewport" content="target-densitydpi=medium-dpi" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link type="text/css" href="../css/style.css" rel="stylesheet" />
<link type="text/css" href="../css/autoSuggest.css" rel="stylesheet" />
<!--[if gte IE 9]>
<link type="text/css" href="../css/enhanced.css" rel="stylesheet" />
<![endif]-->

</head>
<body >
	<div class="content">
		<div id="organisation-select-view">
			<div id="co-branding"></div>
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
			<p class="subheading">Start typing the name of your <span class="tooltip" tabindex="1" title="School Network provider,College,University,Local authority or research Institution">organisation</span> (e.g. Anywhere College) in the search box, and options will appear below:</p>
			<ul id="hints"></ul>
			<fieldset>
			<legend>Choose an option below or type your organisation name in the box below to find your sign in page</legend>
			<form action="../WAYF" name="organisation-select-form" id="organisation-select-form" method="get">

<% if (!saml1Protocol) { %>
			<input type="hidden" name="entityID" value="<%=entityId.toString()%>" />
			<input type="hidden" name="returnX" value="<%=returnX.toString() %>" />
                        <input type="hidden" name="returnIDParam" value="<%=returnIDParam.toString() %>" />
<% } else { %>
			<input type="hidden" name="shire" value="<%=shire.toString()%>" />
			<input type="hidden" name="target" value="<%=target.toString() %>" />
                        <input type="hidden" name="providerId" value="<%=providerId.toString() %>" />
                        <input type="hidden" name="time" value="<%=time.toString() %>" />
<% } %>
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
			
			
			<p class="assist"><a tabindex="4" href="../help/index.html">Need help logging in?</a><br/>
			<em>or</em> <a  tabindex="5" href="../index.jsp">Let me search</a></p>
						<ul id="results"></ul>
			<p id="footer-text">The UK Access Management Federation<br /><a href="../accessibility-statement.html"  accesskey="0">Accessibility statement</a></p>

		</div>
	</div>

</body>
</html>