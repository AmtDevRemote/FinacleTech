<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList, java.util.List, com.techunified.webclient.util.LabelValue" %>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%
	String reportName = request.getParameter("name");
	List groups = (List)request.getAttribute("groups");
	List templates = (List)request.getAttribute("templates");
%>
<html>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title>
<script language="javascript">
function formSubmit()
{
	document.forms[0].target="content";
	document.forms[0].action="../action/reports?action=display&name=<%=reportName%>";
	document.forms[0].submit();
} 
function MM_openBrWindow(theURL,target, h, w) {
  if (h==null && w==null) 
  	 window.open(theURL,target);
  else
  {
  	var winl = (screen.width - w) / 2;
    var wint = (screen.height - h) / 2;
    winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+'resizable=0, scrollbars=yes'
   	window.open(theURL, target, winprops)
  }
}
</script>
</head>
<body topmargin="0" leftmargin="0">
<html:form action="/reports" method="post">
<table width="100%" height="100%">
<tr>
	<td>
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
				<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
				<td width="100%" style="background-color:#005973;"></td>
				<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
				<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
			</tr>
			<tr>
				<td class="framemenu_date" colspan="3" align="left">&nbsp;Search Options</td>
			</tr>
			<tr>
				<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
				<td bgcolor="#E2E2E2" valign="top">
					<table border="0" cellpadding="1" cellspacing="1" width="100%">
						<tr>
							<td class="blk" align="right" nowrap>From</td>
							<td class="blk" ><ccadmin:datetime prefix="from" fromYear="2000" toYear="2050" dateTime="date"/></td>
							<td class="blk" align="right">&nbsp;-&nbsp;</td>
							<td class="blk" ><ccadmin:datetime prefix="from" dateTime="time"/></td>
							<logic:present name="nonadmin" scope="request">
							<logic:present name="groups" scope="request">
								<td class="blk" align="right">Customer Groups</td>
								<td class="blk" >
										<html:select property="role">
											<option value="">--All--</option>
													<logic:present name="groups" scope="request">
														<logic:iterate id="DoGroup" name="groups" scope="request">
																<option value="<bean:write name="DoGroup" property="groupName"/>"><bean:write name="DoGroup" property="groupName"/></option>				</logic:iterate>
													</logic:present> 

											</html:select>
									</td>
								</logic:present> 
							</logic:present>
							<logic:notPresent name="nonadmin" scope="request">
									<td class="blk" align="right">Source</td>
									<td class="blk" ><html:text name="reportForm" property="source" styleClass="blk" size="15"/></td>
							</logic:notPresent>
							<logic:present name="templates" scope="request">
							<td class="blk" align="right">Application</td>
							<td>
								<html:select name="reportForm" property="transaction">
									<ccadmin:combo elements="<%=(List)request.getAttribute("templates")%>"/>
								</html:select>
							</td>
							</logic:present>
							<logic:present name="campaigns" scope="request">
							<td class="blk" align="right">Campaign</td>
							<td>
								<html:select name="reportForm" property="campaign">
									
									<ccadmin:combo elements="<%=(List)request.getAttribute("campaigns")%>"/>
									
								</html:select>
							</td>
							</logic:present>
							<td class="blk" align="right">Language</td>
							<td class="blk" >
								<html:select name="reportForm" property="language">
									<option value="">--All--</option>
									<option value="AR">Arabic</option>
									<option value="EN">English</option>
								</html:select>
							</td>
						</tr>
						<tr>
							<td class="blk" align="right" nowrap>To</td>
							<td><ccadmin:datetime prefix="to" fromYear="2000" toYear="2050" dateTime="date"/></td>
							<td class="blk" align="right">&nbsp;-&nbsp;</td>
							<td><ccadmin:datetime prefix="to" dateTime="time"/></td>
							<td class="blk" align="right">Mobile</td>
								<td><html:text name="reportForm" property="mobile" styleClass="blk" size="15"/></td>
							<td class="blk" align="right">Status</td>
							<td class="blk" >
								<html:select name="reportForm" property="status">
									<option value="">--All--</option>
									<option value="Accepted">Sent</option>
									<option value="Rejected">Rejected</option>
									<option value="Delivered">Delivered</option>
									<option value="Received">Received</option>
									<option value="Expired">Expired</option>
								</html:select>
							</td>
							<logic:notPresent name="nonadmin" scope="request">
							<logic:present name="groups" scope="request">
							<td class="blk" align="right">Customer Groups</td>
							<td class="blk" >
								<html:select property="role">
									<option value="">--All--</option>
									
								<logic:present name="groups" scope="request">
								<logic:iterate id="DoGroup" name="groups" scope="request">
									<option value="<bean:write name="DoGroup" property="groupName"/>"><bean:write name="DoGroup" property="groupName"/></option>															         	</logic:iterate>
								</logic:present> 
								</html:select>
							</td>
							</logic:present> 
							</logic:notPresent>
						</tr>
						<tr>
							<td colspan="5"><input type="button" value="Submit" onClick="formSubmit()"/></td>
							
							
							<td height="20" align="right" valign="bottom" colspan="5" align="right"><a href="../action/reports?action=display&type=html&name=<%=reportName%>"  target="content"/><img src="../images/refresh.jpg" alt="refresh" border="0"></a>
								&nbsp;<a href="javascript:MM_openBrWindow('../action/reports?action=display&type=print&name=<%=reportName%>','print_window', 600,600);"/><img src="../images/print.jpg" alt="print" border="0"></a>
								&nbsp;<a href="../action/reports?action=display&type=pdf&name=<%=reportName%>" target="content"/><img src="../images/pdf.jpg" alt="download" border="0"></a>
								&nbsp;<a href="../action/reports?action=display&type=xls&name=<%=reportName%>" target="content"/><img src="../images/excel.jpg" alt="pdf" border="0"></a></td>
						</tr>
					</table>
				</td>
				<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
			</tr>
			<tr>
				<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
				<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
				<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
			</tr>
		</table>
	</td>
	</tr>
	<tr>
		<td width="100%" height="100%" colspan="2" valign="top"><iframe name="content" src="../blank.htm" scrolling="auto" width="100%" height="100%" frameborder="0" framespacing="0"></iframe></td>
	</tr>
	<tr>
		<td height="1" colspan="2"><iframe name="zero" src="../blank.htm" scrolling="auto" height="1" frameborder="0" framespacing="0"></iframe></td>
	</tr>
</table>
</html:form>
</body>
</html>