<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Processes</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">


</head>
<body topmargin="0" leftmargin="0">
<table width="100%" height="100%">
<tr>
<td valign="top">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Throughput Report</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td bgcolor="#E2E2E2" valign="top" width="100%">
			<table border="0" cellspacing="1" width="100%" bgcolor="#E2E2E2" id="table1">
			<tbody> 
				<%if(request.getAttribute("error")!=null){%>
				<tr>
				    <td class="content" colspan="6"><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
				</tr>
				<%}%>
				<tr class="content">
				  <td width="100" align="center" bgcolor="#FFB502">Date</td>
				  <td width="100" align="center" bgcolor="#FFB502">Maximum Throughput (Msg/sec)</td>
				  <td width="100" align="center" bgcolor="#FFB502">Minimum Throughput (Msg/sec)</td>
				  <td width="100" align="center" bgcolor="#FFB502">Average Throughput (Msg/sec)</td>
				</tr>
				<logic:present name="throughputs" scope="request">
				<logic:iterate id="tpdetails" name="throughputs">
				 <tr class="content">
				   <td bgcolor="white"><bean:write name="tpdetails" property="date"/></td>
				   <td bgcolor="white"><bean:write name="tpdetails" property="max"/></td>
				   <td bgcolor="white"><bean:write name="tpdetails" property="min"/></td>
				   <td bgcolor="white"><bean:write name="tpdetails" property="average"/></td>
				 </tr>
				</logic:iterate>
				</logic:present>
				<logic:notPresent name="throughputs" scope="request">
				 <tr class="content">
					<td colspan="4" align="left">No Data Found</td>
				 </tr>
				</logic:notPresent>
			<tbody>
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
</table>
</body>
</html:html>