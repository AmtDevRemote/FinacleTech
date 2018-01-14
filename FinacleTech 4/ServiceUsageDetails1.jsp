<%@ page isThreadSafe="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.lang.String"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Usage</title>
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

</script> 
<script language="JavaScript" src="../calendar1.js"></script>
	<script language="JavaScript" src="calendar2.js"></script>
    <script type="text/javascript">
    function call()
    {
    document.form1.action="alertadd.jsp";
    }
    
       
    </script>
</head>
<body >

  
     <table ><tr><td height="10"></td></tr></table>
    
  
<center>
<h1>&nbsp;</h1>
<h2>Service Usage Performance Report</h2>
<form name="form1" action="ServiceUsageReport.jsp" method="post">
<center>

<td width="45%" align="right"><font face="Arial, Helvetica, sans-serif" size="3"><b>
 Peak Type&nbsp;:&nbsp;</b></font></td>
 <td>&nbsp;&nbsp;&nbsp;<select name="report" onChange="frmhide()">
<option value="-1" selected>SELECT </option>
<option value="Daily">Daily</option>
<option value="Duration">Duration</option></select>
		    
<tr><td><b><font size="3" color="#6392BE">Enter Date & Time :</font></b></td>
<td><input type="text" name="Date"></td><td><a href="javascript:cal1.popup();"><img src="cal.gif"></a></td></tr>

<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>

<tr>
 <td width="45%" align="right"><div id="BUTTON" >
     <font face="Arial, Helvetica, sans-serif" size="3"><b>
     <input type="submit" name="SUBMIT" value="SUBMIT"> </b></font></div>
 </td>
 <td><div id="BUTTON1" >
    <input type="button" name="BACK" value="BACK"></div>
    
 </td>
</tr>
</table>
<script type="text/javascript">
var cal1 = new calendar1(document.form1.elements['Date']);
</script>
</center>
</form>
</center>
</body>
<script>
 window.history.forward(1);
 </script>
</html>