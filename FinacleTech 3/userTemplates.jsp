<%@ page import="com.techunified.webclient.data.DoTemplate,java.util.List" contentType="text/html;charset=utf-8" %>
<%! int length=0; %>
<% int index=1; %>
<% List dot=(List)request.getAttribute("templates"); %> 
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<logic:present name="templates" scope="request">
	<logic:iterate id="DoTemplate" name="templates">
		 <% length ++; %>
	</logic:iterate>
</logic:present>

<html:html><head><title>Message Templates</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
var choice;
function viewPreview(size){

		for (var i=1;i<=size;i++)
		{
			
			document.getElementById(i).style.visibility="hidden";
		}
		choice=document.getElementById(document.forms[0].usertemplates.value).value;
		if(document.forms[0].usertemplates.selectedIndex==0)
		{ 
			return false;
		}
		document.getElementById(document.forms[0].usertemplates.selectedIndex).style.visibility="visible";
	   
}
function passValue(form)
{

	var items=0;
	var index=0;
	var a=0;
	for(a=0;a<10;a++)
	{
		index=choice.indexOf("<",index);
		if(index==-1)
			break;
		items++;
		index++;
	}
	
	var start=0;
	var next=0;
	for(b=0;b<items;b++)
	{
		var i=choice.indexOf("<in",start);
		var j=	choice.indexOf(">",next);
		var mchoice=choice.substring(i+22,j);
		var achoice="form."+mchoice+".value";
		var vchoice=eval(achoice);
		var temp=choice.substring(i,j+1);
		choice=choice.replace(temp,vchoice)
	}
		opener.document.distributionListForm.groupMessage.value=choice;
		self.close();
}
function closeWindow(childwindow)
{
     window.close(childwindow);
}


</script>
</head>
<body>
<div>
<form name="distributionListForm" method="post" action="/ccadmin/action/distributionList">
<table  height="74%" width="99%">
<tbody>
<tr>
	<td height="381"  valign="top">
		<table  border="0" cellpadding="0" cellspacing="0" height="78%" width="97%">
			<tbody>
				<tr>
						<td rowspan="4"><img src="../images/spacer.gif" alt="" border="0" width="7"></td>
						<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" border="0" height="6" width="6"></td>
						<td style="background-color: rgb(0, 51, 153);"></td>
						<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" border="0" height="6" width="6"></td>

				</tr>	
				<tr>
						<td height="20" colspan="3" class="framemenu_date" valign="baseline">&nbsp;Message Templates</td>
				</tr>
				<tr>
						<td style="background-image: url(../images/menu-bg-left.gif); background-repeat: repeat-y;"></td>
						<td bgcolor="#e2e2e2" valign="top" width="100%" height="100%">
							<table  width="103%" height="85%" cellpadding="0" cellspacing="0" id="outer_table">
								<tbody>
								<tr>
								
						 		  <td width="208" valign="center" class="logout_box"><p></p><p align="center">Choose Template</p></td>
										<td valign="center""><p></p><select name="usertemplates" property="role" value="" onChange="viewPreview(<%=length%>)">
																				
												<logic:present name="templates" scope="request">
														<option >--Select--</option>
													<logic:iterate id="DoTemplate" name="templates">
														
														 <option value="<bean:write name="DoTemplate" property="templateName"/>"><bean:write name="DoTemplate" property="templateName"/>										</option>
													</logic:iterate>
											    </logic:present>
								  </select></td>
								</tr>
								<tr height="85%">
										<td class="logout_box"  valign="top"><p align="center">Preview:</p>
										  <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
								  		<td width="781" height="229" valign="top">
										  <logic:present name="templates" scope="request">
											  <logic:iterate id="DoTemplate" name="templates">
											 		  
												  	<div id="<%=index%>" style="position:absolute; visibility:hidden; width: 343px; left: 146px; top: 150px;">
														<table border="0" bgcolor="#e2e2e2">
					  										<tbody>
																<tr>
																	
					  											</tr>
															</tbody>
														</table>		
				 									</div>
								  
							  				</logic:iterate>
							   			  </logic:present>
	   	<!--		<% index=0; %> -->
								   			<% length=0; %>
					  			  </td>
								  </tr>
									<tr>
											  <td height="100" colspan="2"  align="center" valign="center">
						    					<p>&nbsp;										        </p>
						    					<p>&nbsp;</p>
						    					<p>
						    					  <input name="Submit" type="button" class="logout_box"  onClick="closeWindow(this)" value="Close">
						    					  <input name="Submit" type="button" class="logout_box"  onClick="passValue(this.form)" value="Ok">
		    					                </p></td>
									</tr>			      
					    					
							  </tbody>
						  </table>
				  </td>                   
							<td style="background-image: url(../images/menu-bg-right.gif); background-repeat: repeat-y;"></td>
					</tr>
					<tr>
							<td height="6" width="5"><img src="../images/menu-bg-bottom-left.gif" alt="" border="0" height="6" width="6"></td>
							<td style="background-image: url(../images/menu-bg-bottom.gif); background-repeat: repeat-x;"></td>
							<td height="6" width="5"><img src="../images/menu-bg-bottom-right.gif" alt="" border="0" height="6" width="6"></td>
					</tr>
					<tr>
						  <logic:present name="templates" scope="request">
											  <logic:iterate id="DoTemplate" name="templates">
											 		  
												  	
														<table>
					  										<tbody>
																<tr>
																	
					  											</tr>
															</tbody>
														</table>		
				 								
								  
							  				</logic:iterate>
							   			  </logic:present>
					</tr>
			</tbody>
			</table>
		</td>
		</tr>
</tbody>
</table>
</form>
</body>
</html:html>