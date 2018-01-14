
 



<html lang="en">
<head>
<title>Customers</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">
   	function submitDelete()
	{
		var total = 0;
		var max = 1;
		var form = document.frames[0].document.forms[0];
		var doc = document.frames[0].document;
		if (!form.clist)
			return false;
		if (form.clist.length)
			max = form.clist.length;
		if(max==1)
		{
			if(form.clist.checked)
				total=max;
		}
		else
		{
			for(var i=0;i<max;i++)
				{
					if(form.clist[i].checked)
					total++;
				}
		}
        if (total == 0)
		{
			alert('No records selected');
			return false;
		}
		else
		{	
			if (confirm('Are you sure to delete'))
			{
				form.action = "../action/customerList?action=deleteCustomer";
				form.submit();
			}
		}
	}
	
	function submitUpdate()
	{
		var i;
		var total = 0;
		var max = 1;
		var form1 = document.frames[0].document.getElementById("ccc");
		var doc1 = document.frames[0].document;
		if (!form1.clist)
			return false;
		if (form1.clist.length)
			max = form1.clist.length;
		if(max==1)
		{	
			if(form1.clist.checked)
				total=max;	
		}
		else
		{
		for(i=0;i<max;i++)
		{
				if(form1.clist[i].checked)
				{
						total++;
				}
		}
		}
	
		if (total == 0)
		{
			alert('No records selected');
			return false;
		}
		
		form1.action="../action/customerList?action=updateCustomer";
		
		form1.submit();
	}
	
	function submitSearch()
	{
		document.forms[0].action="../action/customerList?action=searchCustomer";
		document.forms[0].target="clistframe";
		document.forms[0].submit();
	}
	

function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}

</script>
</head>
<body>
<form method="post" action="/customerList" >
<table width="100%" height="100%">


<tr>
	<td height="100%" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
			<tr>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
					<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
					<td style="background-color:#003399;"></td>
					<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
			</tr>
			<tr>
					<td class="framemenu_date" colspan="3">&nbsp;Search Customer</td>
			</tr>
			<tr>
					<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
					<td bgcolor="#E2E2E2" valign="top" width="100%">
							<table border="0" cellpadding="0" cellspacing="0" id="outer_table" width="100%">
								<tr>
										<td height="5" colspan="3"></td>
								</tr>
								<tr>
										<input type="hidden" name="group" value="<%=request.getAttribute("group")%>">
										
										<td class="content" width="200">Name :<input type="text" name="searchName"  value="" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" />
									</td>
									<td class="content" width="200">Mobile :<input type="text" name="searchNumber" value="" styleClass="content" style="border: 1px solid #808080; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1;" />
									</td>
									<td  class="content" align="left" valign="bottom"><input type="button" value="Search" name="B2" class="logout_box" onClick="submitSearch()">&nbsp;</td>
									
									
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
			<tr>
					<td colspan="3">&nbsp;</td>
			</tr>
			<tr>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
					<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
					<td style="background-color:#003399;"></td>
					<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
					<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
			</tr>
			<tr>
					<td class="framemenu_date" colspan="3">&nbsp;Customer List</td>

			</tr>
			<tr>
					<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;">&nbsp;</td>
										
					<td bgcolor="#E2E2E2" valign="top" height="100%" width="100%">
							<table cellpadding="0" cellspacing="0" id="outer_table" width="100%"  height="100%">
									<tr>
										<td height="5" colspan="2"></td>
									</tr>
									<tr>
										<td width="100%"  height="100%" align="left">
											<iframe align="center" name="clistframe" src="../action/customerList?action=displayCustomersForView&group=<%=request.getAttribute("group")%>" width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0">
											</iframe>
										</td>
									</tr>
									<tr>
										<td align="left">	<input type="button" value="&nbsp;Add&nbsp;" name="B1" class="logout_box" href="#" onClick="MM_openBrWindow('../action/customerList?action=displayAddCustomer&group=<%=request.getAttribute("group")%>',self.name, 265, 400)">&nbsp;
										<input type="button" value="Update" name="B2" class="logout_box" onClick="submitUpdate()">&nbsp;	
										<input type="button" value="Delete" name="B3" class="logout_box" onClick="submitDelete()">&nbsp;
										</td>
									</tr>
							</table>
					</td>
					<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;">&nbsp;</td>
			</tr>
			<tr>
					<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
					<td style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
					<td width="5" height="5"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
			</tr>
			<tr>
					<td colspan="3">&nbsp;</td>
			</tr>
			</table>
		</td>
</tr>
</table>
</form>
</body>
</html>