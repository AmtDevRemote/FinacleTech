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
	if (getSelectedRadioValue()=="systemFile")
	{
		if(window.document.forms[0].groupFile.value=="")
		{
			alert("Group File is mandatory");
			window.document.forms[0].groupFile.focus();
			return false;
		}
	}
	else if (getSelectedRadioValue()=="new")
	{
		if(window.document.forms[0].groupName.value=="")
		{
			alert("Group Name is mandatory");
			window.document.forms[0].groupName.focus();
			return false;
		}
	}
	else
	{
		alert("Please select a method");
		return false;
	}
	
	if(window.document.forms[0].groupPriority.value=="")
	{
		alert("Group Priority is mandatory");
		window.document.forms[0].groupPriority.focus();
		return false;
	}
	return true;
}
function updateGroupFile(element)
{
	if (element.checked)
	{
		document.forms[0].groupFile.disabled=false;
		document.forms[0].groupName.disabled=true;
	}
	else
	{
		document.forms[0].groupFile.disabled=true;
		document.forms[0].groupName.disabled=false;
	}
}
function getSelectedRadioValue() {
	for (var i = 0; i<document.forms[0].importFromFile.length; i++) {
		if (document.forms[0].importFromFile[i].checked) {
			return document.forms[0].importFromFile[i].value;
		}
	}
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
<html:form method="post" enctype="multipart/form-data" action="/distributionList?action=saveGroup" onsubmit="return checkField()">
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
		<td class="framemenu_date" colspan="3">Add Group</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="20" class="content" height="23"><html:radio name="distributionListForm" property="importFromFile" value="new" /></td>
				<td width="150" class="content" height="23">New Group<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="distributionListForm" maxlength="32"  property="groupName" value="" size="32" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
				<td  height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="20" class="content" height="23"><html:radio name="distributionListForm" property="importFromFile" value="systemFile"/></td>
				<td width="150" class="content" height="23" align="left">System File<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:file name="distributionListForm" maxlength="19" property="groupFile" value="" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="20" class="content" height="23" align="left">&nbsp;</td>
				<td width="150" class="content" height="23" align="left">Language</td>
				<td class="content" height="23">
					<html:select name="distributionListForm" property="groupLanguage" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; ">
						<option value="AR">Arabic</option>
						<option value="EN" selected>English</option>
					</html:select>
				</td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="20" class="content" height="23" align="left">&nbsp;</td>
				<td width="150" class="content" height="23" align="left">Description</td>
				<td class="content" height="23"><html:text name="distributionListForm" maxlength="100" property="groupDesc" value="" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="20" class="content" height="23" align="left">&nbsp;</td>
				<td width="150" class="content" height="23" align="left">Priority<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="distributionListForm" maxlength="100" property="groupPriority" value="" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
		    <tr>
				<td class="framemenu_item" width="150"><input type="button" value="Close" name="B0" onclick='javascript:window.close();'></td>
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