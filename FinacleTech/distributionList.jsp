<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Messages</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
	function submitCustomer()
	{
		var total = 0;
		var max = 1;
		var form = document.forms[0];
		var doc = document;
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
			form.action="../action/distributionList?action=updateCustomers";
			form.submit();
		}
	}
	function submitDelete(form,doc)
	{
		var total = 0;
		var max = 1;
	//	var form = document.frames[0].document.forms[0];
	//	var doc = document.frames[0].document;
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
			if (confirm('Are you sure to delete'))
				form.submit();
		}
	}
	
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
	alert(noofuser);
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
</script>
</head>
<body>
<form  method="post" action="../action/distributionList?action=deleteGroup">
<table width="100%" height="100%"  >

<tr>
<%
						int num=0;
					%>
					<logic:present name="groups">
						<logic:iterate id="groupDetails" name="groups">
						<%
							num=num+1 ;
						%>
						</logic:iterate>
					</logic:present>
								<input name="mode" value="groups" type="hidden">				
								<input name="serverFile" value="" type="hidden">		
								<input name="groupMessage" value="" type="hidden">
								<input name="language" value="" type="hidden">
								<input name="messageType" value="" type="hidden">
<td height="100%" valign="top" colspan="7">
<table border="0"  cellpadding="0" cellspacing="0" width="100%" height="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6" height="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="3"><img src="../images/spacer.gif" alt="" width="2" border="0"></td>
	</tr>
	<tr>
		<td height="19" colspan="3" class="framemenu_date">&nbsp;Customer Groups</td>
	</tr>
	<tr>
		<td height="71" style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td bgcolor="#E2E2E2" valign="top" width="100%">
			<table bgcolor="#e2e2e2" align="center" cellspacing="1" cellpading="2" height="50" width="99%">
															<tbody>
																<tr class="content">
																	  <td align="left" bgcolor="#ffb502"><input id="checkbox" name="checkItem" onClick="checkme(<%=num%>)" type="checkbox"></td>								  <td width="133" align="center" bgcolor="#ffb502" class="logout_box">Customers</td>
																	  <td width="99" align="center" bgcolor="#ffb502" class="logout_box">Group Name</td>
																	  <td width="81" align="center" bgcolor="#ffb502" class="logout_box">Language</td>
																	  <td width="156" align="center" bgcolor="#ffb502" class="logout_box">Group Description</td>
													  					<td width="30" align="center" bgcolor="#ffb502" class="logout_box">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role</td>
																	  <td width="138" align="center" bgcolor="#ffb502"  class="logout_box">Priority</td>
																	  <td width="173" align="center" bgcolor="#ffb502">&nbsp;</td>
																	  <!--<td rowspan="4"><img src="service_data/spacer.gif" alt="" border="0" width="3"></td> -->
																</tr>
														<%int increment=0;%>
														<logic:present name="groups" scope="request">
															<logic:iterate id="groupDetails" name="groups">
																 <tr class="content" >		   
																	   <td align="left"  bgcolor="white">
			 													   		<div align="left">
																  		<input type="checkbox"  name="groupId" value="<bean:write name="groupDetails" property="groupId"/>" id="<%=++increment%>" onClick="uncheck(this.form)">	 			</div>
														   				</td>
																		<input type="hidden"  name="groupName" value="<bean:write name="groupDetails" property="groupName"/>"/>
																		<td bgcolor="white" align="center">
																		<div align="center"><a href="javascript:MM_openBrWindow('../action/customerList?group=<bean:write name="groupDetails" property="groupId"/>','new', 600, 800)"><img src="../images/group.gif" border="0"></a>
																		</div>
																		</td>
			    														<td bgcolor="white">&nbsp;
																      	<div align="center"><a href="javascript:MM_openBrWindow('../action/distributionList?action=editGroup&id=<bean:write name="groupDetails" property="groupId"/>','new', 225, 400)">
			          <bean:write name="groupDetails" property="groupName"/>
			        </a>												</div>
																		</td>
			    														<td width="81" bgcolor="white">
																		<div align="center">
																      		<bean:write name="groupDetails" property="groupLanguage"/>
			      														</div>
																		</td>
															   			<td bgcolor="white">&nbsp;
			     														<div align="center">
																	       <bean:write name="groupDetails" property="groupDescription"/>
			       														</div>
														   				</td>
															    		<td bgcolor="white">&nbsp;
																	    <div align="center">
																	        <bean:write name="groupDetails" property="groupRoleId"/>
        														 		</div>
																		</td>
														  				<td bgcolor="white">&nbsp;
																  		<div align="center">
																  		    <bean:write name="groupDetails" property="groupPriority"/>
													  		      		</div>
																		</td>		  
														        		<td bgcolor="white">
																		<div align="center">
																			<a href="../action/customerDisplay?group=<bean:write name="groupDetails" property="groupId"/>">Choose Customers </a>													</div>
																		</td>
		 														</tr>
														</logic:iterate>
													</logic:present>
																<tr>
																		<td align="left" colspan="8">
																			<input type="button" value="&nbsp;Add&nbsp;" name="B3" class="logout_box" href="#" onClick="MM_openBrWindow('../action/distributionList?action=addGroup','newList', 265, 400)">&nbsp;
																			<input type="button" value="Delete" name="B3" class="logout_box" onClick="submitDelete(this.form,this.document)">&nbsp;								<input type="button" value="Update Customers" name="B3" class="logout_box" onClick="submitCustomer()">
																		</td>
																</tr>
																<tr>
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
	<tr>
			
	</tr>
	


</table>


</body>
</html:html>