<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>SMPP</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript" type="text/JavaScript">

function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
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
</SCRIPT >
</head>
<body topmargin="0" leftmargin="0" bgcolor="#E2E2E2">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#E2E2E2">
<tr>
<td valign="top" width="100%">
<%
	int num=0;
%>
<logic:present name="enumerations">
	<logic:iterate id="enumerationDetails" name="enumerations">
		<%
			num=num+1 ;
		%>
	</logic:iterate>
</logic:present>
<html:form method="post" action="/enumeration?action=deleteEnum">
	<table border="0" cellspacing="1" ceppading="2" width="100%" bgcolor="#E2E2E2">
		<tr class="content">
		  <td width="20" align="center" bgcolor="#FFB502"><input TYPE="checkbox" id="checkbox" NAME="checkItem" onclick="checkme(<%= num %>)"></td>
		  <td width="100" align="center" bgcolor="#FFB502">Name</td>
		  <td width="20" align="center" bgcolor="#FFB502">Language</td>
		  <td width="40" align="center" bgcolor="#FFB502">Type</td>
		  <td align="center" bgcolor="#FFB502">Value</td>
		</tr>
		<input type="hidden"  name="language" value=""/>
		<%int increment=0;%>
		<logic:present name="enumerations" scope="request">
		<logic:iterate id="enumerationDetails" name="enumerations">
		 <tr class="content">
		   
		   <td width="20" align="center"  bgcolor="white">
			<input type="checkbox"  name="enumId" value="<bean:write name="enumerationDetails" property="enumId"/>"
			id="<%=++increment%>" onClick="uncheck(this.form)">
			</td>
			<td bgcolor="white"><a href="javascript:MM_openBrWindow('../action/enumeration?action=editEnum&id=<bean:write name="enumerationDetails" property="enumId"/>','newList', 280, 430)"><bean:write name="enumerationDetails" property="enumName"/></a></td>
		    <td bgcolor="white"><a><bean:write name="enumerationDetails" property="language"/></a></td>
		    <td bgcolor="white"><bean:write name="enumerationDetails" property="enumType"/></td>
		    <td bgcolor="white"><bean:write name="enumerationDetails" property="enumValue"/></td>
		 </tr>
		</logic:iterate>
		</logic:present>
		<logic:notPresent name="enumerations" scope="request">
		 <tr class="content">
			<td colspan="5" align="left">No Data Found</td>
		 </tr>
		</logic:notPresent>
    </table>
</html:form>
</td>
</tr>
</table>
</body>
</html:html>