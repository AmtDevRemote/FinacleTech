<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<html>
<head>
<title>Customer Connect Enterprise</title>
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script language="javascript">
function focus()
{
	document.forms[0].login.focus();
}
function focusPw()
{
	document.forms[0].password.focus();
}
function submitForm()
{	
	if(document.forms[0].login.value.length<6)
	{
		alert("UserId must be at least 6 characters");
		document.forms[0].login.value="";
		document.forms[0].login.focus();
		return false;
	}
	if(document.forms[0].password.value.length<6)
	{
		alert("Password must be at least 6 characters");
		document.forms[0].password.value="";
		document.forms[0].password.focus();
		return false;
	}	
	document.forms[0].target="_top";
	document.forms[0].submit();
}
</script>
</head>
<body class="bottomframe" topmargin="0" leftmargin="0" onLoad="focus()">
<table width="100%" height="100%" cellspacing="0" cellpadding="0">
<tr>
<td valign="middle" align="center">
<table cellSpacing=0 cellPadding=0 width="100%" border="0">
  <tbody>
  <tr>
    <td width="100%">
      <table cellSpacing="0" cellPadding="0" width="100%" border="0">
        <tbody>
        <tr>
          <td align="center" colspan="2">
            
          </td>
        </tr>
		<tr>
		   <td align="left"><font color="#003399" face="Arial" size="4"><b>Customer Online Support<b><font></td>
		   <td align="right"><font color="#003399" face="Arial" size="4"><b><a href="home.htm">home</a></td><b><font></td>
		</tr>
		 <tr>
           <td height="2" background="../images/backgr.gif" colspan="2"></td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
</td>
</tr>
<html:form method="post" action="/loginpage">
<tr>
<td valign="middle" align="center" height="100%">
<table border="0" cellpadding="0" cellspacing="0" width="400">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3" align="center">Login</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
				<tr>
					<td class="logout_box" width="100">&nbsp;</td>
					<td class="logout_box" width="10">&nbsp;</td>	
				    <td height="25" class="content">
				    	<%if(request.getAttribute("errors")!=null){%>
				    		<font color="red" face="Arial" size="2"><b><%=(String)request.getAttribute("errors")%></b></font>
				    	<%}%>
				    </td>
				</tr>				
				<tr>
					<td class="logout_box" width="100">User Id</td>
					<td class="logout_box" width="10">:</td>		
					<td class="framemenu_item"><input type="text" name="login" value="" style="width:200px" maxlength="14" onKeyUp="if(event.keyCode==13){ focusPw(); }"/></td>			
				</tr>
				<tr>
					<td class="logout_box" width="100">Password</td>
					<td class="logout_box" width="10">:</td>		
					<td class="framemenu_item"><input type="password" name="password" value="" style="width:200px" onKeyUp="if(event.keyCode==13){ submitForm(); }"
/></td>	
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td class="framemenu_item" width="100"></td>
					<td class="framemenu_item" width="10"></td>		
					<td align="left"><input type="button" class="logout_box" value="Submit" onclick="submitForm()"/>
					&nbsp;<input type="reset" class="logout_box" value="Reset"/>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>Please <a href="contactus.htm">ask us</a> for temporary credentials</tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
</table>
</td></tr>
</html:form>
<tr><td height="29">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#004560">
	<tr>
		<td height="29" align="center"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Copyrights &copy; 2011 Finacle Technologies. All rights reserved.</strong></font></td>
	</tr>
</table>
</td>
</tr>
</table>
</body>
</noframes>
</html>