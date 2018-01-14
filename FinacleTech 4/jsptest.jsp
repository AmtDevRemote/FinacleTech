<html><head><title>Test JSP page</title></head><body bgcolor=white>

<table border="0"><tr><td><h1>Sample Application JSP Page</h1>
This is the output of a JSP page that is part of the Hello, World application.
It displays several useful values from the requestwe are currently processing.</td></tr>
</table>

<table border="0" border="100%"><tr>
<th align="right">Request Method:</th>
<td align="left"><%= request.getMethod() %></td></tr><tr>
<th align="right">Servlet Path:</th>
<td align="left"><%= request.getServletPath() %></td></tr></table></body></html>
