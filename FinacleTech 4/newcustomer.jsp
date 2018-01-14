<%@ page contentType="text/html; charset=utf-8"%>
<html lang="en" ><head><title>USER</title>
 <link href=css/frames-styles.css>
<link href="css/frames-styles.css" rel="stylesheet" type="text/css">
<script  language="JavaScript" type="text/JavaScript">
function addRow() 
{ 
var tbody = document.getElementById("table1").getElementsByTagName("tbody")[0]; 
var row = document.createElement("TR"); 

var cell1 = document.createElement("TD"); 
var cell2 = document.createElement("TD");
var inp1 =  document.createElement("INPUT"); 
var inp2 =  document.createElement("INPUT"); 

cell1.setAttribute("align","left");
cell2.setAttribute("align","right");
inp1.setAttribute("type","text"); 
inp1.setAttribute("name","cnumber"); 
inp1.setAttribute("value",""); 
inp2.setAttribute("type","text"); 
inp2.setAttribute("name","cname"); 
inp2.setAttribute("value",""); 


cell1.appendChild(inp1); 

cell2.appendChild(inp2); 
row.appendChild(cell1); 
row.appendChild(cell2);
tbody.appendChild(row); 
} 

</script>
<style type="text/css">
<!--
.style1 {font-family: Verdana, Arial, Helvetica, sans-serif}
-->
</style>
<link href="css/frames-styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<form method="post" action="/distributionList?action=sendMessage">

<table height="100%" width="100%" >

<tbody>
<tr><td><input type="hidden" name="mode" value="newcustomer"/></td>
							<input name="groupMessage" value="" type="hidden">
								<input name="language" value="" type="hidden">
								<input name="messageType" value="" type="hidden">
								<input name="serverFile" value="" type="hidden"></tr>
<tr>
<td height="100%" valign="top">
<table width="1060" height="94%" border="0" cellpadding="0" cellspacing="0">
	<tbody>
	
		<td width="7" style="background-image: url(images/menu-bg-right.gif); background-repeat: repeat-y;"></td>
	
	
	<tr>
		<td rowspan="4"><img src="images/spacer.gif" alt="" border="0" width="7"></td>
		<td width="6" height="6"><img src="images/menu-bg-top-left.gif" alt="" border="0" height="6" width="6"></td>
		<td style="background-color: rgb(0, 51, 153);"></td>
		<td width="6"><img src="images/menu-bg-top-right.gif" alt="" border="0" height="6" width="6"></td>
		<td width="28" rowspan="4"><img src="images/spacer.gif" alt="" border="0" width="7"></td>
	</tr>
	<tr>
		<td height="18" colspan="3" class="framemenu_date">&nbsp;New Customer Details</td>
	</tr>
	<tr>
		<td style="background-image: url(images/menu-bg-left.gif); background-repeat: repeat-y;">&nbsp;</td>
		<td bgcolor="#e2e2e2" height="100%" valign="top" width="950">
			<table id="table1">
				<tbody id="tbody">
				
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="logout_box">Customer Number</span>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<span class="logout_box">&nbsp;Customer Name</span></td>
					</tr>
				
					<tr>
						<td><input  type="text" name="cnumber"></td>
						<td><input name="cname" type="text" ></td>
						<td><input name="Submit" onClick="addRow()" type="button" class="logout_box" value="Add Customer"></td>
					</tr>
				</tbody>
			</table>
		  
		    
		<td style="background-image: url(images/menu-bg-right.gif); background-repeat: repeat-y;">&nbsp;</td>
	</tr>
	<tr>
		<td height="5" width="6"><img src="images/menu-bg-bottom-left.gif" alt="" border="0" height="6" width="6"></td>
		<td style="background-image: url(images/menu-bg-bottom.gif); background-repeat: repeat-x;"></td>
		<td height="5" width="6"><img src="images/menu-bg-bottom-right.gif" alt="" border="0" height="6" width="6"></td>
		
	</tr>
	
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</form>
</body>
</html>


