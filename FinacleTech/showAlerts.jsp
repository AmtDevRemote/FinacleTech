<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<%@ page import="com.techunified.webclient.data.DoGroup, java.util.List" %>
<html:html locale="true">
<head>
<title>Add Alerts</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">

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

function uncheck(form){
  	

	form.checkItem.checked=false;
 }

function deleteAlerts(noofalerts)
{
	if(checkBoxChecked(noofalerts))	
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
</script>
</head>
<body>
<form method="post" action="../action/alerts?action=deletealert">
<% int num = 0; %>
<logic:present name="alerts" scope="request">
	<logic:iterate id="alertsInfo" name="alerts">
		<% num++; %>
	</logic:iterate>
</logic:present>
<table width="100%">
<% if(request.getAttribute("message") !=null )	{ 

String message = (String) request.getAttribute("message");
 %>
<tr><td class="content"><font color="red"><%=message%></font></td></tr>
	
<% } %>
<tr>
    <td height="12" class="content" >
    	
    </td>
  </tr>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;&nbsp;Alerts</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="100%" width="100%">
		<table width="100%" >
			<thead>
			<tr class="content">
						<td  align="center" width="1%" bgcolor="#FFB502"><input TYPE="checkbox"  id="checkbox"  NAME="checkItem" onClick="checkme(<%=num%>)"></td>
						 <td  align="center" bgcolor="#FFB502"><strong>Alert Name</strong></td>
						<td   align="center" bgcolor="#FFB502"><strong>Alert Type</strong></td>
						<td  align="center" bgcolor="#FFB502"><strong>Status</strong></td>
			</tr>
		</thead>
		<tbody>
		<%int increment=0;%>
			<logic:present name="alerts" scope="request">
				<logic:iterate id="alertsInfo" name="alerts">
					<tr class="content">
						<td  width="1%" align="left"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
					<input type="checkbox"  name="alertlist" onClick="uncheck(this.form)" value="<bean:write name="alertsInfo" property="alertId"/>"
					id="<%=++increment%>" >
					</td>
					
						<td class="content" bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0"><a href="../action/alerts?action=edit&alertId=<bean:write name="alertsInfo" property="alertId"/>"><bean:write name="alertsInfo" property="alertName"/></td>
					
						<td class="content" bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0"><bean:write name="alertsInfo" property="alertType"/></td>
					
						<td class="content" bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0"><bean:write name="alertsInfo" property="alertStatus"/></td>
					</tr>
					
				</logic:iterate>
			</logic:present>
			<tr>
					<td align="left" height="29" colspan="2">
						<input type="button" value="&nbsp;Add&nbsp;" name="B3" class="logout_box" href="#" onClick="javascript:MM_openBrWindow('../action/alerts?action=add','mainframe',230,400)">&nbsp;
						<input type="button" onClick="deleteAlerts(<%=num%>)" value="Delete" name="B3" class="logout_box" >
					</td>
				</tr>
		</tbody>
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
</form>
</body>
</html:html>