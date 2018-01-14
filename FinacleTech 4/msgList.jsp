<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>USER</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
    function custList()
    {
    	alert("before action");    	
    }
    function list()
    {
    	alert("new function");
    	document.forms[0].target="custList";
		document.forms[0].action="../action/customerList?action=showCustomers";
		document.forms[0].submit();
    }
    function submitMessage()
	{
		var form = document.frames[0].document.forms[0];
		var doc = document.frames[0].document;		
		var filename=document.forms[0].custFile.value;
		form.custSelFile.value=filename.toString();
		alert(form.custSelFile.value);
		form.action="../action/customerList?action=sendMessage";
		form.target=self.name;
		form.submit();
	}
</script>
</head>
<body>
<html:form method="post"  enctype="multipart/form-data" action="/distributionList">
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
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;File</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td bgcolor="#E2E2E2" valign="top" width="100%">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
			<tr>
				<td height="5" colspan="2"></td>
			</tr>
			<tr>
				<td class="content" rowspan=2 width="400">
					<input type="file" name="custFile" value="" size="100" onChange="list();">					
				</td>				
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
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
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
					<iframe name="custList" src="../blank.htm" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
				</td>
			</tr>
			<tr>
				<td align="left">
					<input type="button" value="Send Message" name="B3" class="logout_box" onClick="submitMessage()">
				</td>
			</tr>
			<tr>
				<td width="100%" height="1" align="left">
					<iframe name="blankFrame" src="../blank.htm" width="100%" height="1" frameborder="0" marginwidth="0" marginheight="0"></iframe>
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