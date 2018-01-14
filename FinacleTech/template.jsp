<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Template</title>
<link href="css/main-styles.css" rel="stylesheet" type="text/css">
<link href="css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
   	function submitDelete()
	{
		var total = 0;
		var max = 1;
		var form = document.frames[0].document.forms[0];
		var doc = document.frames[0].document
		if (!form.templateId)
			return false;
		if (form.templateId.length)
			max = form.templateId.length;
		for(var i=1;i<=max;i++){
			
			if(doc.getElementById(i.toString()).checked)
				total++;
		}
        if (total == 0)
		{
			alert('No records selected');
			return false;
		}
		else
		{	
			if (confirm('Are you sure to delete'))
				form.submit();
		}
	}
function submitMessage()
{
	if (document.forms[0].groupMessage.value=="")
	{
		alert("Please specify message");
		document.forms[0].groupMessage.focus();
		return false;
	}
	var total = 0;
	var max = 1;
	var form = document.frames[0].document.forms[0];
	var doc = document.frames[0].document
	if (!form.groupId)
		return false;
	if (form.groupId.length)
		max = form.groupId.length;
	for(var i=1;i<=max;i++){
			
		if(doc.getElementById(i.toString()).checked)
			total++;
	}
    if (total == 0)
	{
		alert('No records selected');
		return false;
	}
	else
	{	
		form.groupMessage.value=document.forms[0].groupMessage.value;
		for (var i=0; i< document.forms[0].language.length; i++)
		{
			if (document.forms[0].language[i].checked)
				form.language.value=document.forms[0].language[i].value;
		}
		form.action="../action/distributionList?action=sendMessage";
		form.target=document.frames[1].name;
		form.submit();
	}
}
function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}
function checkField()
{
	if(window.document.forms[0].userid.value=="")
	{
		alert("User Id is mandatory");
		window.document.forms[0].userid.focus();
		return false;
	}
	if(window.document.forms[0].password.value=="")
	{
		alert("Password is mandatory");
		window.document.forms[0].password.focus();
		return false;
	}
	if(window.document.forms[0].fname.value=="")
	{
		alert("First name is mandatory");
		window.document.forms[0].fname.focus();
		return false;
	}
	if(window.document.forms[0].role.value=="")
	{
		alert("Role is mandatory");
		window.document.forms[0].role.focus();		
		return false;
	}
	if(window.document.forms[0].fname.value!="")
	{
		inputStr=window.document.forms[0].fname.value.toString();
		for(var i=0;i<inputStr.length;i++) 
		{
			var oneInt=inputStr.charCodeAt(i);
			if(oneInt>=33 && oneInt<=45 || oneInt>=58 && oneInt<=64 || oneInt>=91 && oneInt<=96 || oneInt>=123 && oneInt<=255 || oneInt==47)
			{
				alert("Only character Value is Allowed in First name")		
				window.document.forms[0].fname.focus();
				window.document.forms[0].fname.value="";
				return false
			}
		}	
	}
	if(window.document.forms[0].lname.value!="")
		{
			inputStr=window.document.forms[0].lname.value.toString();
			for(var i=0;i<inputStr.length;i++) 
			{
				var oneInt=inputStr.charCodeAt(i)
				if(oneInt>=33 && oneInt<=45 || oneInt>=58 && oneInt<=64 || oneInt>=91 && oneInt<=96 || oneInt>=123 && oneInt<=255 || oneInt==47)
				{
					alert("Only character Value is Allowed in Last name");		
					window.document.forms[0].lname.focus();
					window.document.forms[0].lname.value="";
					return false
				}
			}	
		}
	return true;
}
</script>
</head>
<body>
<html:form method="post" action="/distributionList">
<table width="100%" height="100%">
<%
if(session.getAttribute("userallready")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=session.getAttribute("userallready")%></b></font></td>
</tr>
<%}session.removeAttribute("userallready");%>
<tr>
<td height="100%" valign="top">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Templates</td>
	</tr>
	<tr>
		<td style="background-image:url(images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
		<td bgcolor="#E2E2E2" valign="top" height="100%" width="100%">
			<table cellpadding="0" cellspacing="0" id="outer_table" width="100%"  height="100%">
			<tr>
				<td height="5" colspan="2"></td>
			</tr>
			<tr>
				<td width="100%"  height="100%" align="left">
					<iframe name="groupList" src="action/templates" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
				</td>
			</tr>
			<tr>
				<td align="left">
					<input type="button" value="&nbsp;Add&nbsp;" name="B3" class="logout_box" href="#" onClick="MM_openBrWindow('action/templates?action=addTemplate','newList', 310, 430)">&nbsp;
					<input type="button" value="Delete" name="B3" class="logout_box" onClick="submitDelete()">
				</td>
			</tr>
			<tr>
				<td width="100%" height="1" align="left">
					<iframe name="blankFrame" src="blank.htm" width="100%" height="1" frameborder="0" marginwidth="0" marginheight="0"></iframe>
				</td>
			</tr>
			</table>
		</td>
		<td style="background-image:url(images/menu-bg-right.gif); background-repeat:repeat-y;">&nbsp;</td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-image: url(images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>

</table>
</html:form>
</body>
</html:html>