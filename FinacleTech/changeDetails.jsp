<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.tdo.TdoUser"%>
<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.acl.UserAcl"%>

<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>USER</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].password.value.length<6)
	{
		alert("Password must be at least 6 characters");
		window.document.forms[0].password.value="";
		window.document.forms[0].password.focus();
		return false;
	}
	if(window.document.forms[0].password.value=="")
	{
		alert("Password is mandatory");
		window.document.forms[0].password.focus();
		return false;
	}
	if(window.document.forms[0].fname.value=="")
	{
		alert("First name is mandatory");
		window.document.forms[0].fname.focus();
		return false;
	}
	if(window.document.forms[0].fname.value!="")
	{
		inputStr=window.document.forms[0].fname.value.toString();
		for(var i=0;i<inputStr.length;i++) 
		{
			var oneInt=inputStr.charCodeAt(i);
			if(oneInt>=33 && oneInt<=45 || oneInt>=58 && oneInt<=64 || oneInt>=91 && oneInt<=96 || oneInt>=123 && oneInt<=255 || oneInt==47)
			{
				alert("Only character Value is Allowed in First name")		
				window.document.forms[0].fname.focus();
				window.document.forms[0].fname.value="";
				return false
			}
		}	
	}
	if(window.document.forms[0].lname.value!="")
		{
			inputStr=window.document.forms[0].lname.value.toString();
			for(var i=0;i<inputStr.length;i++) 
			{
				var oneInt=inputStr.charCodeAt(i)
				if(oneInt>=33 && oneInt<=45 || oneInt>=58 && oneInt<=64 || oneInt>=91 && oneInt<=96 || oneInt>=123 && oneInt<=255 || oneInt==47)
				{
					alert("Only character Value is Allowed in Last name");		
					window.document.forms[0].lname.focus();
					window.document.forms[0].lname.value="";
					return false
				}
			}	
		}
	return true;
}
</script>
</head>
<body>
<form name="editUser" method="POST" action="../action/ChangeDetailsAction?option=save" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%
    	if(session.getAttribute("userallready")!=null){%>
    		<font color="red"><b><%=session.getAttribute("userallready")%></b></font>
    	<%}session.removeAttribute("userallready");%>
    </td>
  </tr>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#8E001C;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">Edit User</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">User Id<font color="#FF0000">*</font></td>
				<td class="content" height="23"><%=((UserAcl)request.getSession().getAttribute("user")).getUser().getUserId()%></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			  <tr>
				<td width="150" class="content" height="23">Password<font color="#FF0000">*</font></td>
				<td height="23"><html:password name="userForm" maxlength="20" property="password" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">Re-Confirm<font color="#FF0000">*</font></td>
				<td height="23"><html:password name="userForm" maxlength="20" property="confirmPassword" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">First name<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="userForm" accesskey="t" maxlength="20" property="fname" value="<%=((UserAcl)request.getSession().getAttribute("user")).getUser().getFName()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1"/></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">Last Name </td>
				<td height="23"><html:text name="userForm" maxlength="20" property="lname" value="<%=((UserAcl)request.getSession().getAttribute("user")).getUser().getLName()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1"/></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			   <tr>
				<td width="150" class="content" height="23">e-mail </td>
				<td height="23"><html:text name="userForm" maxlength="50" property="email" value="<%=((UserAcl)request.getSession().getAttribute("user")).getUser().getEmail()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">FTP </td>
				<td height="23"><html:text name="userForm" maxlength="22" property="ftp" value="<%=((UserAcl)request.getSession().getAttribute("user")).getUser().getFtp()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
			  	
				<td width="150" class="content" height="23"> </td>
				<td height="23">eg:-ftp://192.168.00.00</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">Role Name<font color="#FF0000">*</font></td>
				<td height="23" class="content"><%=((UserAcl)request.getSession().getAttribute("user")).getUser().getRoleId()%></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td class="framemenu_item" align="right"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				<td align="left"></td>
			  </tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html:html>