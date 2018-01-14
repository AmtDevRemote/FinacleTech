<html> 
<head>
<title>Group</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../calendar1.js"></script>


<script>
 window.history.forward(1);
 </script>
<script language="JavaScript">
<!--
function disable(disableIt)
{
	document.frm.sel.disabled = disableIt;
}
//-->
</script>

<SCRIPT LANGUAGE="JavaScript">
function setToday() {
var now   = new Date();
var day   = now.getDate();
var month = now.getMonth();
var year  = now.getYear();
if (year < 2000)    // Y2K Fix, Isaac Powell
year = year + 1900; // http://onyx.idbsu.edu/~ipowell

document.frmPeak.month.selectedIndex = month;
document.frmPeak.year.value = year;
document.frmPeak.year1.value = year;

}
</SCRIPT>
    <script type="text/javascript">
    function call()
    {
    document.frmPeak.action="alertadd.jsp";
    }
 </script>
<script language="JAVASCRIPT">
function init()
{
var hide
    hide=document.getElementById("COMBO")
    hide.style.visibility = "hidden"
    hide=document.getElementById("COMBO1")
    hide.style.visibility = "hidden"
    hide=document.getElementById("INPUT")
    hide.style.visibility = "hidden"
    hide=document.getElementById("INPUT1")
    hide.style.visibility = "hidden"
    hide=document.getElementById("INPUT3")
    hide.style.visibility = "hidden"
    hide=document.getElementById("INPUT4")
    hide.style.visibility = "hidden"
    hide=document.getElementById("BUTTON")
    hide.style.visibility = "hidden"
    hide=document.getElementById("BUTTON1")
    hide.style.visibility = "hidden"
}
function frmhide()
{
   var example
   
   if(document.frmPeak.report.value== "Daily")
    {
    example=document.getElementById("COMBO")
    example.style.visibility = "hidden"
    example=document.getElementById("COMBO1")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT3")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT4")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT")
    example.style.visibility = "visible"
    example=document.getElementById("INPUT1")
    example.style.visibility = "visible"
    }
    else if(document.frmPeak.report.value== "Weekly")
    {
    example=document.getElementById("COMBO")
    example.style.visibility = "hidden"
    example=document.getElementById("COMBO1")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT3")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT4")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT")
    example.style.visibility = "visible"
    example=document.getElementById("INPUT1")
    example.style.visibility = "visible"
		    }
    else if(document.frmPeak.report.value== "Monthly")
    {
    example=document.getElementById("COMBO")
    example.style.visibility = "visible"
     example=document.getElementById("COMBO1")
    example.style.visibility = "visible"
    example=document.getElementById("INPUT")
    example.style.visibility = "hidden"
     example=document.getElementById("INPUT1")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT3")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT4")
    example.style.visibility = "hidden"
    }
    else
    {
    example=document.getElementById("COMBO")
    example.style.visibility = "hidden"
    example=document.getElementById("COMBO1")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT1")
    example.style.visibility = "hidden"
    example=document.getElementById("INPUT3")
    example.style.visibility = "visible"
    example=document.getElementById("INPUT4")
    example.style.visibility = "visible"
    } 
    example=document.getElementById("BUTTON")
    example.style.visibility = "visible"
    example=document.getElementById("BUTTON1")
    example.style.visibility = "visible"
    setToday()
}
</script> 
</head>
<body onload="javascript: init(); setToday();">
<form method="post"  action="../action/PeakVolumeTrafficAction" onsubmit="" name="frmPeak">
<table>
<tr>
	<td class="framemenu_date" colspan="4">
	&nbsp;&nbsp;Peak Volume Traffic&nbsp;&nbsp;</td>
</tr>
<tr>
<td class="framemenu">
<table border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td width="45%" align="right" colspan="2" class="content">
	 Peak Type&nbsp;:&nbsp;
	 </td>
	 <td colspan=2 align="left"><select name="report" onChange="frmhide()">
<option value="-1" selected>SELECT </option>
<option value="Daily">Daily</option>
<option value="Weekly">Weekly</option>
<option value="Monthly">Monthly</option>
<option value="Yearly">Yearly</option>
</select>

<!--<html:select name="report" property="" onchange="frmhide()">
<html:option value="-1">select</html:option>
<html:option value="Daily">Daily</html:option>
<html:option value="Weekly">weekly</html:option>
<html:option value="Monthly">Monthly</html:option>
<html:option value="Yearly">Yearly</html:option>
</html:select>
--></td>
</tr>
<tr><td colspan="4">&nbsp;</td></tr>
<tr><td width="45%" align="right" colspan="2" class="content">
<div id="COMBO">
  Select the Month&nbsp;: &nbsp;</div></td> 
  <td colspan=2 align="left"><div id="COMBO1"><SELECT name=month><OPTION value=1>Jan</OPTION><OPTION value=2>Feb</OPTION> <OPTION value=3>Mar</OPTION> <OPTION value=4>Apr</OPTION> <OPTION value=5>May</OPTION> <OPTION value=6>Jun</OPTION> <OPTION value=7>Jul</OPTION> <OPTION value=8>Aug</OPTION> <OPTION value=9>Sep</OPTION> <OPTION value=10>Oct</OPTION> <OPTION value=11>Nov</OPTION> <OPTION value=12>Dec</OPTION></SELECT><SELECT name=year><OPTION value=2005 >2005</OPTION> <OPTION value=2006>2006</OPTION> <OPTION value=2007>2007</OPTION> <OPTION value=2008>2008</OPTION><OPTION value=2009>2009</OPTION><OPTION value=2010>2010</OPTION><OPTION value=2012>2011</OPTION></SELECT></div>
</td>
</tr>
<tr>
  <td width="45%" align="right" colspan="2" class="content">
  <div id="INPUT3">
        Enter the Year&nbsp;:&nbsp;</div>
  </td>
  <td colspan="2">
  <div id="INPUT4">
  <SELECT name=year1><OPTION value=2005 selected>2005</OPTION> <OPTION value=2006>2006</OPTION> <OPTION value=2007>2007</OPTION> <OPTION value=2008>2008</OPTION><OPTION value=2009>2009</OPTION><OPTION value=2010>2010</OPTION><OPTION value=2011>2011</OPTION></SELECT></div>
  </td>
</tr>

<tr>
<td width="45%" align="right" colspan=2 class="content"><div id="INPUT">
Enter the Date&nbsp;:&nbsp;</div>
</td>
<td colspan=2><div id="INPUT1" ><input type="text" name="Date">&nbsp;<a href="javascript:cal3.popup();"><img src="../cal.gif"></a></div>
</td>
</tr>
<tr>
<td colspan=2>&nbsp;</td><td colspan=2>&nbsp;</td>
</tr>

<tr>
 <td width="45%" align="right" colspan="2"><div id="BUTTON" >
     <input type="submit" name="SUBMIT" value="SUBMIT"> </div>
 </td>
 <td colspan="2" align="left"><div id="BUTTON1">
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <input type="reset">
 </td>
			</tr>
</table>
</td>
</tr>
</table>
</form>
<script type="text/javascript" language="javascript">
var cal3 = new calendar1(document.frmPeak.elements['Date']);
</script>
</body>
</html>