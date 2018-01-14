<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.techunified.webclient.data.DoStatus"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>USER</title>

<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
var rTimer;
function startTimer()
{
	if (rTimer != null)clearTimeout(rTimer);	
	rTimer = setTimeout('runTimer()', 10000);
}

function runTimer()
{
	self.document.location = '../action/status';
}

function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}
</script>
</head>
<body onLoad="startTimer()">
<html:form method="post" action="/distributionList">
<table width="100%" height="100%">
<%
DoStatus status = (DoStatus)request.getAttribute("status");
if(request.getAttribute("error")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
</tr>
<%
}
if (status.getServerStatus()==null && status.getSessionStatus()==null)
{
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
<tr>
	<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
	<td style="background-color:#003399;"></td>
	<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
	<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
</tr>
<tr>
	<td class="framemenu_date" colspan="3">&nbsp;Message Details</td>
</tr>
<tr>
	<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
	<td bgcolor="#E2E2E2" valign="top" width="100%" height="100%" class="content">
		<font color="red"><b>Server is busy, Please wait for the latest status<b></font>
	</td>
	<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
</tr>
<tr>
	<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
	<td style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
	<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
</tr>
</table>
<%
}
else
{
%>
<tr>
<td valign="top">
<table border="0" cellpadding="0" cellspacing="0">
	<tr><td width="400" height="100">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Message Details</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td bgcolor="#E2E2E2" valign="top" width="100%" height="100%">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
			<tr>
				<td width="200" class="content">Messages Sent</td><td>:</td><td class="content"><%=status.getSentCount()%></td>
			</tr>
			<tr>
				<td width="200" class="content">Messages Rejected</td><td>:</td><td class="content"><%=status.getRejectedCount()%></td>
			</tr>
			<tr>
				<td width="200" class="content">Messages Received</td><td>:</td><td class="content"><%=status.getReceivedCount()%></td>
			</tr>
			<tr>
				<td width="200" class="content">Pending in CC</td><td>:</td><td class="content"><%=status.getPendingCountCC()%></td>
			</tr>
			<tr>
				<td width="200" class="content">Pending in STAR</td><td>:</td><td class="content"><%=(status.getPendingCountStar()==-1)?"N/A":""+status.getPendingCountStar()%></td>
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
	<td width="400" height="100">
	<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Services</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td bgcolor="#E2E2E2" valign="top" width="100%" height="100%">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
			<%
				String image = null;
				String statusString = null;
				if (status.getServerStatus() !=null)
				 	statusString = (String)status.getServerStatus().get("DatabaseMonitor");
				if (statusString ==null || "0".equals(statusString))
					image = "error.gif";
				else if ("2".equals(statusString))
					image="status_sus.gif";
				else
					image="status_ok.gif";
			%>
			<tr>
				<td width="200" class="content">STAR Monitor</td><td>:</td><td align="right"><img src="../images/<%=image%>"/></td>
			</tr>
			<%
				statusString = null;
				if (status.getServerStatus() !=null)
					statusString = (String)status.getServerStatus().get("FileMonitor");
				if (statusString ==null || "0".equals(statusString))
					image = "error.gif";
				else if ("2".equals(statusString))
					image="status_sus.gif";
				else
					image="status_ok.gif";
			%>
			<tr>
				<td width="200" class="content">File Monitor</td><td>:</td><td align="right"><img src="../images/<%=image%>"/></td>
			</tr>
			<%
				statusString = null;
				if (status.getServerStatus() !=null)
					statusString = (String)status.getServerStatus().get("QueueMonitor");
				if (statusString ==null || "0".equals(statusString))
					image = "error.gif";
				else if ("2".equals(statusString))
					image="status_sus.gif";
				else
					image="status_ok.gif";
			%>
			<tr>
				<td width="200" class="content">Push Service</td><td>:</td><td align="right"><img src="../images/<%=image%>"/></td>
			</tr>
			<%
			
				statusString = null;
				if (status.getServerStatus() !=null)
					statusString = (String)status.getServerStatus().get("RequestMonitor");
				if (statusString ==null || "0".equals(statusString))
					image = "error.gif";
				else if ("2".equals(statusString))
					image="status_sus.gif";
				else 
					image="status_ok.gif";
			%>
			<tr>
				<td width="200" class="content">Pull Service</td><td>:</td><td align="right"><img src="../images/<%=image%>"/></td>
			</tr>
			<%
				statusString = null;
				if (status.getServerStatus() !=null)
					statusString = (String)status.getServerStatus().get("MQMonitor");
				if (statusString ==null || "0".equals(statusString))
					image = "error.gif";
				else if ("2".equals(statusString))
					image="status_sus.gif";
				else
					image="status_ok.gif";
			%>
			<tr>
				<td width="200" class="content">Queue Monitor</td><td>:</td><td align="right"><img src="../images/<%=image%>"/></td>
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
</td></tr>
<tr>
	<td valign="top">
	<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Message Throughput</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
		<td bgcolor="#E2E2E2" valign="top" height="100%" width="100%" class="content">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
				<tr><td class ="content">Throughput</td><td>:</td><td class ="content"><font color="red"><b><%=status.getThroughput()%> messages/sec</b></font></td>
				<tr><td class ="content">Timestamp</td><td>:</td><td class ="content"><b><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date())%></b></td>
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
	<td>
	<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;SMS Service Sessions</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
		<td bgcolor="#E2E2E2" valign="top" width="100%" class="content">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
			<%
				java.util.Map sessions = status.getSessionStatus();
				Object key = null;
				if (sessions==null || sessions.size()==0)
				{
			%>
				<tr>
					<td width="100%" class="content" colspan=3>Session information not available</td>
				</tr>
			<%
				}
				else
				{
					java.util.Iterator it = sessions.keySet().iterator();
					while(it.hasNext())
					{
						key = it.next();
						statusString = (String)sessions.get(key);
						if ("0".equalsIgnoreCase(statusString))
							image="error.gif";
						if ("1".equalsIgnoreCase(statusString))
							image="status_ok.gif";
						if ("3".equalsIgnoreCase(statusString))
							image="queue.gif";
					%>
					<tr>
						<td width="200" class="content"><%=key%></td><td class="content">:</td><td align="right"><img src="../images/<%=image%>"></img></td>
					</tr>
					<%
					}
				}
			%>
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
<tr>
	<td colspan="2" valin="top">
	<table border="0" cellspacing="0" cellpadding="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">Message Log</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
		<td bgcolor="#E2E2E2" valign="top" width="100%" class="content">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100% height="100%">
			<tr><td><iframe src="../action/status?param=errorLog" width="100%" height="100%"></iframe></td></tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;">&nbsp;</td>
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
<%
}
%>
</html:form>
</body>
</html:html>