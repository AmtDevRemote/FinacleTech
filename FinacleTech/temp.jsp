<%@ page import="javax.servlet.http.*"%>


<%
  StringBuffer welcome = new StringBuffer("../action/customerDisplay?action=displayCustomers&group=10");
 String temp=welcome.toString();
  RequestDispatcher rd = request.getRequestDispatcher(temp);
  if(rd != null){
    rd.forward(request, response);
  }
%>
