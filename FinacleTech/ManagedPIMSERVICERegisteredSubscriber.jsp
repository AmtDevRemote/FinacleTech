<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>
<html:html locale="true">
<head>
<title>Group</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<script type="text/javascript" language="JavaScript">
function checkField()
{
	if(window.document.forms[0].fromName.value=="")
	{
		alert("From Name is mandatory");
		window.document.forms[0].fromName.focus();
		return false;
	}
	if(window.document.forms[0].subject.value=="")
	{
		alert("Subject is mandatory");
		window.document.forms[0].subject.focus();
		return false;
	}
	if(window.document.forms[0].message.value=="")
	{
		alert("Message is mandatory");
		window.document.forms[0].message.focus();
		return false;
	}
	if(window.document.forms[0].groupFile.value=="")
	{
		alert("File is mandatory");
		window.document.forms[0].groupFile.focus();
		return false;
	}
	return true;
}
function setToday() {
var now   = new Date();
var day   = now.getDate();
var month = now.getMonth();
var year  = now.getYear();
if (year < 2000)    // Y2K Fix, Isaac Powell
year = year + 1900; // http://onyx.idbsu.edu/~ipowell

document.frmPeak.month.selectedIndex = month;
document.frmPeak.year.value = year;
document.frmPeak.month1.selectedIndex = month;
document.frmPeak.year1.value = year;

}
</script>
</head>
<body background="img/background.jpg" onLoad="setToday()">
<%
if (request.getAttribute("closeWindow")!=null) {
%>
		<script language="javascript">
			opener.frames[0].location.href="../action/distributionList";
			window.close();
		</script>
<%
}
%>
<html:form method="post"  action="/ManagedPIMSERVICERegisteredSubscribersAction" onsubmit="">
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
		<td style="background-color:#003399;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3">&nbsp;&nbsp;Managed PIM SERVICE Registered Subscribers&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23">Select Start Month<font color="#FF0000">*</font>
				<td class="content" height="23"><FONT face=arial size=2>
				<SELECT name=month>
				<%
				String strMonth[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
				java.util.Calendar cal=new java.util.GregorianCalendar();
				int year=cal.get(cal.YEAR);
				int month=cal.get(cal.MONTH)+1;
				//System.out.println(month);
				int day=cal.get(cal.DATE);
				for(int i=0; i<12; i++)
				{
				%>
				<option value=<%=i+1%><%=(i+1==month)?" selected":"" %>><%=strMonth[i]%></option>
				<%
				}
				%>
				</SELECT>
				<SELECT name=year>
				<%
				for(int i=2007; i<=year; i++)
				{
				%>
				<option <%=i%> <%=(i==year)?" selected":""%>><%=i%></option>
				<%
				}
				%>
				</SELECT></FONT></td>
				<td  height="23">&nbsp;</td>
			</tr>
			<tr>
				<td width="150" class="content" height="23">Select End Month<font color="#FF0000">*</font>
				<td class="content" height="23"><FONT face=arial size=2>
				<SELECT name=month1>
				<%
				String strMonth1[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
				java.util.Calendar cal1=new java.util.GregorianCalendar();
				int year1=cal1.get(cal1.YEAR);
				int month1=cal1.get(cal1.MONTH)+1;
				//System.out.println(month);
				int day1=cal1.get(cal1.DATE);
				for(int i=0; i<12; i++)
				{
				%>
				<option value=<%=i+1%><%=(i+1==month1)?" selected":"" %>><%=strMonth1[i]%></option>
				<%
				}
				%>
				</SELECT>
				<SELECT name=year1>
				<%
				for(int i=2007; i<=year1; i++)
				{
				%>
				<option <%=i%> <%=(i==year1)?" selected":""%>><%=i%></option>
				<%
				}
				%>
				</SELECT></FONT></td>
				<td  height="23">&nbsp;</td>
			</tr>
			
			
		    <tr>
				<td class="framemenu_item" width="150">&nbsp;</td>
				<td class="framemenu_item" align="right"><input type="submit" name="SUBMIT" value="SUBMIT">&nbsp;<input type="reset" value="Reset" name="B2"></td>		
				<td align="left"></td>
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

