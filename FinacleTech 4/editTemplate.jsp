<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.data.DoTemplate"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Template</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].templateName.value=="")
	{
		alert("Template name is mandatory");
		window.document.forms[0].templateName.focus();
		return false;
	}
	if(window.document.forms[0].language.value=="")
	{
		alert("Language is mandatory");
		window.document.forms[0].language.focus();
		return false;
	}
	if(window.document.forms[0].templateType.value=="")
	{
		alert("Template type is mandatory");
		window.document.forms[0].templateType.focus();
		return false;
	}
	if(window.document.forms[0].message.value=="")
	{
		alert("Mesage is mandatory");
		window.document.forms[0].message.focus();		
		return false;
	}
	if(window.document.forms[0].mail.value=="")
	{
		alert("Mail file name is mandatory");
		window.document.forms[0].mail.focus();		
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
if (request.getAttribute("close")!=null) {
%>
		<script language="javascript">
			opener.location.href="../action/templates";
			window.close();
		</script>
<%
}
%>
<html:form method="post" action="/templates?action=editSaveTemplate" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%if(request.getAttribute("error")!=null){%>
    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
    	<%
    	}
    	DoTemplate template = new DoTemplate();
    	if (request.getAttribute("template")!=null)
    		template = (DoTemplate)request.getAttribute("template");
    	%>
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
		<td class="framemenu_date" colspan="3">&nbsp;Edit Template</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<html:hidden name="templateForm" property="templateId" value="<%=template.getTemplateId()%>" />
			<tr>
				<td width="150" class="content" height="23" align="left">Template Name<font color="#FF0000">*</font></td>
				<td class="content" height="23"><html:text name="templateForm" maxlength="50" property="templateName" value="<%=template.getTemplateName()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			  <tr>
				<td width="150" class="content" height="23">Language<font color="#FF0000">*</font></td>
				<td height="23">
					<html:select name="templateForm" property="language" value="<%=template.getLanguage()%>" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; ">
						<html:option value="AR">Arabic</html:option>
						<html:option value="EN">English</html:option>
					</html:select>
				</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" height="23">Template Type<font color="#FF0000">*</font></td>
				<td height="23">
					<html:select name="templateForm" property="templateType" value="<%=template.getTemplateType()%>" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; ">
						<html:option value="SYSTEM">System</html:option>
						<html:option value="ERROR" >Error</html:option>
						<html:option value="APPLICATION">Application</html:option>
						<html:option value="User">User</html:option>
					</html:select>
				</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" class="content" valign="top" height="23">Message<font color="#FF0000">*</font></td>
				<td height="23"><html:textarea name="templateForm" property="message" value="<%=template.getMessage()%>" rows="5" cols="40" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td width="150" valign="top" class="content" height="23">Mail File<font color="#FF0000">*</font></td>
				<td height="23"><html:text name="templateForm" property="mail" value="<%=template.getMail()%>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" width="150"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>
				<td class="framemenu_item" align="right"></td>		
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