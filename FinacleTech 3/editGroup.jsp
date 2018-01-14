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
	if(window.document.forms[0].groupName.value=="")
	{
		alert("Group name is mandatory");
		window.document.forms[0].groupName.focus();
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
</script>
</head>
<body>
<%
if (request.getAttribute("closeWindow")!=null) {
%>
		<script language="javascript">
			opener.location.href="../action/distributionList";
			window.close();
		</script>
<%
}
%>
<html:form method="post" action="/distributionList?action=updateGroup" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%if(request.getAttribute("error")!=null){%>
    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
    	<%}
    	DoGroup group = new DoGroup();
    	if (request.getAttribute("group")!=null)
    		group = (DoGroup)request.getAttribute("group");
    	%>
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
		<td class="framemenu_date" colspan="3">&nbsp;Edit Group</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<html:hidden name="distributionListForm" property="groupId" value="<%=String.valueOf(group.getGroupId())%>" />
			<tr>
				<td width="150" class="content" height="23">Group Name<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="distributionListForm" maxlength="32"  property="groupName" value="<%=group.getGroupName()%>" size="32" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; " /></td>
				<td  height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Language</td>
				<td class="content" height="23">
					<html:select name="distributionListForm" property="groupLanguage" value="<%=group.getGroupLanguage()%>" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;">
						<html:option value="AR">Arabic</html:option>
						<html:option value="EN">English</html:option>
					</html:select>
				</td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Description</td>
				<td class="content" height="23"><html:text name="distributionListForm" maxlength="100" property="groupDesc" value="<%=group.getGroupDescription()%>" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Priority<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="distributionListForm" maxlength="100" property="groupPriority" value="<%=String.valueOf(group.getGroupPriority())%>" size="20" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
		    <tr>
				<td class="framemenu_item" width="150"><input type="button" value="Close" name="B0" onclick='javascript:window.close();'></td>
				<td class="framemenu_item" align="left"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				<td align="left">&nbsp;</td>
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