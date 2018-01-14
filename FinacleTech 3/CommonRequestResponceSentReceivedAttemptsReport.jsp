<%@ page contentType="text/html; charset=utf-8" import="com.techunified.webclient.tdo.TdoUser"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<script>
        var skn;
        function init()
        {
        skn=PrintButton.style;
        showPrint();
        }

        function printPage()
        {
        window.print();
        }
        function printpreview()
        {
        window.preview();
        }

        function hidePrint()
        {
        skn.visibility="hidden";
        }

        function showPrint()
        {
        skn.visibility="visible";
        }

        function saveAsMe (filename)
        {
        document.execCommand('SaveAs',null,filename)
        }
    </script>
<title>SMPP</title>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

<SCRIPT LANGUAGE="JavaScript" type="text/JavaScript">

function MM_openBrWindow(theURL,target) { 
  window.open(theURL,target);
}
</SCRIPT >
</head>
<body>
<html:form method="post"  action="/ReportMenuJspAction" onsubmit="">
<table width="100%" height="100%">
<tr>
<td width="100%" height="12" class="content">

	<%
	String strRType="";
	System.out.println(request.getAttribute("CommonRequestResponceSentReceivedAttemptsReportList"));
	String strRequestType=(String)request.getAttribute("report");
	strRType=(String)request.getAttribute("RType");
	if(session.getAttribute("usercreated")!=null){%>
		<font color="red"><b><%=session.getAttribute("usercreated")	%></b></font>
	<%
	session.removeAttribute("usercreated");
	}
	int num=0;
	if(session.getAttribute("userdeletesuccess")!=null){%>
		<font color="red"><b><%=session.getAttribute("userdeletesuccess")	%></b></font>
	<%
	session.removeAttribute("userdeletesuccess");
	}
	if(session.getAttribute("userdeleteerror")!=null){%>
		<font color="red"><b><%=session.getAttribute("userdeleteerror")	%></b></font>
	<%
	session.removeAttribute("userdeleteerror");
	}%>
		<%if(session.getAttribute("SuccessMsg")!=null){ %>
		<font color="red"><b><%=session.getAttribute("SuccessMsg")	%></b></font>
	<%session.removeAttribute("SuccessMsg");}%>
	<logic:present name="CommonRequestResponceSentReceivedAttemptsReportList" scope="request">
		<logic:iterate id="userDetails" name="CommonRequestResponceSentReceivedAttemptsReportList">
			<%
				num=num+1 ;
			%>
		</logic:iterate>
	</logic:present>
</td>
</tr>
<tr>
<td valign="top" align="left">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
		<td width="6"><img src="../images/menu-bg-top-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-color:#005973;"></td>
		<td width="6"><img src="../images/menu-bg-top-right.gif" alt="" width="6" height="6" border="0"></td>
		<td rowspan="4"><img src="../images/spacer.gif" alt="" width="7" border="0"></td>
	</tr>
	<tr>
		<td class="framemenu_date" colspan="3" align="Left">&nbsp;<%=strRequestType%>&nbsp; REPORT</td>
	</tr>
	<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top">
			<table border="0" cellspacing="1" width="100%">
				<tr class="content">
				  
				  <td width="16%" align="center" bgcolor="#FFB502">Date</td>
				  <td width="16%" align="center" bgcolor="#FFB502">HOUR</td>
				 <% if(strRType.equalsIgnoreCase("srattempt"))
					{%>
   					 <td width="16%" align="center" bgcolor="#FFB502"><b>No. Of Attempts(Sent) </b></td>
   					 <td width="16%" align="center" bgcolor="#FFB502"><b>No. Of Attempts (Received)</b></td>
   					 <%}if(strRType.equalsIgnoreCase("srfratio"))
					{%>
					<td width="16%" align="center" bgcolor="#FFB502"><b>Sent Failure Ratio (%)</b></td>
    				<td width="16%" align="center" bgcolor="#FFB502"><b>Received Failure Ratio (%) </b></td>
    				<%}  %> 
    								  
				</tr>
				
				<logic:present name="CommonRequestResponceSentReceivedAttemptsReportList" scope="request">
				<logic:iterate id="userDetails" name="CommonRequestResponceSentReceivedAttemptsReportList">
				 <tr class="content">
				   
				   
				   <td width="15%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="userDetails" property="date"/></td>
				   <td width="15%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="userDetails" property="hour"/></td>
				   <td width="15%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="userDetails" property="receiveattemp"/></td>
				   <td width="15%"  bgcolor="white" style="border-style: solid; border-width: 1; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#C0C0C0">
				   &nbsp;<bean:write name="userDetails" property="sentattemp"/></td>
				   
				 	</tr>
				</logic:iterate>
				</logic:present>
				<logic:notPresent name="userList" scope="request">
				 
				</logic:notPresent>
				<tr>
					<td width="693" align="center" height="29">
						<input type="button" name="print" value="  Print  " onClick="printPage()">&nbsp;
            <input type=button value="Save As" onclick="saveAsMe('Request related Report.xls');">
					</td>
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
</table>
</td>
</tr>
</table>
</html:form>
</body>
</html:html>
