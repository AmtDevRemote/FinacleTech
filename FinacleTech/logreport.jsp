<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList, java.util.List, com.techunified.webclient.util.LabelValue" %>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%
	String reportName = request.getParameter("name");
%>
<html>
<head>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<title>Untitled Document</title>
<script language="javascript">
function formSubmit(name)
{
	document.forms[0].target="content";
	document.forms[0].action="../action/reports?action=<%=reportName%>";
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
					<table border="0" cellpadding="1" cellspacing="1">
						<tr>
							<td class="blk" align="right" nowrap>From</td>
							<td class="blk" ><ccadmin:datetime prefix="from" fromYear="2000" toYear="2050" dateTime="date"/></td>
							<td>&nbsp;</td>
							<td class="blk" align="right" nowrap>To</td>
							<td><ccadmin:datetime prefix="to" fromYear="2000" toYear="2050" dateTime="date"/></td>
							<td>&nbsp;</td>
							<td><input type="button" value="Submit" onClick="formSubmit()"/></td>
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