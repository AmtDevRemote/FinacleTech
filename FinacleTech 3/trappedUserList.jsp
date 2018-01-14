<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.tdo.TdoUser"%>
<%@ page import="com.techunified.webclient.acl.UserAcl"%>

<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>SMPP</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<%
	UserAcl user = (UserAcl)session.getAttribute("user");
	
%>
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
<html:form method="post"  action="/UserDeleteAction" onsubmit="">
<table width="100%" height="100%">
<tr>
<td width="100%" height="12" class="content">
	<%
	System.out.println("request.getAttribute(((((((((((((releaseUserList)))))))))))"+request.getAttribute("releaseUserList"));
	if(session.getAttribute("usercreated")!=null){%>
		<font color="red"><b><%=session.getAttribute("usercreated")	%></b></font>
	<%
	session.removeAttribute("usercreated");
	}
	int num=0;
	if(session.getAttribute("userdeletesuccess")!=null){%>
		<font color="red"><b><%=session.getAttribute("userdeletesuccess")	%></b></font>
	<%
	session.removeAttribute("userdeletesuccess");
	}
	if(session.getAttribute("userdeleteerror")!=null){%>
		<font color="red"><b><%=session.getAttribute("userdeleteerror")	%></b></font>
	<%
	session.removeAttribute("userdeleteerror");
	}%>
		<%if(session.getAttribute("SuccessMsg")!=null){ %>
		<font color="red"><b><%=session.getAttribute("SuccessMsg")	%></b></font>
	<%session.removeAttribute("SuccessMsg");}%>
	<logic:present name="releaseUserList" scope="request">
		<logic:iterate id="trappedUserList" name="releaseUserList">
			<%
			System.out.println(""+num);
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
		<td class="framemenu_date" colspan="3" align="Left">&nbsp;Trapped User Of<%=user.getUser().getFName().toUpperCase() %></td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellspacing="1" width="100%">
				<tr class="content">
				
					<td width="12%" align="center" bgcolor="#FFB502">Sender</td>
				  <td width="12%" align="center" bgcolor="#FFB502">Recepient</td>
				  <td width="12%" align="center" bgcolor="#FFB502">MSISDN</td>
				  <td width="14%" align="center" bgcolor="#FFB502">Transaction Data</td>
				  <td width="12%" align="center" bgcolor="#FFB502">Transaction Time</td>
				  <td width="12%" align="center" bgcolor="#FFB502">IP Address</td>
				  <td width="12%" align="center" bgcolor="#FFB502">Request Type</td>
				  <td width="12%" align="center" bgcolor="#FFB502">Delivered</td>
				</tr>
				<%int increment=0;%>
				<logic:present name="trappedUserList" scope="request">
				<logic:iterate id="trappedUserList" name="trappedUserList">
				 <tr class="content">
				   <!--<td width="10%" align="center"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
					<input type="checkbox"  name="releaseUserList" value="<bean:write name="trappedUserList" property="targetUserId"/>"
					id="<%=++increment%>" onClick="uncheck(this.form)">
					</td>
				   
				   --><td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="sender"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="recepient"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="msisdn"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="transactionData"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="transactionTime"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="ipAddress"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="requestType"/></td>
				   <td width="12%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="trappedUserList" property="delivered"/></td>
				 	</tr>
				</logic:iterate>
				</logic:present>
				<logic:notPresent name="trappedUserList" scope="request">
				 <tr class="content">
					<td colspan="4" align="left">No Data Found</td>
				 </tr>
				</logic:notPresent>
				<tr>
					<td width="693" align="center" height="29">
						<input type="button" value="&nbsp;Trap User&nbsp;" name="B3" class="logout_box" href="#" onClick="MM_openBrWindow('../action/TrapUserAction?option=add','mainframe')">&nbsp;
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