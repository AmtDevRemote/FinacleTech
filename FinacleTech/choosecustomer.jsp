<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%
String groupName = (String)request.getParameter("group");
%>
<html:html locale="true">
<head>
<title>Customers</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
function submitSearch()
	{
		/*if(document.forms[0].s || document.forms[0].searchNumber.value==" ")
		{
			alert("Enter number or name to search);
			return false;
		}
		else
		{*/
			document.forms[0].action="../action/customerDisplay?action=searchCustomer";
			document.forms[0].target="groupList1";
			document.forms[0].submit();
	}
function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}

</script>
<link href="css/frames-styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</head>
<body width="110%">
<form method="post" action="../action/customerDisplay?action=updateCustomerList">
<table width="101%" height="100%" >
<%
if(request.getAttribute("error")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
</tr>
<%}%>
<tr>
		<td height="100%" valign="top">
			<table cellpadding="0" cellspacing="0" width="100%" height="100%">
				<tr>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
					<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
					<td style="background-color:#003399;"></td>
					<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
				</tr>
				<tr>
				
					<td class="framemenu_date" colspan="3">&nbsp;Search Customer</td>
				</tr>
				<tr>
					<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
					<td bgcolor="#E2E2E2" valign="top" width="100%">
						<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
							<tr>
								<td height="5" colspan="3"></td>
							</tr>
							<tr>
								<input type="hidden" name="group" value="<%=request.getParameter("group")%>">
								<input type="hidden" name="mode" value="custfromgroups"/>
								<td ><input type="hidden" name="start" value=""/></td>
								<td ><input type="hidden" name="range" value=""/></td>
								<td ><input type="hidden" name="messageType" value=""/></td>
								<td ><input type="hidden" name="serverFile" value=""/></td>
								<td ><input type="hidden" name="groupMessage" value=""/></td>
								<td class="content" width="200">Name :<input type="text" name="searchName"  value="" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" />
								</td>
								<td class="content" width="200">
					Mobile :<input type="text" name="searchNumber" value="" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" />
								</td>
								<td  class="content" align="left" valign="bottom"><input type="button" value="Search" name="B2" class="logout_box" onClick="submitSearch()">&nbsp;			</td>
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
			<!--<tr>
					<td colspan="3">&nbsp;</td>
				</tr>-->
				<tr>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
					<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
					<td style="background-color:#003399;"></td>
					<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
				</tr>
				<tr>
					<td class="framemenu_date" colspan="3">&nbsp;Customer List</td>
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
								
									<iframe name="groupList1" src="../action/customerDisplay?action=displayCustomers&group=<%=groupName%>" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0"><span class="style1"></span></iframe>
								</td>
							</tr>
							<tr>
								<td align="center" class="logout_box"><a href="../action/distributionList" >View Customer Groups</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								

					
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
		</td>
</tr>
</table>
</form>
</body>
</html:html>