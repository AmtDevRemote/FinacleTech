<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Customers</title>
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
<logic:present name="customers">
	<logic:iterate id="customerDetails" name="customers">
		<%
			num=num+1 ;			
		%>
	</logic:iterate>
</logic:present>
<html:form method="post" action="/customerList?action=saveCustomer">
	<table border="0" cellspacing="1" width="100%" bgcolor="#E2E2E2" id="table1">
	<tbody> 
		<%if(request.getAttribute("error")!=null){%>
		<tr>
		    <td class="content" colspan="6"><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
		</tr>
		<%}%>
		<tr class="content">
		  <td width="10" align="left" bgcolor="#FFB502"><input TYPE="checkbox" id="checkbox" NAME="checkItem" onclick="checkme(<%= num %>)"></td>
		  <td width="110" align="left" bgcolor="#FFB502">Mobile&nbsp;Number</td>		  
		  <td width="100" align="left" bgcolor="#FFB502">Message</td>
		  <td width="100" align="left" bgcolor="#FFB502">CPT No</td>
		</tr>
		<input type="hidden"  name="custSelFile" value=""/>
		<%int increment=0;%>
		<logic:present name="customers" scope="request">
		<logic:iterate id="customerDetails" name="customers">
		 <tr class="content">
		   
		   <td width="20" align="center"  bgcolor="white">
			<input type="checkbox"  name="customerId" id="<%=++increment%>" value="<%=increment%>" onClick="uncheck(this.form)">
		   </td>
		   <input type="hidden"  name="mobileNumber" value="<bean:write name="customerDetails" property="mobileNumber"/>"/>
		   <input type="hidden"  name="message" value="<bean:write name="customerDetails" property="message"/>"/>
		   <input type="hidden"  name="cptNo" value="<bean:write name="customerDetails" property="cptNo"/>"/>
		   <bean:define id="department" name="customerDetails" property="message"/>
		   <% 
		   		String dept = department.toString();
		   		String[] tokens = dept.split(";");
		   		String message = tokens[0]; 	
		   %>
		   <td bgcolor="white"><bean:write name="customerDetails" property="mobileNumber"/></td>
		   <td bgcolor="white"><%=message%></td>
		   <td bgcolor="white"><bean:write name="customerDetails" property="cptNo"/></td>	   
		 </tr>
		 
		</logic:iterate>
		</logic:present>
		<logic:notPresent name="customers" scope="request">
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