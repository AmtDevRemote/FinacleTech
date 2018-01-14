<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.tdo.TdoUser"%>
<%@ page import="com.techunified.webclient.acl.UserAcl" %>

<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>USER</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../calendar1.js"></script>
<script language="JavaScript" src="calendar2.js"></script>
<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].userid.value.length<6)
	{
		alert("UserId must be at least 6 characters");
		window.document.forms[0].userid.value="";
		window.document.forms[0].userid.focus();
		return false;
	}
	
	if(window.document.forms[0].userid.value=="")
	{
		alert("User Id is mandatory");
		window.document.forms[0].userid.focus();
		return false;
	}
</script>
</head>
<body>
<form method="post"  action="../action/TrapUserListAction" onsubmit="return checkField()" name="frmPeak">

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
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">Search Trapped User</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">User Id<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="trapForm" maxlength="30" property="userId" value="" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			  <tr>
				<td width="150" class="content" height="23">Start Date<font color="#FF0000">*</font></td>
				<td><div id="INPUT" ><input type="text" name="startDate" >&nbsp;<a href="javascript:cal3.popup();"><img src="../cal.gif"></a></div></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">End Date </td>
				<td><div id="INPUT" ><input type="text" name="endDate">&nbsp;<a href="javascript:cal4.popup();"><img src="../cal.gif"></a></div></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  	  	
			  	
			  
			  <tr>
				<td class="framemenu_item" width="150"><input type="button" value="Back" name="B0" onclick='javascript:document.location.href="../action/UserListAction"'></td>
				<td class="framemenu_item" align="right"><input type="submit" value="search" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				<%--<%UserAcl user = (UserAcl)session.getAttribute("user");
				if(user.getUser().getRoleId().equalsIgnoreCase("LEA")){
				%>
				<td class="framemenu_item" width="150"><input type="button" value="Back" name="B0" onclick='javascript:document.location.href="../action/UserListAction"'></td>
				<td class="framemenu_item" align="right"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				 <%}%>
				--%><td align="left"></td>
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
				<script type="text/javascript" language="javascript">
				var cal3 = new calendar1(document.frmPeak.elements['startDate']);
				</script>
				<script type="text/javascript" language="javascript">
				var cal4 = new calendar1(document.frmPeak.elements['endDate']);
				</script>
</body>
</html:html>