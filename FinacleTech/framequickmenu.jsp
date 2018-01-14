<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.techunified.webclient.acl.UserAcl"%>
<%@ page import="com.techunified.webclient.tdo.TdoUser"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<link href="css/frames-styles.css" rel="stylesheet" type="text/css">
</head>
<%
UserAcl user = (UserAcl)request.getSession().getAttribute("user");
%>
<SCRIPT LANGUAGE="JavaScript" type="text/JavaScript">
function MM_openBrWindow(loadpage) 
{ 
	if(loadpage == 'help')
	{
		window.open('help.htm','','width=850,height=600,scrollbars=yes,resizable=no');
	}
	else if(loadpage == 'faq')
	{
		window.open('faq.htm','','width=600,height=400,scrollbars=yes,resizable=no');
	}
	else if(loadpage == 'about')
	{
		window.open('about.htm','','width=400,height=220,scrollbars=no,resizable=no');
	}
  }
function MM_openBrWindow2(theURL,target) { 
  window.open(theURL,target);
}
function MM_openBrWindow3(theURL,target) { 
  window.open(theURL,target);
}

</SCRIPT >
<body class="framequickmenu_body">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	
	<tr>
		<td height="21"><img src="images/bar-right.gif" alt="" width="5" height="21" border="0"></td>
		<td class="framequickmenu" width="50%">
		<a href="#" onClick= "MM_openBrWindow('help')"></a>
		| <a href="#" onClick= "MM_openBrWindow('faq')">FAQ</a>  
		| <a href="#" onClick="MM_openBrWindow('about')">About</a> 
        <td class="framequickmenu" width="70%" align="left"><font color="white">Welcome <%=user.getUser().getFName()%></font></td>
		<td class="framequickmenu_logout"><a href="action/logoutpage" target="_top">Logout</a></td>
		<td>  <a href="#"><img src="images/bar-left.gif" alt="" width="5" height="21" border="0"></a></td>
	</tr>
	<tr>
		<td height="11" colspan="4"><img src="images/spacer.gif" alt="" height="11" border="0"></td>
	</tr>
</table>
</body>
</html>