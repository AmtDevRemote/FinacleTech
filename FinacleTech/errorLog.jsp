<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.techunified.webclient.data.DoErrorLog"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>Error Log</title>

<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript">

function MM_openBrWindow(theURL,target, height, width) {
  if (height==null && width==null) 
  	 window.open(theURL,target);
  else
  	window.open(theURL,target,"height="+height+","+"width="+width);
}
</script>
</head>
<body>
<table width="100%" height="100%">
<%
java.util.List  errorLogList = (java.util.List)request.getAttribute("errorList");
System.out.println(errorLogList.size());
if(request.getAttribute("error")!=null){%>
<tr>
    <td class="content" ><font color="red"><b><%=(String)request.getAttribute("error")%></b></font></td>
</tr>
<%}%>
<tr>
<td valign="top">
<table border="0" cellpadding="0" cellspacing="2">
<%
	DoErrorLog errorLog = null;
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	for (int i=0; i<errorLogList.size(); i++)
	{
		errorLog = (DoErrorLog)errorLogList.get(i);
		String color=null, content=null;
		if ((i%2)==1) color="#c8c8c8";
		else	color="#ffffff";
		if ("WARN".equalsIgnoreCase(errorLog.getType().trim()))
			content="content_red";
		else
			content="content";
	%>
	<tr bgcolor="<%=color%>">
		<td class="<%=content%>"><%=formatter.format(errorLog.getErrorDate())%></td>
		<td class="<%=content%>"><%=errorLog.getType()%></td>
		<td class="<%=content%>"><%=errorLog.getThread()%></td>
		<td class="<%=content%>"><%=errorLog.getDetailedText()%></td>
	</tr>
	<%
	}
	%>
</table>
</td>
</tr>
</table>
</body>
</html:html>