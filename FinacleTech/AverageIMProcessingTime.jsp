<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/ccadmin.tld" prefix="ccadmin"%>

<html:html locale="true">
<head>
<title>Report</title>
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
<html:form method="post"  action="/AverageIMProcessingTimeAction" onsubmit="">
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
		<td class="framemenu_date" colspan="3">Average IM Processing Time</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellpadding="0" cellspacing="0" id="outer_table">
			<tr>
				<td width="150" class="content" height="23">Select Date<font color="#FF0000">*</font>
				<td class="content" height="23"><SELECT name=day width="10"><OPTION value=1>1</OPTION><OPTION value=2>2</OPTION> <OPTION value=3>3</OPTION> <OPTION value=4>4</OPTION> <OPTION value=5>5</OPTION> <OPTION value=6>6</OPTION> <OPTION value=7>7</OPTION> <OPTION value=8>8</OPTION> <OPTION value=9>9</OPTION> <OPTION value=10>10</OPTION> <OPTION value=11>11</OPTION> <OPTION value=12>12</OPTION> <OPTION value=13>13</OPTION> <OPTION value=14>14</OPTION> <OPTION value=15>15</OPTION> <OPTION value=16>16</OPTION> <OPTION value=17>17</OPTION> <OPTION value=18>18</OPTION> <OPTION value=19>19</OPTION> <OPTION value=20>20</OPTION> <OPTION value=21>21</OPTION> <OPTION value=22>22</OPTION> <OPTION value=23>23</OPTION> <OPTION value=24>24</OPTION> <OPTION value=25>25</OPTION> <OPTION value=26>26</OPTION> <OPTION value=27>27</OPTION> <OPTION value=28>28</OPTION> <OPTION value=29>29</OPTION> <OPTION value=30>30</OPTION> <OPTION value=31>31</OPTION></SELECT>
<FONT face=arial size=2> <SELECT name=month><OPTION value=1>Jan </OPTION><OPTION value=2>Feb</OPTION> <OPTION value=3>Mar</OPTION> <OPTION value=4>Apr</OPTION> <OPTION value=5>May</OPTION> <OPTION value=6>Jun</OPTION> <OPTION value=7>Jul</OPTION> <OPTION value=8>Aug</OPTION> <OPTION value=9>Sep</OPTION> <OPTION value=10>Oct</OPTION> <OPTION value=11>Nov</OPTION> <OPTION value=12>Dec</OPTION></SELECT>
<SELECT name=year><OPTION value=2005 selected>2005</OPTION> <OPTION value=2006>2006</OPTION> <OPTION value=2007>2007</OPTION> <OPTION value=2008>2008</OPTION></SELECT></FONT></td>
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
