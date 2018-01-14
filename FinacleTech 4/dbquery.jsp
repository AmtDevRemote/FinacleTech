<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<html:html locale="true">
<head>
<title>dbquery</title>
</head>
<body>

<html:form method="post" action="/query">
    <input type="hidden" name="dbname" value='<%=request.getAttribute("dbname")%>'>
	<html:textarea name="queryForm" property="queryText" rows="5" cols="40"></html:textarea>
	<input type="submit" value="Run Query">
</html:form>
<%
if (request.getAttribute("records")!=null && request.getAttribute("columns")!=null)
{
	String[][] records = (String[][])request.getAttribute("records");
	java.util.List columnList = (java.util.List)request.getAttribute("columns");
%>
<table border="1">
<tr>
<%
	for (int j=0; j<columnList.size();j++)
	{
%>
	<td><%=columnList.get(j)%></td>
<%		
	}
	String[] records2 = null;
	for(int j=0;j<records.length;j++)
	{
		records2 = records[j];
		if (records2!=null)
		{
%>
</tr>
	<tr>
<%
			for(int i=0; i< records2.length; i++)
			{
	%>
			<td><%=records2[i]==null?"":records2[i]%></td>
	<%
			}
		}
	}

%>
	</tr>
</table>
<%
}
%>
</body>
</html:html>
