<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Map,java.util.Iterator, java.util.List" %>
<%@ page import="com.techunified.webclient.acl.*" %>
<%@ page import="com.techunified.webclient.acl.UserAcl"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	margin: 0px 0px 7px 0px;
	padding: 0px;
}
</style>
<SCRIPT language="javascript" type="text/javascript">
function showSubMenu(CurrentScope)
{
	var oDiv;
	var oImg;
	var TempScope;

	var arrayOfDivs = document.getElementsByTagName('div');
	var howMany = arrayOfDivs.length;
	for (var i = 0; i < howMany; i++)
	{
		var oDiv = arrayOfDivs[i];
		if (oDiv.id.indexOf("menuDiv_") != -1 )
		{
			TempScope = oDiv.id.substring(8);
			if (TempScope == CurrentScope)
			{
				oDiv = document.getElementById("menuDiv_" + CurrentScope).style;
				oImg = document.getElementById("menuImg_" + CurrentScope);
				if (oDiv.display ==  'none')
				{
					oDiv.display = 'block';
					oImg.src='images/menu-bullet-negative.gif' 
				}
				else
				{
					if (oDiv.display ==  'block')
					{
						oDiv.display = 'none';
						oImg.src='images/menu-bullet-positive.gif' 
					}
				}
			}
			else
			{
				oDiv.style.display = "none";
				oImg = document.getElementById("menuImg_" + TempScope);
				oImg.src="images/menu-bullet-positive.gif";
			}
		}
	}
}
</SCRIPT>
</head>
<%
	UserAcl user = (UserAcl)session.getAttribute("user");
	
%>
<%
	Map serviceMap = (Map)request.getAttribute("serverStatus");
	UserAcl acl = (UserAcl)session.getAttribute("user");
	Map menuMap = MenuAcl.createUserMenu(acl);
%>
<SCRIPT LANGUAGE="JavaScript" type="text/JavaScript">

function MM_openBrWindow3(theURL,target) { 
  window.open(theURL,target);
}

</SCRIPT >
<body>
<table border="0" cellpadding="0" cellspacing="0">
 <%if(user.getUser().getRoleId().equalsIgnoreCase("LEA")){ %>
    <tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3" align="center">Lea Options</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			
				<tr>
					
					<td class="framemenu_item"><a href="#" onClick="MM_openBrWindow3('../action/TrapUserAction','mainframe')"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">Trap User</a></td>		
				</tr>
				<tr>
				<td class="framemenu_item"><a href="#" onClick="MM_openBrWindow3('../action/SearchTrappedUserAction','mainframe')"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">Search Trapped Users</a></td>		
				</tr>
				<tr>
					
					<td class="framemenu_item"><a href="#" onClick="MM_openBrWindow3('../action/AlreadyTrappedUserListAction','mainframe')"><img id="menuImg_stop_check" src="../images/menu-bullet-empty.gif"  width="9" height="9" border="0">Trapped Users List</a></td>		
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
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
<%
}
%>



<%
if (menuMap.keySet().contains("Servers"))
{
%>
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3" align="center">Servers</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<%
				String status = null;
				String startStop = "N/A";
				String image = "cancel.gif";
				String url="#";
				List menuItems = (List)menuMap.get("Servers");
				for(int i=0; i<menuItems.size();i++)
				{
					MenuItem item = (MenuItem)menuItems.get(i);
					status = (String)serviceMap.get(String.valueOf(item.getBusinessObject()));
					startStop = "N/A";
					image = "cancel.gif";
					url = "#";
					if (status != null) 
					{
						startStop = "0".equals(status)?"start":"stop";
						image = "0".equals(status)?"cancel.gif":"up.gif";
						url = item.getUrl()+"&command="+startStop;
					}
			%>
				<tr>
					<td width="17"><img id="menuImg_stop_check" src="../images/<%=image%>" alt="Start Server" border="0"></td>
					<td class="framemenu_item"><%=item.getText()%></td>
					<td class="framemenu_item" valign="middle">[<a href="<%=url%>"><%=startStop%></a>]</td>		
				</tr>
			<%
				}
			%>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	<tr>
		<td align="center">&nbsp;</td>
	</tr>
	
<%
}
%>
</table>
</body>
</html>