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
	if(window.document.forms[0].campaignName.value=="")
	{
		alert("Campaign name is mandatory");
		window.document.forms[0].campaignName.focus();
		return false;
	}
	if(window.document.forms[0].language.value=="")
	{
		alert("Language is mandatory");
		window.document.forms[0].language.focus();
		return false;
	}
	if(window.document.forms[0].campaignType.value=="")
	{
		alert("Campaign type is mandatory");
		window.document.forms[0].campaignType.focus();
		return false;
	}
	if(window.document.forms[0].campaignText.value=="")
	{
		alert("Campaign text is mandatory");
		window.document.forms[0].campaignText.focus();		
		return false;
	}
	return true;
}
var rowCount=1;
</script>
</head>
<body>
<%
if (request.getAttribute("close")!=null) {
%>
		<script language="javascript">
			opener.frames[0].location.href="../action/campaign";
			window.close();
		</script>
<%
}
%>
<bean:define id="campaignDetail" name="campaign"/>
<html:form method="post" action="/campaign?action=updateCampaign" onsubmit="return checkField()">
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
<input type="hidden" name="campId" value="<bean:write name="campaignDetail" property="campId"/>">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Edit Campaign</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">Code<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><input type="hidden" maxlength="50" name="responseCode" value="<bean:write name="campaignDetail" property="responseCode"/>"><bean:write name="campaignDetail" property="responseCode"/></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Name<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><input type="text" maxlength="50" name="campName" value="<bean:write name="campaignDetail" property="campName"/>" size="26" class="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" valign="top" class="content" height="23">Campaign Text<font color="#FF0000">*</font></td>
				<td height="23" colspan="2"><textarea name="campText" rows="6" cols="40" class="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;"><bean:write name="campaignDetail" property="campText"/></textarea></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <tr>
			  	<bean:define id="language" name="campaignDetail" property="campLanguage"/>
				<td width="150" class="content" height="23">Language<font color="#FF0000">*</font></td>
				<td height="23" colspan="2">
					<html:select name="campaignForm" property="campLanguage" value="<%=language.toString()%>" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1; ">
						<option value="AR">Arabic</option>
						<option value="EN" selected>English</option>
					</html:select>
				</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  <% int increment=0; %>
			  <logic:iterate id="optionDetails" name="campaignDetail" property="campOptions">
			  <tr>
				<td width="150" class="content" height="23">Option <%=++increment%></td>
				<input type="hidden" name="newId" value="<bean:write name="optionDetails" property="optionId"/>"/>
				<td height="23" width="20">
					<input type="text" name="optionIndex" size="4" value="<bean:write name="optionDetails" property="optionIndex"/>" class="content" style="border: 1px solid #808080; padding-left: 1; padding-right: 1; padding-top: 1; padding-bottom: 1; "/>
				</td>
				<td height="23">
					<input type="text" name="optionText" size="10"  value="<bean:write name="optionDetails" property="optionText"/>" class="content" style="border: 1px solid #808080; padding-left: 1; padding-right: 1; padding-top: 1; padding-bottom: 1; "/>
				</td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  </logic:iterate>
			  <tr>
				<td colspan="4">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td colspan="2"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>
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