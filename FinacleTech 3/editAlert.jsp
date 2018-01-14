<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ page import="com.techunified.webclient.data.DoAlerts, java.util.List" %>
<html:html locale="true" >
<head>
<title>Alerts</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	var blank=" ";
	if(document.forms[0].alertname.value=="")
	{
		alert("Alert Name Cannot be Blank");
		document.forms[0].alertname.focus();
		return false;
	}
	if(document.forms[0].alertname.value.indexOf(blank) != -1)
	{
		alert("Alert Name Cannot contain spaces");
		document.forms[0].alertname.focus();
		return false;
	}
	if(document.forms[0].alerthandler.value=="")
	{
		alert("Alert Handler is Mandatory");
		document.forms[0].alerthandler.focus();
		return false;
	}
	if(document.forms[0].alerthandler.value.indexOf(blank) != -1)
	{
		alert("Alert Handler Cannot contain spaces");
		document.forms[0].alerthandler.focus();
		return false;
	}
	return true;
}
	
</script>
</head>
<body>
<%

DoAlerts alertInfo = (DoAlerts)request.getAttribute("alertInfo"); 

%>
<form method="post"  action="../action/alerts?action=saveeditalert">
<table  width="80%">

<tr>
<td>
<table border="0"  cellpadding="0" cellspacing="0"  width="50%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;&nbsp;Edit Alert</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0"   cellpadding="0" cellspacing="0" id="outer_table" width="100%">
			<tr>
			
				<input type="hidden" name="alertId" value="<%=alertInfo.getAlertId()%>"/>			
				<td  class="content" >Alert Name<font color="#FF0000">*</font></td><td><input type="text" name="alertname" value="<%=alertInfo.getAlertName()%>"></td>
			</tr>
			<tr>
			<% String alerttype = alertInfo.getAlertType(); %>
				<td class="content">Alert Type</td>
				<td>
					<select name="alerttype"   />
						<option value="push" <% out.println(alerttype.equals("push")?"selected":""); %>>Push</option>
						<option value="pull"  <% out.println(alerttype.equals("pull")?"selected":""); %>>Pull</option>
					</select>
				</td>
			</tr>
			<tr>
				<td  class="content" >Alert Handler<font color="#FF0000">*</font></td>
				<td class="content" ><input type="text"  name="alerthandler" value="<%=alertInfo.getAlertHandler()%>"></td>
			</tr>
			<tr>
			<% String status = alertInfo.getAlertStatus(); %>
				<td class="content">Status</td>
				<td>
					<select name="status">
						<option value="enabled" <% out.println(status.equals("enabled")?"selected":""); %>>Enabled</option>
						<option value="disabled" <% out.println(status.equals("disabled")?"selected":""); %>>Disabled</option>
					</select>
				</td>
			</tr>
			<tr>
			<tr>
				<td></td>
				<td class="framemenu_item" align="left"><input type="submit" value="Save" name="B3" onclick="return checkField()">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
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