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
<%
	
%>
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
</script>
</head>
<body>
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
<html:form method="post"  action="/RequestsbyhourAction" onsubmit="">
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
		<td class="framemenu_date" colspan="3">&nbsp;&nbsp;Requests by hour Report&nbsp;&nbsp;</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23">Select Date<font color="#FF0000">*</font>
				<td class="content" height="23"><FONT face=arial size=2>
				<SELECT name=day width="10">
				<%
				String strMonth[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
				java.util.Calendar cal=new java.util.GregorianCalendar();
				int year=cal.get(cal.YEAR);
				int month=cal.get(cal.MONTH)+1;
				//System.out.println(month);
				int day=cal.get(cal.DATE);
				for(int i=1;i<32;i++)
				{
				%>
				<option value=<%=i%> <%=(i==day?" selected":"") %>><%=i %></option>
				<%
				}
				%>
				</SELECT> 
				<SELECT name=month>
				<%
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
				<td width="150" class="content" height="23" align="left">Select Start Time (in Hour)<font color="#FF0000">*</font></td>
				<td class="content" height="23"><select name="Hour1" >
<option value="-1">To Hour
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
</select></td>
				<td  class="content" height="23">&nbsp;</td>
			</tr>
			
			<tr>
				<td width="150" class="content" height="23" align="left">Select End Time (in Hour)</td>
				<td class="content" height="23"><select name="Hour2" >
<option value="-1">From Hour
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
</select></td>
				<td  class="content" height="23">&nbsp;</td>
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
