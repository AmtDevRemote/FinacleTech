<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.tdo.TdoUser"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>SMPP</title>
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
</SCRIPT >
</head>
<body>
<html:form method="post"  action="/role?action=deleteRole" onsubmit="">
<table width="100%" height="100%">
<tr>
<%
	int num=0;
%>
<td width="100%" height="12" class="content">
	<logic:present name="roles" scope="request">
		<logic:iterate id="roleDetails" name="roles">
			<%
				num=num+1 ;
			%>
		</logic:iterate>
	</logic:present>
</td>
</tr>
<tr>
<td valign="top" align="left">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3" align="Left">&nbsp;User Roles</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellspacing="1" width="100%">
				<tr class="content">
				  <td width="5%" align="center" bgcolor="#FFB502"><input TYPE="checkbox" id="checkbox" NAME="checkItem" onclick="checkme(<%= num %>)" ></td>
				  <td width="22%" align="center" bgcolor="#FFB502">Role Id</td>
				  <td width="23%" align="center" bgcolor="#FFB502">Role Name</td>
				</tr>
				<%int increment=0;%>
				<logic:present name="roles" scope="request">
				<logic:iterate id="roleDetails" name="roles">
				 <tr class="content">
				   <td width="4%" align="center"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
					<input type="checkbox"  name="roleIds" value="<bean:write name="roleDetails" property="roleId"/>"
					id="<%=++increment%>" onClick="uncheck(this.form)">
					</td>
				   <td width="22%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<a href="../action/role?action=displayEditRole&roleId=<bean:write name="roleDetails" property="roleId"/>"><bean:write name="roleDetails" property="roleId"/></a></td>
				   <td width="23%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="roleDetails" property="roleName"/></td>
				 </tr>
				</logic:iterate>
				</logic:present>
				<logic:notPresent name="roles" scope="request">
				 <tr class="content">
					<td colspan="4" align="left">No Data Found</td>
				 </tr>
				</logic:notPresent>
				<tr>
					<td width="693" align="center" height="29">
						<input type="button" value="&nbsp;Add&nbsp;" name="B3" class="logout_box" href="#" onClick="MM_openBrWindow('../action/role?action=displayAddRole','mainframe')">&nbsp;
						<input type="button" onClick="deleteUser(<%=num%>)" value="Delete" name="B3" class="logout_box" >
					</td>
				</tr>
            </table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
</table>
</td>
</tr>
</table>
</html:form>
</body>
</html:html>