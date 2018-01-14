<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<jsp:include flush="true" page="header.jsp"></jsp:include>

<%
String action="";
String alert="";
String time="";
String service="";
String strEdit="";
String editName="";
String editalert="";
String editdatetime="";
String delaytime="";
String editdelaytime="";
boolean result=false;
boolean edit=false;
action=request.getParameter("submit");
alert=request.getParameter("alert");
service=request.getParameter("services");
time=request.getParameter("datetime");
delaytime=request.getParameter("delaytime");
strEdit=request.getParameter("edit");
Collection objCollection=null;
StringTokenizer objStrToken=null;
int iInserted=0;
System.out.println("ACTION"+action);
if(strEdit==null)
{
strEdit="";
}
if(action==null)
{
action="";
}
if(action.equalsIgnoreCase("Submit"))
{
System.out.println("IN ADDING ALERT"+alert+" "+service+"  "+time+" "+delaytime);
//iInserted=connect.setAlert(alert,service,time,delaytime);

result=true;
}
if(action.equalsIgnoreCase("Update"))
{
editName=request.getParameter("service");
editalert=request.getParameter("editalert");
editdatetime=request.getParameter("editdatetime");
editdelaytime=request.getParameter("editdelaytime");
System.out.println("IN UPDATING ALERT"+editalert+" "+editName+"  "+editdatetime+" "+editdelaytime);
//iInserted=connect.updateAlert(editalert,editName,editdatetime,editdelaytime);
result=true;
}
if(action.equalsIgnoreCase("")){
//objCollection=connect.getAllServices();

System.out.println("IN ADDING ALERT");
}
if(strEdit.equalsIgnoreCase("true"))
{
edit=true;
editName=request.getParameter("service");
}
 %>
<html>
  <head>
   
    <script language="JavaScript" src="../calendar1.js"></script>
	<script language="JavaScript" src="calendar2.js"></script>
    <script type="text/javascript">
    function call()
    {
    document.form1.action="alertadd.jsp";
    }
    function call1()
    {
    document.form1.action="alerts.jsp";
    return true;
    }
    </script>
    <title>My JSP 'alertadd.jsp' starting page</title>
    
  </head>
  
  <body>
  <script>
    
       document.body.style.scrollbarFaceColor="#9DAFDC";
       document.body.style.scrollbarArrowColor="white";
       document.body.style.scrollbarTrackColor="#DEDEDE";
       document.body.style.scrollbar3dLightColor="gray";
       document.body.style.scrollbarShadowColor="gray";
       document.body.style.scrollbarHighlightColor="black";
    </script>
     <table ><tr><td height="10"></td></tr></table>
    <table align="center" width="800" bgcolor=#fffff height="200">
    <tr >
				<td valign="top" width="20%">
					<jsp:include flush="true" page="alertleftnav.jsp" />
				</td>
				<td valign="top" width="80%" >
				<%if(result==true){%>
				
			      
						<%if(iInserted!=0) {%>
						<b><font color="#6392BE">SUCCESSFULLY INSERTED</font></b>
		
		 				<%}else{%>
	 				 <b><font color="#6392BE">INSERTION UNSUCCESSFUL</font></b>
	 				
		 				<%} %>
			     
			      <%}
			      else{
			      if(edit==false){ %>
				<p><b><u><font size="3" color="#6392BE" face="Verdana, Arial, Helvetica, sans-serif">
		  		
			    </font></u></b></p>
			    <form name="form1" method="post"> <table><tr><td><b><font size="3" color="#6392BE">Alert:-</font></b></td>
			    <td><input type="text" name="alert"></td></tr>
			    <tr><td><b><font  size="3" color="#6392BE">Services:-</font></b></td>
			    <td><select name="services">
									<%
               if(objCollection!=null && objCollection.size()>0)
				{
				Iterator objIterator=objCollection.iterator();
				for(int i=1;i<=objCollection.size();i++)
				{
				String str=(String)objIterator.next();
				objStrToken=new StringTokenizer(str,"#");
				
				String strCode=objStrToken.nextToken();
				String strName=objStrToken.nextToken(); %>
				<option name="<%=strName%>"><%=strName%></option>
				
              
               <%}
				}%>
				<option name="all">All Services</option>
					</select></td></tr>
				<tr><td><b><font size="3" color="#6392BE">Deliver Time:-</font></b></td>
				<td><input type="text" name="datetime"></td><td><a href="javascript:cal1.popup();"><img src="cal.gif"></a></td></tr>
				<tr><td><b><font size="3" color="#6392BE">Delay Time:-</font></b></td>
				<td><input type="text" name="delaytime"></td><td><a href="javascript:cal2.popup();"><img src="cal.gif"></a></td></tr>
				<tr><td><input type="submit" name="submit" value="Submit" ></td>
				<td><input type="submit" name="submit" value="Cancel" ></td>
				</tr>
				
			    
				</table>  </form>
				<script type="text/javascript">
		    	var cal1 = new calendar1(document.form1.elements['datetime']);
	 			</script>
	 			<script type="text/javascript">
		    	var cal2 = new calendar1(document.form1.elements['delaytime']);
	 			</script>
    			
				<%}if(edit==true){ 
				System.out.println("IN EDIT");
				%>
				<p><b><u><font size="3" color="#6392BE" face="Verdana, Arial, Helvetica, sans-serif">
		  		
			    </font></u></b></p>
			    
			    <form name="form1" method="post"> <table><tr><td><b><font size="3" color="#6392BE">Alert:-</font></b></td>
			    <td><input type="text" name="editalert" value="<%=alert%>"></td></tr>
			    <tr><td><b><font  size="3" color="#6392BE">Service:-</font></b></td>
			    <td>
				<b><font  size="3" color="#6392BE"><%=editName%></font></b>
              		
               </td>
				<tr><td><b><font size="3" color="#6392BE">Deliver Time:-</font></b></td>
				<td><input type="text" name="editdatetime" value="<%=time%>"></td><td><a href="javascript:cal1.popup();"><img src="cal.gif"></a></td></tr>
				<tr><td><b><font size="3" color="#6392BE">Delay Time:-</font></b></td>
				<td><input type="text" name="editdelaytime" value="<%=delaytime%>"></td><td><a href="javascript:cal2.popup();"><img src="cal.gif"></a></td></tr>
				<tr><td><input type="submit" name="submit" value="Update" ></td>
				<td><input type="submit" name="submit" value="Cancel" onclick="return call1()"></td>
				</tr>
				
				
				
			    
				</table>  </form>
				<script type="text/javascript">
		    	var cal1 = new calendar1(document.form1.elements['editdatetime']);
    			</script>
    			<script type="text/javascript">
		    	var cal2 = new calendar1(document.form1.elements['editdelaytime']);
	 			</script>
				
				<%}
				} %>
				</td></tr>
    
    </table>
  
    
  </body>
 
</html>
