<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ page import="com.techunified.webclient.data.DoGroup, java.util.List"%>
<html:html locale="true">
<head>
<title>Group</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	var blank=" ";
	if(document.forms[0].alertname.value=="")
	{
		alert("Alert Name Cannot be Blank");
		return false;
	}
	if(document.forms[0].alertname.value.indexOf(blank) != -1)
	{
		alert("Alert Name Cannot contain spaces");
		return false;
	}
	if(document.forms[0].alerthandler.value=="")
	{
		alert("Alert Handler is Mandatory");
		return false;
	}
	if(document.forms[0].alerthandler.value.indexOf(blank) != -1)
	{
		alert("Alert Handler Cannot contain spaces");
		return false;
	}
	return true;
}
	
</script>
</head>
<body>
<%
if (request.getAttribute("closeWindow") != null) {

%>
<script language="javascript">

			 opener.frames[0].location.href="../action/alert";

			window.close();

		</script>
<%
}
%>
<form method="post" action="../action/alerts?action=savealert">
<table width="60%">
	<tr>
		<td height="12" class="content"><%if(request.getAttribute("error") != null){%>
		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
		<%}%></td>
	</tr>
	<tr>
		<td>
		<table border="0" cellpadding="0" cellspacing="0" width="70%">
			<tr>
				<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7"
					border="0"></td>
				<td width="6"><img src="../images/menu-bg-top-left.gif" alt=""
					width="6" height="6" border="0"></td>
				<td style="background-color:#003399;"></td>
				<td width="6"><img src="../images/menu-bg-top-right.gif" alt=""
					width="6" height="6" border="0"></td>
				<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7"
					border="0"></td>
			</tr>
			<tr>
				<td class="framemenu_date" colspan="3">&nbsp;&nbsp;Add Alert</td>
			</tr>
			<tr>
				<td
					style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
				<td class="framemenu" valign="top">
				<table border="0" cellpadding="0" cellspacing="8" id="outer_table">
					<tr>
						<td class="content">Alert Name<font color="#FF0000">*</font></td>
						<td><html:text name="alertsForm" maxlength="20"
							property="alertname" value="" size="20" styleClass="content"
							style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
					</tr>
					<tr>
						<td class="content">Alert Type</td>
						<td><html:select name="alertsForm" property="alerttype" value="">
							<option value="push">Push</option>
							<option value="pull">Pull</option>
						</html:select></td>
					</tr>
					<tr>
						<td class="content">Alert Handler<font color="#FF0000">*</font></td>
						<td class="content"><html:text name="alertsForm" maxlength="32"
							property="alerthandler" value="" size="32" styleClass="content"
							style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
					</tr>
					<tr>
						<td></td>
						<td class="framemenu_item" align="right"><input type="submit"
							value="Save" name="B3" onclick="return checkField()">&nbsp;<input
							type="reset" value="Reset" name="B2"></td>
						<td align="left"></td>
					</tr>
				</table>
				</td>
				<td
					style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
			</tr>
			<tr>
				<td width="5" height="5"><img
					src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6"
					border="0"></td>
				<td
					style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
				<td width="5" height="5"><img
					src="../images/menu-bg-bottom-right.gif" alt="" width="6"
					height="6" border="0"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html:html>
