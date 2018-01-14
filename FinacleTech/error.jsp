<html>
<head>
<title>Bank Albilad</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" height="100%">
<td width="100%" height="100%" valign="top">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;Error</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
			    <td height="12" class="content" >An error encountered while retrieving the information:</td>
			</tr>
			<tr>
			    <td height="12" class="content" >&nbsp;</td>
			</tr>
			<tr>
			    <td height="12" class="content" >
			    	<%if(request.getAttribute("error")!=null){%>
			    		<font color="red"><b><%=(String)request.getAttribute("error")%></b></font>
			    	<%}%>
			    </td>
			</tr>
			<tr>
			    <td height="12" class="content" >&nbsp;</td>
			</tr>
			<tr>
			    <td height="12" class="content" >Please try again or report it to <a href="mailto:ccadmin@techunified.com">webmaster</a>
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

</table>
</body>
</html>
