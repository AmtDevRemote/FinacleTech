<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.data.DoTemplate"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Template</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].roleId.value=="")
	{
		alert("Role Id is mandatory");
		window.document.forms[0].roleId.focus();
		return false;
	}
	if(window.document.forms[0].roleName.value=="")
	{
		alert("Role name is mandatory");
		window.document.forms[0].roleName.focus();
		return false;
	}
	return true;
}

</script>
</head>
<body>
<%
if (request.getAttribute("close")!=null) {
%>
		<script language="javascript">
			opener.frames[0].location.href="../action/role";
			window.close();
		</script>
<%
}
%>
<html:form method="post" action="/role?action=saveRole" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%if(request.getAttribute("error")!=null){%>
    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
    	<%}%>
    </td>
</tr>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Add Role</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">Role ID<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><html:text name="roleForm" maxlength="50" property="roleId" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td width="150" class="content" height="23" align="left"></td>
				<td width="150" class="content" height="23" align="left">Role Name<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><html:text name="roleForm" maxlength="50" property="roleName" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
			</tr>
			<tr height="10">
				<td width="150" class="content" height="23" align="left">General Services <font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"></td>
				<td  class="content" height="23">&nbsp;</td>
				<td  class="content" height="23">&nbsp;</td>
				<td width="150" class="content" height="23" align="left"></td>
				<td class="content" height="23" colspan="2"></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			   <logic:present name="businessObjects" scope="request" >
			   <logic:iterate id="bos" name="businessObjects">
			  <tr>
			  <td width="150" class="content" height="23" align="left"><input type="checkbox" name="permissionIds" value="<bean:write name="bos" property="objectId"/>" class="content" style="border: 1px solid #808080; padding-left: 1; padding-right: 1; padding-top: 1; padding-bottom: 1; "/></td>
			  <td class="content" height="23" colspan="2"><bean:write name="bos" property="objectName"/></td>
			</tr>
			  </logic:iterate>
			  </logic:present>
			  <tr>
				<td colspan="4">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td colspan="2"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>
				<td align="left">&nbsp;</td>
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
</html:form>
</body>
</html:html>