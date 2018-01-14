<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ page import="com.techunified.webclient.data.DoGroup, java.util.List" %>
<html:html locale="true">
<head>
<title>Group</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<%
	List groupList = (List)request.getAttribute("extgroups");
%>
<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].fromName.value=="")
	{
		alert("From Name is mandatory");
		window.document.forms[0].fromName.focus();
		return false;
	}
	if(window.document.forms[0].subject.value=="")
	{
		alert("Subject is mandatory");
		window.document.forms[0].subject.focus();
		return false;
	}
	if(window.document.forms[0].message.value=="")
	{
		alert("Message is mandatory");
		window.document.forms[0].message.focus();
		return false;
	}
	if(window.document.forms[0].groupFile.value=="")
	{
		alert("File is mandatory");
		window.document.forms[0].groupFile.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
if (request.getAttribute("closeWindow")!=null) {
%>
		<script language="javascript">
			opener.frames[0].location.href="../action/distributionList";
			window.close();
		</script>
<%
}
%>
<html:form method="post" enctype="multipart/form-data" action="/bulkmail?action=sendmail" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%if(request.getAttribute("error")!=null){%>
    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
    	<%}%>
    </td>
  </tr>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">Send Mail</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23">From Name<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="bulkMailForm" maxlength="32"  property="fromName" value="" size="32" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
				<td  height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Subject<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="bulkMailForm" maxlength="100" property="subject" value="" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Message<font color="#FF0000">*</td>
				<td class="content" height="23"><html:textarea name="bulkMailForm" rows="6" cols="30" property="message" value="" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Group File<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:file name="bulkMailForm" maxlength="19" property="groupFile" value="" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			
		    <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td class="framemenu_item" align="right"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
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
</html:form>
</body>
</html:html>