<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Messages</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
function submitCustomer()
	{
		var total = 0;
		var max = 1;
		var form = document.frames[0].document.forms[0];
		var doc = document.frames[0].document
		if (!form.groupId)
			return false;
		if (form.groupId.length)
			max = form.groupId.length;
		for(var i=1;i<=max;i++)
		{
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
			form.action="../action/distributionList?action=updateCustomers";
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
	var doc = document.frames[0].document;
	alert(form.mode.value);
if(form.mode.value=="groups")
		{
			if (!form.groupId)
				return false;
			if (form.groupId.length)
				{
					max = form.groupId.length;
				}
			var grpNms="";	
			for(var i=1;i<=max;i++)
				{
					if(doc.getElementById(i.toString()).checked)
						{	
							if (max==1)
								grpNms = grpNms+form.groupName.value+",";
							else
								grpNms = grpNms+form.groupName[i-1].value+",";		
							total++;
						}		
					}
			grpNms = grpNms.substring(0, grpNms.length-1);
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
					for (var i=0; i< document.forms[0].messageType.length; i++)
						{
							if (document.forms[0].messageType[i].checked)
								form.messageType.value=document.forms[0].messageType[i].value
					    }
					
					form.serverFile.value="message";
					var confirmation = confirm("Do you want to send message to "+grpNms+" groups?");
					if(confirmation)
						{
							form.action="../action/distributionList?action=sendMessage";
							form.target=self.name;
							form.submit();
						}
					}
	}
	else if(form.mode.value=="newcustomer")
		{
			if(form.cnumber.value==""  ||  form.cname.value=="")
				{
					alert("Enter new customer details ");
					return false;
				}
			form.groupMessage.value=document.forms[0].groupMessage.value;
					for (var i=0; i< document.forms[0].language.length; i++)
						{
							if (document.forms[0].language[i].checked)
								form.language.value=document.forms[0].language[i].value;
							
						}
					for (var i=0; i< document.forms[0].messageType.length; i++)
						{
							if (document.forms[0].messageType[i].checked)
								form.messageType.value=document.forms[0].messageType[i].value;
						}
			form.serverFile.value="message";
			form.action="action/distributionList?action=sendMessage";
			form.target=self.name;
			form.submit();
	} else if(form.mode.value="custfromgroups")
		{
				for (var i=0; i< document.forms[0].language.length; i++)
						{
							if (document.forms[0].language[i].checked)
								form.language.value=document.forms[0].language[i].value;
							
						}
				for (var i=0; i< document.forms[0].messageType.length; i++)
						{
							if (document.forms[0].messageType[i].checked)
								form.messageType.value=document.forms[0].messageType[i].value
						}
				form.serverFile.value="message";
				form.groupMessage.value=document.forms[0].groupMessage.value;
				form.action="../action/distributionList?action=sendMessage";
				
				form.target=self.name;
				form.submit();
			
		}
}

function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
			}

</script>
</head>
<body>
<html:form  method="post" action="/distributionList?action=createMessage">
<table width="100%" height="100%">
<%if(request.getAttribute("messages")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=(String)request.getAttribute("messages")%></b></font></td>
</tr>
<%}
%>
<tr>
<td height="100%" valign="top" colspan="7">
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Message</td>
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
					<html:textarea name="distributionListForm" property="groupMessage" value="" rows="3" cols="60" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" />
				</td>
				<td  class="content" align="left" valign="bottom"><input type="radio" name="language" value="AR" >&nbsp;Arabic&nbsp;&nbsp;<input type="radio" name="language" value="EN" checked>&nbsp;English</td>
			</tr>
			<tr>
				<td  class="content" align="left" valign="bottom"><input type="radio" name="messageType" value="T" checked>&nbsp;Text    &nbsp;&nbsp;&nbsp;<input type="radio" name="messageType" value="F">&nbsp;Flash&nbsp;&nbsp;&nbsp;<input type="radio" name="messageType" value="B">&nbsp;Blink</td>
			</tr>
			<tr>
				<td class="content" align="left" valign="bottom"><a href="../newcustomer.jsp" target="groupList" class="style1">New Customer</a>&nbsp;&nbsp;&nbsp;&nbsp;
					    <a href="javascript:MM_openBrWindow('../action/templates?action=displayTemplates','new',320,600)" class="style1">Template</a></td>
			</tr>
			<tr>
				<td><input name="Submit" type="button" class="logout_box" value="Send Message" onClick="submitMessage()"></td>
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
				<td width="100%"  height="100%" colspan="6">
					<iframe marginwidth="2" name="groupList" src="../action/distributionList" width="100%"  align="center" height="100%" frameborder="0" marginwidth="0" marginheight="0"></iframe>
				</td>
	</tr>
	

</table>
</html:form>
<% 
if(request.getAttribute("error")!=null){ %>
<script language="javascript">
	if(confirm('<%=(String)request.getAttribute("error")%>'))
	{
		document.forms[0].action="../action/distributionList?action=resendmessage";
		document.forms[0].submit();
	}
</script>
<%}%> 
</body>
</html:html>