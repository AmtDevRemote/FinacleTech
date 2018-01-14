<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%
String groupName = (String)request.getAttribute("group");
%>
<html:html locale="true">
<head>
<title>Customers</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
   	function submitDelete()
	{
		var total = 0;
		var max = 1;
		var form = document.frames[0].document.forms[0];
		var doc = document.frames[0].document
		if (!form.serialId)
			return false;
		if (form.serialId.length)
			max = form.serialId.length;
		for(var i=1;i<=max;i++){
			
			if(doc.getElementById(i.toString()).checked)
				total++;
		}
        if (total == 0)
		{
			alert('No records selected');
			return false;
		}
		else
		{	
			if (confirm('Are you sure to delete'))
			{
				form.action = "../action/campaign?action=deleteCampaign";
				form.submit();
			}
		}
	}
	
function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}

</script>
</head>
<body>
<html:form  method="post" action="/compaign">
<table width="100%" height="100%">
<%
if(request.getAttribute("error")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
</tr>
<%}%>
<tr>
<td height="100%" valign="top">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Campaign List</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
		<td bgcolor="#E2E2E2" valign="top" height="100%" width="100%">
			<table cellpadding="0" cellspacing="0" id="outer_table" width="100%"  height="100%">
			<tr>
				<td height="5" colspan="2"></td>
			</tr>
			<tr>
				<td width="100%"  height="100%" align="left">
					<iframe name="campaignList" src="../action/campaign?action=displayCampaigns" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
				</td>
			</tr>
			<tr>
				<td align="left">
					<input type="button" value="&nbsp;Add&nbsp;" name="B1" class="logout_box" href="#" onClick="MM_openBrWindow('../action/campaign?action=displayAddCampaign','mainframe', 265, 400)">&nbsp;
					<input type="button" value="Delete" name="B3" class="logout_box" onClick="submitDelete()">&nbsp;
				</td>
			</tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;">&nbsp;</td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>


</table>
</html:form>
</body>
</html:html>