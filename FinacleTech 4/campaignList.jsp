<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript" type="text/JavaScript">

function MM_openBrWindow(theURL,target) { 
  window.open(theURL,target);
}
function checkme(numberOfCheckbox) {	
	if (window.document.getElementById("checkbox").checked) {
		for(i=1;i<=numberOfCheckbox;i++){
			document.getElementById(i.toString()).checked = true;
		}
	}
	else{ 
		for(i=1;i<=numberOfCheckbox;i++){
			document.getElementById(i.toString()).checked = false;
		}			
	}	
}
function deleteUser(noofuser)
{
	if(checkBoxChecked(noofuser))	
	{
		window.document.forms[0].submit();
	}
	else
	{
		return false;	
	}	
}

function checkBoxChecked(maxIndex){
  allow= false;
  for(i=1;i<=maxIndex;i++){
    if(document.getElementById(i.toString()).checked){
     	if(confirm("Are you sure you want to delete?")){       
     		allow= true;
     		return allow;
 	   }else return allow;
 	}
     
  }
  if(!allow) alert("No Record Selected");
  return allow;
}
function uncheck(form){
  	form.checkItem.checked=false;
  }
  
function submitForm()
{
	document.forms[0].submit();
}
</SCRIPT >
</head>
<body topmargin="0" leftmargin="0" bgcolor="#E2E2E2">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#E2E2E2">
<tr>
<td valign="top" width="100%">
<%
	int num=0;
%>
<logic:present name="campaigns">
	<logic:iterate id="campaignDetails" name="campaigns">
		<%
			num=num+1 ;
		%>
	</logic:iterate>
</logic:present>
<html:form method="post" action="/campaign">
	<table border="0" cellspacing="1" width="100%" bgcolor="#E2E2E2" id="table1">
	<tbody> 
		<%if(request.getAttribute("error")!=null){%>
		<tr>
		    <td class="content" colspan="6"><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
		</tr>
		<%}%>
		<tr class="content">
		  <td width="50" align="center" bgcolor="#FFB502">Code</td>
		  <td width="50" align="center" bgcolor="#FFB502">Name</td>
		  <td width="250" align="center" bgcolor="#FFB502">Text</td>
		  <td width="50" align="center" bgcolor="#FFB502">Language</td>
		  
		  <td width="50" align="center" bgcolor="#FFB502">Role</td>
		  <td width="50" align="center" bgcolor="#FFB502">Send</td>
		  <td width="20" align="center" bgcolor="#FFB502"><input TYPE="checkbox" id="checkbox" NAME="checkItem" onclick="checkme(<%= num %>)"></td>
		</tr>
		<%int increment=0;%>
		<logic:present name="campaigns" scope="request">
		<logic:iterate id="campaignDetails" name="campaigns">
		 <%
		 increment++;
		 %>
		 <tr class="content">
		   <td bgcolor="white"><bean:write name="campaignDetails" property="responseCode"/></td>
		   <td bgcolor="white"><a href="../action/campaign?action=displayEditCampaign&campId=<bean:write name="campaignDetails" property="campId"/>" target="_parent"><bean:write name="campaignDetails" property="campName"/></a></td>
		   <td bgcolor="white"><bean:write name="campaignDetails" property="campText"/></td>
		   <td bgcolor="white"><bean:write name="campaignDetails" property="campLanguage"/></td>
		   <td bgcolor="white"><bean:write name="campaignDetails" property="campRoleId"/></td>
		   <td bgcolor="white"><a href="../action/campaign?action=displaySendCampaign&campId=<bean:write name="campaignDetails" property="campId"/>" target="_parent">Send</a></td>
		   <td width="20" align="center"  bgcolor="white">
			<input type="checkBox"  name="serialId" value="<%=increment%>" id="<%=increment%>">
			<input type="hidden"  name="campId" value="<bean:write name="campaignDetails" property="campId"/>">
		   </td>
		 </tr>
		</logic:iterate>
		</logic:present>
		<logic:notPresent name="campaigns" scope="request">
		 <tr class="content">
			<td colspan="3" align="left">No Data Found</td>
		 </tr>
		</logic:notPresent>
	<tbody>
    </table>
</html:form>
</td>
</tr>
</table>
</body>
</html:html>