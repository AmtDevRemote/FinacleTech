<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.data.*, java.util.List"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Template</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].roleId.value=="")
	{
		alert("Role Id is mandatory");
		window.document.forms[0].roleId.focus();
		return false;
	}
	if(window.document.forms[0].roleName.value=="")
	{
		alert("Role name is mandatory");
		window.document.forms[0].roleName.focus();
		return false;
	}
	return true;
}

</script>
</head>
<body>
<%
if (request.getAttribute("close")!=null) {
%>
		<script language="javascript">
			opener.frames[0].location.href="../action/role";
			window.close();
		</script>
<%
}
%>
<bean:define id="userRole" name="role" scope="request"/>
<html:form method="post" action="/role?action=updateRole" onsubmit="return checkField()">
<table>
<tr>
    <td height="12" class="content" >
    	<%if(request.getAttribute("error")!=null){%>
    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
    	<%}%>
    </td>
</tr>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Add Role</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23" align="left">Role Id<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><bean:write name="userRole" property="roleId"/>
				<input type="hidden" maxlength="50" name="roleId" value="<bean:write name="userRole" property="roleId"/>" ></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23" align="left">Role Name<font color="#FF0000">*</font></td>
				<td class="content" height="23" colspan="2"><input type="text" maxlength="50" name="roleName" value="<bean:write name="userRole" property="roleName"/>" size="26" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" /></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			<%
			List newbos = ((DoRolePermission)userRole).getBusinessObject();
			%>
      		  <logic:present name="businessObjects" scope="request">
			  <logic:iterate id="bos" name="businessObjects">
			  <%
			  		
			  		DoBusinessObject doNewBo = null;
			  		String checked="";
			  		for (int j=0;j<newbos.size(); j++)
			  		{ 
			  			doNewBo = (DoBusinessObject)newbos.get(j);
			  			if (((DoBusinessObject)bos).getObjectId()==doNewBo.getObjectId())
			  			{
			  				checked="checked";
			  			}	
			  		}
			  	%>
			  <tr>
				<td width="150" class="content" height="23">&nbsp;</td>
				<td height="23" width="20">
					<input type="checkbox" name="permissionIds" <%=checked%> value="<bean:write name="bos" property="objectId"/>" class="content" style="border: 1px solid #808080; padding-left: 1; padding-right: 1; padding-top: 1; padding-bottom: 1; "/>
				</td>
				<td height="23" Class="content"><bean:write name="bos" property="objectName"/></td>
				<td  height="23">&nbsp;</td>
			  </tr>
			  </logic:iterate>
			  </logic:present>
			  <tr>
				<td colspan="4">&nbsp;</td>
			  </tr>
			  <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td colspan="2"><input type="submit" value="Save" name="B3">&nbsp;<input type="reset" value="Reset" name="B2"></td>
				<td align="left">&nbsp;</td>
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
</table>
</td>
</tr>
</table>
</html:form>
</body>
</html:html>