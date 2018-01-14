<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://paginationtag.miin.com" prefix="pagination-tag"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%!  int count=0; 
       int index=0; 
	  %>

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

function checkme(numberOfCheckbox) {	
	if (window.document.getElementById("checkbox").checked) {
		for(i=0;i<numberOfCheckbox;i++){
			document.getElementById(i.toString()).checked = true;
		}
	}
	else{ 
		for(i=0;i<numberOfCheckbox;i++){
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
<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#E2E2E2">
<tr class="content">
	<c:forEach var="pageObject" items="${paginationForm.list}"
					varStatus="count">
					<% count++; %>
		</c:forEach>
</tr>
<tr>

<td>
<form  method="post" id="ccc" action="/customerDisplay?action=updateCustomerList&range=<%=range%>&start=<%=start%>&results=<%=results%>">
	<table border="0"  cellspacing="1"  cellpading="2" width="122%" bgcolor="#E2E2E2">
		<thead width="100%">
			<tr class="content">
						 <td width="100" align="center" bgcolor="#FFB502">First Name</td>
						<td width="100"  align="center" bgcolor="#FFB502">Mobile Number</td>
						<td width="50"  align="center" bgcolor="#FFB502">Gender</td>
						<td width="10"   bgcolor="#FFB502"><input TYPE="checkbox"  id="checkbox"  name="checkItem1" check onClick="checkme(<%=count%>)" ></td>
				</tr>
		</thead>
		<tbody>
		<c:forEach var="pageObject" items="${paginationForm.list}"
					varStatus="count">
					<c:if test="${count.count % 2 == 0}">
						<tr   class="content" >
					</c:if>
					<c:if test="${count.count % 2 != 0}">
						<tr  class="content">
					</c:if>
				
					
					<td width="35%" bgcolor="white" class="content"><input type="text" name="firstNames" value=<c:out value="${pageObject.name}" />></td>
					<td width="35%" bgcolor="white" class="content"><input type="text" name="mobileNumbers" value=<c:out value="${pageObject.mobile}"/>></td>
					<td width="10%" bgcolor="white" class="content">
					
			<bean:define id="genderDetail" name="pageObject" property="gender"/>
				<html:select  name="genders" property="gender" value="<%=genderDetail.toString()%>"  styleClass="content">
		   				<html:option value="M">Male</html:option>
		   				<html:option value="F">Female</html:option>
		   </html:select>
				</td>
					<td  width="2%"  bgcolor="#FFB502" class="content"><input  type="checkbox" name="clist"  value="<%=index%>"   id="<%=index%>" onClick="uncheck(this.form)"> <input type="hidden"  name="customerId" value="<c:out value="${pageObject.id}"/>" property="id"/></td>

		<% index++; %>
		</c:forEach>
				<% count=0;
						index=0; %>
		
		<tr>
		<td align="center" colspan="5" width="100%"><pagination-tag:pager title="yes" start="<%=start%>"
			range="<%=range%>" action="<%=action%>" results="<%=results%>" styleClass="page" /></td>
			<td><input type="hidden" name="group" value="<%=request.getParameter("group")%>"></td>
						<td ><input type="hidden" name="start" value="<%=start%>"/></td>
						<td ><input type="hidden" name="range" value="<%=range%>"/></td>
						<td ><input type="hidden" name="results" value="<%=results%>"/></td>
		</tr>
			</tbody>

		</table>
		</form>
	</tr>
	
</table>

</BODY>
</HTML>
