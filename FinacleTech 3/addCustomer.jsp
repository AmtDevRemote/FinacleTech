<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Customers</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<%
String groupName = (String)request.getAttribute("group");

%>

<script type="text/javascript" language="JavaScript">
function checkField()
{
	return true;
}
</script>
</head>
<body>
<form method="post" action="../action/customerList?action=saveCustomer&group=<%=groupName%>">
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
		<td class="framemenu_date" colspan="3">Add User</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">Name :<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="customerForm" maxlength="50" property="firstName" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			  <tr>
				<td width="150" class="content" height="23">Mobile :<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="customerForm" maxlength="20"  property="mobileNumber" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">Gender :<font color="#FF0000">*</font></td>
				<td height="23">
				<html:select name="customerForm" property="gender1" value="M">
				   	<html:option value="M">Male</html:option>
				   	<html:option value="F">Female</html:option>
				</html:select>
		   		</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" align="right"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				<td align="left"></td>
			  </tr>
			</table>
		</td>
		<input name="groupName" type="hidden" value='<%=(String)request.getAttribute("group")%>'>
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