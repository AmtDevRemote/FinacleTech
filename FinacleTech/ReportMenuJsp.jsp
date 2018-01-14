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

</head>
<body>
<html:form  method="post" action="/TrapUserAction?option=save" onsubmit="return checkField()">
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
		<td class="framemenu_date" colspan="3">Select Report Type</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			
					 <tr><td class="framemenu_item">&nbsp;&nbsp;&nbsp;</td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/ManagedPIMSERVICERegisteredSubscribersJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp; Managed PIM SERVICE Registered Subscribers</A></td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/ServiceUsageDetailsJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Service Usage Details </A></td></tr>
					 <tr><td class="framemenu_item"> &nbsp;&nbsp;&nbsp;<A href="../action/PeakVolumeTrafficJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp; Peak Volume Traffic </A></td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/ActiveUsersbyhourJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Active Users by hour</A></td></tr>
					 <tr><td class="framemenu_item"> &nbsp;&nbsp;&nbsp;<A href="../action/RequestsbyhourJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Requests by hour </A></td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/UsersSubscribedtoPresenceServiceJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Users Subscribed to Presence Service  </A></td></tr>
					 <tr><td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/LoginLogoutServiceErrorFailurebyhourJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Login/Logout/Service Error Failure by hour </A></td></tr>
					 <tr><td class="framemenu_item"> &nbsp;&nbsp;&nbsp;<A href="../action/CommonRequestResponseReportJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;Request Attempts & Failure Ratios  </A></td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/HandsetReportAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp; Used Handset information  </A></td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;<A href="../action/IMReportsJspAction"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">&nbsp;&nbsp;IM Related Reports</A></td></tr>
					 <tr> <td class="framemenu_item"><td>&nbsp;&nbsp;&nbsp;</td></tr>
					 <tr> <td class="framemenu_item">&nbsp;&nbsp;&nbsp;</td></tr>
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
				<script type="text/javascript">
		    	var call1 = new calendar1(window.document.forms[0].elements['startDate']);
    			</script>
    			<script type="text/javascript">
		    	var call2 = new calendar1(window.document.forms[0].elements['trapForm2']);
	 			</script>
</body>
</html:html>