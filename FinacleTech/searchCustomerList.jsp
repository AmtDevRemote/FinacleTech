<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%!  int count=0; 
       int index=0; %>

<c:set var="start" value="${paginationForm.start}" />
<c:set var="range" value="${paginationForm.range}" />
<c:set var="results" value="${paginationForm.results}"/>
<c:set var="action" value="${paginationForm.action}"/>
<jsp:useBean id="start" class="java.lang.String" />
<jsp:useBean id="range" class="java.lang.String" />
<jsp:useBean id="results" class="java.lang.String" />
<jsp:useBean id="action" class="java.lang.String" />

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<script language="JavaScript" type="text/JavaScript">
function submitCustomer(form)
{
	var i;
	var flag=false;
	if(isNaN(form.clist.length) && form.clist.checked)
	{
		flag=true;
	}
	for(i=0;i<form.clist.length;i++)
	{
			if(form.clist[i].checked)
				{
						flag=true;
				}
	}
			
	if(flag==false)
	{
			alert("No Customers selected");
			return false;
	}
	else
	{
		form.target=self.name;
		form.submit();
	}
}

function checkme(numberOfCheckbox) {	
	if (window.document.getElementById("checkbox").checked) {
		for(i=1;i<=numberOfCheckbox;i++){
			document.getElementById(i.toString()).checked = true;
		}
	}
	else{ 
		for(i=1;i<=numberOfCheckbox;i++){
			document.getElementById(i.toString()).checked = false;
		}			
	}	
}
function uncheck(form){
	
  	form.checkItem1.checked=false;
  }
</script>

<LINK
	href="<c:out value='${pageContext.request.contextPath}'/>/theme/pagination-tag.css"
	rel="stylesheet" type="text/css">
<TITLE></TITLE>
<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">

</HEAD> 
<body topmargin="0" leftmargin="0" bgcolor="#E2E2E2">
<form name="customerform" method="post" action="../action/customerDisplay?action=updateSearchCustomerList">
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#E2E2E2">
<tr class="content">
	<c:forEach var="pageObject" items="${paginationForm.list}"
					varStatus="count">
					
					<% count++; %>
	</c:forEach>
  </tr>
	<tr>
	
	<input type="hidden" name="group" value="<%=request.getParameter("group")%>">
	<td ><input type="hidden" name="start" value="<%=start%>"/></td>
	<td ><input type="hidden" name="range" value="<%=range%>"/></td>
	<td ><input type="hidden" name="results" value="<%=results%>"/></td>
	<td><input type="hidden" name="group" value=""/></td>
	<td><input type="hidden" name="searchName" value=<%=request.getAttribute("searchName")%> /></td>
		<td><input type="hidden" name="searchNumber" value=<%=request.getAttribute("searchNumber")%> /></td>
	
	
	

		<td>
	<table border="0"  cellspacing="1" cellpading="2" width="100%" bgcolor="#E2E2E2">
			<thead>
				<tr class="content">
					  <td width="50" align="center" bgcolor="#FFB502">CustomerId</td>
					  <td width="100" align="center" bgcolor="#FFB502">First Name</td>
					  <td width="100"  align="center" bgcolor="#FFB502">Mobile Number</td>
					  <td width="20"  align="center" bgcolor="#FFB502">Gender</td>
					  <td width="2"  align="right" bgcolor="#FFB502"><input TYPE="checkbox" align="left" id="checkbox"  name="checkItem1" check onClick="checkme(<%=count%>)" ></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pageObject" items="${paginationForm.list}"
					varStatus="count">
					<c:if test="${count.count % 2 == 0}">
					<tr   class="content" >					</c:if>
					<c:if test="${count.count % 2 != 0}">
					<tr  class="content">					</c:if>
					<% index++; %>
					<td width="10%" bgcolor="white"><c:out value="${pageObject.id}" /></td>
					<td width="35%" bgcolor="white"><c:out value="${pageObject.name}" /></td>
					<td width="35%" bgcolor="white"><c:out value="${pageObject.mobile}" /></td>
					<td width="10%" bgcolor="white"><c:out value="${pageObject.gender}" /></td>
					<td  width="2%" align="right" bgcolor="#FFB502"><input  type="checkbox" name="clist" align="left" value="<c:out value="${pageObject.id}" />" id="<%=index%>" onClick="uncheck(this.form)"></td>
				
				</c:forEach>
				<% count=0;
						index=0; %>
				
				
				
				<tr>
		<td colspan="2" align="right"><pagination-tag:pager title="yes" start="<%=start%>"
			range="<%=range%>" action="<%=action%>" results="<%=results%>" styleClass="page" /></td><td colspan="3" align="left">
		  <input  type="button" class="content" value="update customer list" onClick="submitCustomer(this.form)" />&nbsp;&nbsp;<% if(request.getAttribute("info")!=null) { %><font color="red" class="content"><b>Total Selected Customers : <%= (String)request.getAttribute("info") %> </b></font><% } %></td>
				</tr>
			</tbody>
		</table>
	</tr>
	
</table>
</form>
</BODY>
</HTML>
