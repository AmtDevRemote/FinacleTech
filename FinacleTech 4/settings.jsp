<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ page import="org.apache.struts.action.DynaActionForm"%>
<%@ page import="java.util.ArrayList"%>
<%String responseMessage = session.getAttribute("saved")!=null?(String)session.getAttribute("saved"):"";
ArrayList accessList = (ArrayList)session.getAttribute("accessList");
session.removeAttribute("saved");
%>
<html>
<head>
<title>CUSTOMER CONNECT</title>

<link href="../css/main-styles.css" rel="stylesheet" type="text/css">
<link href="../css/frames-styles.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript type=text/javascript>
  function addAccessList()
{
    var value =	document.forms[0].accessListAdd.value;
    if(value == "" || value == null)
    {
    	alert("Enter the Id to add to AccessList");
    	return false;
    }
    else
    {
    	var listLen = document.forms[0].accessList.options.length;    	    	
    	var no=new Option();
		no.text=value;
		no.value=value;		
		document.forms[0].accessList.options[listLen]=no;
		document.forms[0].accessListAdd.value="";
    }       
}

function removeAccessList()
{    
    	var listLen = document.forms[0].accessList.options.length;    	    	
    	var options=new Object();
    	var j = 0;
    	for(var i=0;i<listLen;i++)
    	{    		
    		if(!document.forms[0].accessList.options[i].selected)
			{		
				var no=new Option();
				no.text=document.forms[0].accessList.options[i].text;
				no.value=document.forms[0].accessList.options[i].value;
				options[j]=no;	
				j = j+1;		
			}					
    	}    	
    	document.forms[0].accessList.options.length = j;
		for(var i=0;i<j;i++)
    	{
    		document.forms[0].accessList.options[i] = options[i];    		
    	}        
}

function countAccessList()
{

	var listLen = document.forms[0].accessList.options.length; 
	
	var value="";
	for(var i=0;i<listLen;i++)
   	{
		value=value+document.forms[0].accessList.options[i].value+",";
	}
	
	value = value.substring(0, value.length-1);
	
	document.forms[0].list.value = value;
	
}

function test1()
{
showhide4tabs('1tab','2tab','3tab','4tab','5tab');
}
function test2()
{
showhide4tabs('2tab','1tab','3tab','4tab','5tab');
}
function test3()
{
showhide4tabs('3tab','1tab','2tab', '4tab','5tab');
}
function test4()
{
showhide4tabs('4tab','1tab','2tab', '3tab','5tab');
}
function test5()
{
showhide4tabs('5tab','4tab','1tab','2tab', '3tab');
}

function showhide4tabs(div1,div2,div3, div4,div5)
{
	var element1 = document.getElementById(div1);
	var element2 = document.getElementById(div2);
	var element3 = document.getElementById(div3);
	var element4 = document.getElementById(div4);
	var element5 = document.getElementById(div5);
	
  	if(element1.style.display == "none")
  	{
		element1.style.display = "block";
		element2.style.display = "none";		
		element3.style.display = "none";		
		element4.style.display = "none";
		element5.style.display = "none";		
	}
	else
	{
		element1.style.display = "none";
		element2.style.display = "block";
		element3.style.display = "block";
		element4.style.display = "block";	
		element5.style.display = "block";		
	} 
}

function activefield(startIndex,endIndex)
{																
	var iterator=startIndex;
	if(document.getElementById(iterator.toString()).checked)
		for(iterator=startIndex+1;iterator<=endIndex;iterator++) 
			document.getElementById(iterator.toString()).disabled=false;
	else
		for(iterator=startIndex+1;iterator<=endIndex;iterator++) 
			document.getElementById(iterator.toString()).disabled=true;
}


</SCRIPT>
</head>
<body>
<html:form method="post" name="settingsForm" type="org.apache.struts.action.DynaActionForm" action="/saveSettings" onsubmit="countAccessList()">
<DIV id="1tab" style="DISPLAY: block"><!--<a name="1"></a>-->
<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" cellpadding="0">
  <tr>
    <td width="100%">
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" class="content">
      <tr>
        <td>
        <img border="0" src="../images/first_left_on.gif" width="18" height="20"></td>
        <td bgcolor="#FF8604"><b><font color="#FFFFFF">SMPP</font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_on_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="Services" onclick="test2()" href="#2">
        <font color="#FFFFFF">Services</font></a></font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="Queue" onclick="test4()" href="#2">
        <font color="#FFFFFF">Queue</font></a></font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="General" onclick="test3()" href="#3">
        <font color="#FFFFFF">General</font></a></font></b></td>
         <td><b><font color="#FFFFFF">
		<td><img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="HTTP" onclick="test5()" href="#5"><font color="#FFFFFF">HTTP</font></a></b></td>
		<td><img border="0" src="../images/last_right_off.gif" width="18" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="3" align="right" style="padding-right:10px"><img src="../images/login-h-line.gif" width="100%" height="3"></td>
  </tr>
  <tr>
    <td width="100%">
       <table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="348">
	      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
	      <tr>
	        <td width="100%" colspan="4" height="11" class="content"></td>
	      </tr>
	      <tr>
	        <td width="100%" class="content" colspan="2" height="12"><b>SMSC (Transmitter)</b></td>
	        <td width="100%" class="content" colspan="2" height="12"><b>SMSC (Receiver)</b></td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="1">IP Address</td>
	        <td width="32%" class="content" height="1">
	        <html:text name="settingsForm" property="ipAddress" size="24" 
	        styleClass="text"/></td>
			<td width="15%" class="content" height="1">IP Address</td>
	        <td width="32%" class="content" height="1">
	        <html:text name="settingsForm" property="recvIpAddress" size="24" 
	        styleClass="text"/></td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="6">Port</td>
	        <td width="32%" class="content" height="6">
	        <html:text name="settingsForm" property="port" size="24" 
	        styleClass="text"/></td>
	        <td width="15%" class="content" height="6">Port</td>
	        <td width="32%" class="content" height="6">
	        <html:text name="settingsForm" property="recvPort" size="24" 
	        styleClass="text"/></td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="10">System Id</td>
	        <td width="32%" class="content" height="10">
	        <html:text name="settingsForm" property="userName" size="24" styleClass="text"/></td>
	         <td width="15%" class="content" height="10">System Id</td>
	        <td width="32%" class="content" height="10">
	        <html:text name="settingsForm" property="recvUserName" size="24" styleClass="text"/></td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="1">Password</td>
	        <td width="32%" class="content" height="1">
	        <html:password name="settingsForm" property="password" size="24" 
	        styleClass="text"/></td>
	        <td width="15%" class="content" height="1">Password</td>
	        <td width="32%" class="content" height="1">
	        <html:password name="settingsForm" property="recvPassword" size="24" 
	        styleClass="text"/></td>
	      </tr>
	      <tr>
	      	<td width="20%" class="content" height="6">Service Type</td>
	        <td width="33%" class="content" height="6"><html:text name="settingsForm" property="serviceType" size="24" styleClass="text" /></td>
	        <td width="20%" class="content" height="6">Service Type</td>
	        <td width="33%" class="content" height="6"><html:text name="settingsForm" property="recvServiceType" size="24" styleClass="text" /></td>
	      </tr>
	      <tr>
	        <td width="20%" class="content" height="10">System Type</td>
	        <td width="33%" class="content" height="10"><html:text name="settingsForm" property="systemType" size="24" styleClass="text"/></td>
	        <td width="20%" class="content" height="10">System Type</td>
	        <td width="33%" class="content" height="10"><html:text name="settingsForm" property="recvSystemType" size="24" styleClass="text"/></td>
	      </tr>
	      <tr>
	      	<td width="20%" class="content" height="1">Service Mode</td>
	        <td width="33%" class="content" height="1">
	        <html:select name="settingsForm" property="serviceMode" styleClass="content" style="border:1px solid #BCBCBC; width:168; height:168; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#E2E2E2">			
			<option value="sync">Synchronus</option>
			<option value="async">Asynchronus</option>
	        </html:select></td>
	        <td width="20%" class="content" height="1">Service Mode</td>
	        <td width="33%" class="content" height="1">
	        <html:select name="settingsForm" property="recvServiceMode" styleClass="content" style="border:1px solid #BCBCBC; width:168; height:168; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#E2E2E2">			
			<option value="sync">Synchronus</option>
			<option value="async">Asynchronus</option>
	        </html:select></td>
	      </tr>
	      <tr>
	        <td width="20%" class="content" height="10">Session Count</td>
	        <td width="33%" class="content" height="10"><html:text name="settingsForm" property="maxThreads" size="24" styleClass="text"/></td>
	        <td width="20%" class="content" height="10">Session Count</td>
	        <td width="33%" class="content" height="10"><html:text name="settingsForm" property="recvMaxThreads" size="24" styleClass="text"/></td>
	      </tr>
		  <tr>
	        <td width="20%" class="content" height="10">Bind Mode</td>
	        <td width="33%" class="content" height="10">
				<html:select name="settingsForm" property="bindMode" styleClass="text">
					<html:option value="t">Transmitter</html:option>
					<html:option value="tr">Tranceiver</html:option>
				</html:select>
			</td>
	        <td width="20%" class="content" height="10">Bind Mode</td>
	        <td width="33%" class="content" height="10">
				<html:select name="settingsForm" property="recvBindMode" styleClass="text">
					<html:option value="r">Receiver</html:option>
				</html:select>
			</td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="12"></td>
	        <td width="32%" class="content" height="12">
	        </td>
	        <td width="20%" class="content" height="12"></td>
	        <td width="33%" class="content" height="12"></td>
	      </tr>
	      <tr>
	        <td width="15%" class="content" height="12">&nbsp; <b>
	        ADDRESS</b></td>
	        <td width="32%" class="content" height="12">
	        </td>
	        <td width="20%" class="content" height="12"></td>
	        <td width="33%" class="content" height="12"></td>
	      </tr>
	      <tr>
	        <td width="100%" class="content" colspan="4" height="106" valign="top">
	        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="689" height="93">
	          <tr>
	            <td width="101" height="19"></td>
	            <td width="181" class="content" align="top" height="19">
	            Source</td>
	            <td width="178"  class="content" align="top" height="19">
	            Destination</td>
	            <td width="229"  class="content" align="top" height="19">
	            <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	            Range</td>
	          </tr>
	          <tr>
	            <td width="101" class="content" height="26">&nbsp; TON</td>
	            <td width="181" class="content" align="left" height="26">
	        <html:text name="settingsForm" property="tonSource" size="24" 
	        styleClass="text"/></td>
	            <td width="178"  class="content" align="top" height="26">
	        <html:text name="settingsForm" property="tonDestination" size="24" 
	        styleClass="text"/></td>
	            <td width="229"  class="content" align="left" height="26">
	        <html:text name="settingsForm" property="tonRange" size="24" 
	        styleClass="text"/></td>
	          </tr>
	          <tr>
	            <td width="101" class="content" height="22">&nbsp; NPI</td>
	            <td width="181" class="content" align="left" height="22">
	        <html:text name="settingsForm" property="npiSource" size="24" 
	        styleClass="text"/></td>
	            <td width="178"  class="content" align="top" height="22">
	        <html:text name="settingsForm" property="npiDestination" size="24" 
	        styleClass="text"/></td>
	            <td width="229"  class="content" align="left" height="22">
	        <html:text name="settingsForm" property="npiRange" size="24" 
	        styleClass="text"/></td>
	          </tr>
	          <tr>
	            <td width="101" class="content" height="26">&nbsp; 
	            Address</td>
	            <td width="181" class="content" align="left" height="26">
	        <html:text name="settingsForm" property="addressSource" size="24" 
	        styleClass="text"/></td>
	            <td width="178"  class="content" align="top" height="26">
	        <html:text name="settingsForm" property="addressDestination" size="24" 
	        styleClass="text"/></td>
	            <td width="229"  class="content" align="left" height="26">
	        <html:text name="settingsForm" property="addressRange" size="24"
	         styleClass="text"/></td>
	          </tr>
	          </table>
	        </td>
	      </tr>
	    </table>
	  	</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5" class="logout_box" style="padding-right:10px"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	</table>
    </td>
  </tr>
</table>
</div>
<DIV id="2tab" style="DISPLAY: none"><!--<a name="2"></a>-->
<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" cellpadding="0">
  <tr>
    <td width="100%">
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" class="content">
      <tr>
        <td>
        <img border="0" src="../images/first_left_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="SMPP" onclick="test1()" href="#2"><font color="#FFFFFF">SMPP</font></a></b></td>
        <td>
        <img border="0" src="../images/overlap_off_on.gif" width="18" height="20"></td>
        <td bgcolor="#FF8604"><b><font color="#FFFFFF">Services</font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_on_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="Queue" onclick="test4()" href="#2">
        <font color="#FFFFFF">Queue</font></a></font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><a title="GENERAL" onclick="test3()" href="#2"><font color="#FFFFFF">General</font></a></b></td>
    <td><b><font color="#FFFFFF">
		<td><img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="HTTP" onclick="test5()" href="#5"><font color="#FFFFFF">HTTP</font></a></b></td>
		<td><img border="0" src="../images/last_right_off.gif" width="18" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="3" style="padding-right:10px"><img src="../images/login-h-line.gif" height="3" width="100%"></td>
  </tr>
  <tr>
    <td width="100%">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="348">
            <table border="0"     cellpadding="0" cellspacing="0" bordercolor="#111111" >
				<tr><td width="100%" colspan="4" height="11"></td></tr>
				<tr>
				  <td width="50%" class="content" colspan="4" height="12"><b>File Monitor</b></td>
				  <td width="50%" class="content" colspan="4" height="12"><b>Mail Monitor</b></td>
				  <bean:define id="enabledNotes" name="settingsForm" property="enableLotusMonitor" type="java.lang.String"/>
				<%
				
					 boolean maildisabled = "yes".equalsIgnoreCase("enabledNotes")?false:true;
				 
				%>
				</tr>
				
				<tr><td width="70%" colspan="4" height="11"></td></tr>
				<bean:define id="enabled" name="settingsForm" property="enableFileMonitor" type="java.lang.String"/>
				<%
					 boolean disabled = "true".equalsIgnoreCase("enabled")?false:true;
				%>
				<tr>
				<td width="1%"><html:checkbox name="settingsForm" property="enableFileMonitor" styleId="200" value="true" onclick= "activefield(200,205);"/></td>
				   <td width="5%" nowrap="true" class="content"  height="23">Enable File Monitor</td>
				   <td width="10%" class="content" align="center">Polling Interval</td>
				   <td width="5%" class="content"><html:text name="settingsForm" size="2" property="PollIntervelFile" styleId="201" styleClass="text" disabled="<%=disabled%>"/>&nbsp;&nbsp; Secs</td>
				   <td  class="content" width="1%"><html:checkbox name="settingsForm" property="enableLotusMonitor" styleId="250" value="yes" onclick= "activefield(250,258);"/></td>
					<td class="content" nowrap="true" height="23">Enable Mail Monitor</td>	
    			    <td width="10%"class="content">Polling Interval</td>
    			    <td  class="content">&nbsp;<html:text size="2" name="settingsForm" property="pollingIntervalLotus" styleId="251" styleClass="text" disabled="<%=maildisabled%>"/>&nbsp;&nbsp; Secs</td>
				</tr>
				<tr>
				   <td class="content" width="5%" colspan="2"  height="23">Source Directory</td>
				   <td height="20" colspan="2" width="20%"><html:text name="settingsForm" property="sourceDirectory" styleId="202" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
				   <td  class="content" width="20%" height="23" align="center" colspan="2">Mail Host</td>
					<td class="content" >&nbsp;&nbsp;<html:text name="settingsForm" property="mailHostLotus"  size="10" styleId="252" styleClass="text" disabled="<%=maildisabled%>"/></td>
				</tr>
				<tr>
					<td class="content" colspan="2" width="5%" height="23">Dest. Directory</td>
					<td height="21" colspan="2"><html:text name="settingsForm" property="destinationDirectory" styleId="203" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
					<td class="content" width="20%"  height="23" align="center"  colspan="2">Arabic User Name</td>    			    
    			    <td class="content">&nbsp;&nbsp;<html:text name="settingsForm" property="arabicUser" styleId="253" styleClass="text" disabled="<%=maildisabled%>"/></td>
    			    <td class="content" height="23" align="left">&nbsp;&nbsp;&nbsp;&nbsp;Password
    			   <html:password size="8" name="settingsForm" property="arabicPassword" styleId="254" styleClass="text" disabled="<%=maildisabled%>"/></td>    			    
				</tr>
				<tr>
					<td class="content"  colspan="2"   width="5%" height="23">Error Directory</td>
					<td colspan="2"><html:text name="settingsForm" property="errorDirectory" styleClass="text" styleId="204" size="44" disabled="<%=disabled%>"/></td>
					<td  class="content" height="23" width="20%" align="center"  colspan="2">English User Name</td>    			    
    			    <td class="content">&nbsp;&nbsp;<html:text name="settingsForm" property="englishUser" styleId="255" styleClass="text" disabled="<%=maildisabled%>"/></td>
    			    <td class="content" height="23" align="left" >&nbsp;&nbsp;&nbsp;&nbsp;Password
    			    <html:password size="8" name="settingsForm" property="englishPassword" styleId="256" styleClass="text" disabled="<%=maildisabled%>"/></td>    			  
				</tr>
				<tr>
					<td class="content" valign="top" colspan="2"  width="15%" align="left" height="10">Number Type</td>
					<td valign="top">
						<html:select name="settingsForm" property="bulkLocal" styleId="205" disabled="<%=disabled%>">
							<html:option value="true">Local</html:option>
							<html:option value="false">International</html:option>
						</html:select>
					</td>
					<td class="content" valign="top" colspan="2">Delivery Report 
						<html:select name="settingsForm" property="deliveryReport" styleId="206">
							<html:option value="Yes">Yes</html:option>
							<html:option value="No">No</html:option>
						</html:select>
					</td>
					<td>
					 	<table>
					 		<tr><td class="content" height="23" align="center">Access List</td></tr>
					 		<tr><td></td></tr>
					 		<tr><td></td></tr>
					 	</table>
					</td>
					<td>
					
						<html:hidden name="settingsForm" property="list" />
						<bean:define id="accesslist" name="settingsForm" property="list" type="java.lang.String"/>
						
					 		</td> </tr>
						</table>
					</td>  			        			    
    			    <td>
    			    	<table>
    			    		<tr><td class="content"><html:text name="settingsForm" property="accessListAdd"  styleId="258" styleClass="text" disabled="<%=maildisabled%>"/></td></tr>
    			    		<tr><td><input type="button" value="Add" class="logout_box" onclick="addAccessList()"   ></td></tr>
    			    		<tr><td><input type="button" value="Remove" class="logout_box" onclick="removeAccessList()" ></td></tr>
    			    	</table>
    			    </td>     			    
				</tr>
				<tr border="1"><td width="100%" colspan="4" height="11"></td></tr>
				
				<tr>
				  <td width="100%" class="content" colspan="8" height="12"><b>Database Monitor</b></td>
				</tr>
				<tr><td width="100%" colspan="4" height="11"></td></tr>
				<bean:define id="enabledDatabaseMonitor" name="settingsForm" property="enableDatabaseMonitor" type="java.lang.String"/>
				
				<tr>
				<td><html:checkbox name="settingsForm" property="enableDatabaseMonitor" styleId="240" value="true" onclick= "activefield(240,247);"/></td>
				   <td class="content" height="23" colspan="3">Enable Database Monitor</td>
				</tr>
				<tr>   
				   <td class="content" height="20" colspan="2">Polling Interval</td>
				   <td class="content"><html:text name="settingsForm" property="pollIntervalDatabase"  size="2" styleId="241" styleClass="text" disabled="<%=disabled%>"/>&nbsp;&nbsp; Secs</td>
				</tr>
				<tr>
				   <td class="content" height="20" colspan="2">Record Count</td>
				   <td height="20" colspan="2"><html:text name="settingsForm" property="recordCount" size="2" styleId="242" styleClass="text" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
				   <td class="content" height="20" colspan="2">Database URL</td>
				   <td height="20" colspan="2"><html:text name="settingsForm" property="databaseURL" styleId="243" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" colspan="2"  height="20">Driver Name</td>
					<td height="20" colspan="2"><html:text name="settingsForm" property="databaseDriverName" styleId="244" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="20" colspan="2">User Name</td>
					<td colspan="2"><html:text name="settingsForm" property="databaseUserName" styleClass="text" styleId="245" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="20" colspan="2">Password</td>
					<td colspan="2"><html:password name="settingsForm" property="databasePassword" styleClass="text" styleId="246" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="20" colspan="2">Message Table</td>
					<td colspan="2"><html:text name="settingsForm" property="tableName" styleClass="text" styleId="247" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				
			</table>
			</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5" style="padding-right:10px"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	</table>
    </td>
  </tr>
</table>
</div>
<DIV id="4tab" style="DISPLAY: none">
<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" cellpadding="0">
  <tr>
    <td width="100%">
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" class="content">
      <tr>
        <td>
        <img border="0" src="../images/first_left_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="SMPP" onclick="test1()" href="#2"><font color="#FFFFFF">SMPP</font></a></b></td>
        <td>
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><a title="Services" onclick="test2()" href="#2"><b><font color="#FFFFFF">Services</font></b></a></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_on.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#ff8604"><b><font color="#FFFFFF">Queue</font></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_on_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><a title="GENERAL" onclick="test3()" href="#2"><font color="#FFFFFF">General</font></a></b></td>
       <td><b><font color="#FFFFFF">
		<td><img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="HTTP" onclick="test5()" href="#5"><font color="#FFFFFF">HTTP</font></a></b></td>
		<td><img border="0" src="../images/last_right_off.gif" width="18" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="3" style="padding-right:10px"><img src="../images/login-h-line.gif" height="3" width="100%"></td>
  </tr>
  <tr>
    <td width="100%">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="348" width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr><td colspan="2" height="11"></td></tr>
				<tr>
				  <td class="content" colspan="2" height="20"><b>Queue Monitor</b></td>
				</tr>
				<tr>
				   <td class="content" height="23" width="10%">Queue Host</td>
				   <td height="20" width="90%"><html:text name="settingsForm" property="queueHost" styleId="202" styleClass="text" size="44"/></td>
				</tr>
				<tr>
					<td class="content"  height="23">Queue Port</td>
					<td height="21" ><html:text name="settingsForm" property="queuePort" styleId="203" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="23">Queue Manager</td>
					<td ><html:text name="settingsForm" property="queueManager" styleClass="text" styleId="204" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="23">Queue Channel</td>
					<td ><html:text name="settingsForm" property="queueChannel" styleClass="text" styleId="204" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr>
					<td class="content" height="23">Queue Name</td>
					<td ><html:text name="settingsForm" property="sendQueue" styleClass="text" styleId="204" size="44" disabled="<%=disabled%>"/></td>
				</tr>
				<tr><td width="100%" height="11" colspan="2"></td></tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5" style="padding-right:10px"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	</table>
    </td>
  </tr>
</table>
</div>
<DIV id="3tab" style="DISPLAY: none"><!--<a name="3"></a>-->
<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" cellpadding="0">
  <tr>
    <td width="100%">
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" class="content">
      <tr>
        <td>
        <img border="0" src="../images/first_left_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="SMPP" onclick="test1()" href="#2"><font color="#FFFFFF">SMPP</font></a></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><a title="SERVICES" onclick="test2()" href="#2"><font color="#FFFFFF">Services</font></a></b></td>
        <td><b><font color="#FFFFFF">
        <img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="Queue" onclick="test4()" href="#2">
        <font color="#FFFFFF">Queue</font></a></font></b></td>
        <td>
        <img border="0" src="../images/overlap_off_on.gif" width="18" height="20"></td>
        <td bgcolor="#FF8604"><b><font color="#FFFFFF">General</font></b></td>
       <td><b><font color="#FFFFFF">
		<td><img border="0" src="../images/overlap_on_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="HTTP" onclick="test5()" href="#5"><font color="#FFFFFF">HTTP</font></a></b></td>
		<td><img border="0" src="../images/last_right_off.gif" width="18" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="3" align="right" style="padding-right:10px"><img src="../images/login-h-line.gif" width="100%" height="3"></td>
  </tr>
  <tr>
    <td width="100%">
   <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="348">
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
			
			  <tr><td width="100%" colspan="4" height="11"></td></tr>
			  <tr><td width="100%" class="content" colspan="2"><b>General</b></td></tr>
			  <tr><td width="100%" colspan="4" height="11"></td></tr>
			  <tr>
				<td width="27%" class="content">Message Sending Mode</td>
				<td  class="content"><html:radio name="settingsForm" property="msgsendprotocol" styleId="31" styleClass="text" value="smpp"/>SMPP
				<html:radio name="settingsForm" property="msgsendprotocol" styleId="31" styleClass="text" value="http"/>HTTP<html:radio name="settingsForm" property="msgsendprotocol" styleId="31" styleClass="text" value="gsm"/>GSM
				</td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Log Directory</td>
				<td width="63%"><html:text name="settingsForm" property="logDirectory" styleId="31" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Group Directory</td>
				<td width="63%"><html:text name="settingsForm" property="groupDirectory" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Server Group Directory</td>
				<td width="63%"><html:text name="settingsForm" property="extGroupDirectory" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Mail Template Directory</td>
				<td width="63%"><html:text name="settingsForm" property="mailTemplateDir" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Enable Debug</td>
				<td width="63%"><html:checkbox name="settingsForm" property="enableDebug" styleId="305" value="true" styleClass="text"/></td>
			  </tr>
			  <bean:define id="enabledTime" name="settingsForm" property="enableTime" type="java.lang.String"/>
			 
			  <tr>
				<td width="27%" class="content">Time Restriction</td>
				<td width="63%"><html:checkbox name="settingsForm" property="enableTime" styleId="300" value="true" styleClass="text" onclick="activefield(300,304)"/></td>
			  </tr>
			  
			  <tr>
				<td width="25%" class="content" height="21">Automatic Message Validity</td>
				<td width="32%" height="21" class="content"><html:text name="settingsForm" property="messageRetry" styleId="40" styleClass="text" size="2"/>&nbsp;Minutes</td>
			  </tr>
			  <tr>
				<td width="25%" class="content" height="21">Log File User</td>
				<td width="32%" height="21" class="content"><html:text name="settingsForm" property="accessUser" styleId="41" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="25%" class="content" height="21">Pull Service Url</td>
				<td width="63%" height="21" class="content"><html:text name="settingsForm" property="pullServerUrl" styleId="42" styleClass="text" size="46"/></td>
			  </tr>
			  <tr><td width="100%" class="content"  colspan="2" height="8"></td></tr>
		  	  <tr>
			    <td width="100%" class="content" colspan="4" height="12"><b>Mail Alert</b></td>
			  </tr>
			  <tr><td width="100%" colspan="4" height="11"></td></tr>
			  <bean:define id="disabledMail" name="settingsForm" property="enableMail" type="java.lang.String"/>
			  
			  <tr>
				<td width="27%" class="content">Enable Mail Alerts</td>
				<td width="63%" ><html:checkbox name="settingsForm" property="enableMail" styleId="250" value="true" onclick= "activefield(250,253);"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Mail Host</td>
			    <td width="63%" class="content" ><html:text name="settingsForm" property="mailHostGeneral" styleId="251" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Mail Id</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="emailId" styleId="252" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Email Id</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="sender" styleId="253" styleClass="text" size="44" disabled="<%=disabled%>"/></td><tr>
				<td width="27%" class="content" height="23">Sender Id</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="emailusername" styleId="253" styleClass="text"  disabled="<%=disabled%>"/></td></tr>
				<tr><td width="27%" class="content" height="23">Password</td>
				<td width="63%" class="content"><html:password name="settingsForm" property="emailuserpassword" styleId="253" styleClass="text"  disabled="<%=disabled%>"/></td></tr>
			
			  <tr>
				<td width="27%" class="content" height="23">Bcc Count</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="bccCount" styleId="253" styleClass="text" size="15"/></td>
			  </tr>
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5" style="padding-right:10px"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	</table>
    </td>
  </tr>
</table>
</div>
<DIV id="5tab" style="DISPLAY: none"><!--<a name="3"></a>-->
<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" cellpadding="0">
  <tr>
    <td width="100%">
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" class="content">
      <tr>
        <td>
			<img border="0" src="../images/first_left_off.gif" width="18" height="20"></td>
        <td bgcolor="#005973"><b><a title="SMPP" onclick="test1()" href="#2"><font color="#FFFFFF">SMPP</font></a></b></td>
        <td><b><font color="#FFFFFF">
			<img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><a title="SERVICES" onclick="test2()" href="#2"><font color="#FFFFFF">Services</font></a></b></td>
        <td><b><font color="#FFFFFF">
			<img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="Queue" onclick="test4()" href="#2">
        <font color="#FFFFFF">Queue</font></a></font></b></td>
        <td><b><font color="#FFFFFF">
			<img border="0" src="../images/overlap_off_off.gif" width="18" height="20"></font></b></td>
        <td bgcolor="#005973"><b><font color="#FFFFFF"><a title="general" onclick="test3()" href="#2">
		<font color="#FFFFFF">General</font></a></font></b></td>
      <td><b><font color="#FFFFFF">
		<td><img border="0" src="../images/overlap_off_on.gif" width="18" height="20"></td>
        <td bgcolor="#FF8604"><b><font color="#FFFFFF">HTTP</font></b></td>
		<td><img border="0" src="../images/last_left_on.gif" width="18" height="20"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="3" align="right" style="padding-right:10px"><img src="../images/login-h-line.gif" width="100%" height="3"></td>
  </tr>
  <tr>
    <td width="100%">
   <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
		<td style="background-image:url(../images/menu-bg-left.gif); background-repeat:repeat-y;"></td>
		<td class="framemenu" valign="top" height="348">
			<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
			<bean:define id="enabled" name="settingsForm" property="proxyrequired" type="java.lang.String"/>
				

			 <tr>
				<td width="50%" class="content" align="left" colspan="1">Http Url</td><td width="50%"  class="content" colspan="2">
				<html:checkbox name="settingsForm" property="proxyrequired" styleId="99" value="true" styleClass="text" onclick="activefield(99,101);"/>&nbsp;&nbsp;&nbsp;&nbsp;Proxy Required </td>
			</tr>
			<tr><td  class="content" width="50%"><html:text name="settingsForm" property="httpurl"  styleClass="text" size="46"/></td>
			
			 <bean:define id="enabled" name="settingsForm" property="proxyreqauth" type="java.lang.String"/>
				

			 <tr>
				<td width="25%" class="content" >&nbsp;&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Value</td>
				<td width="50%" class="content" ><html:checkbox name="settingsForm" property="proxyreqauth" styleId="999" value="true" styleClass="text" onclick="activefield(999,1003);"/>&nbsp;&nbsp;&nbsp;&nbsp;Proxy Requires Authentication</td>
			</tr>
			<tr><td><html:text name="settingsForm" property="httpparamname87" styleClass="text" size="8"/><html:text name="settingsForm" property="httpparamvalue87" styleId="31" styleClass="text" size="8"/></td><td class="content" >Proxy Authentication Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					</td>
			<tr>
				
				<tr>
				<td class="content"><html:text name="settingsForm" property="httpparamname91" styleId="31" styleClass="text" size="8"/><html:text name="settingsForm" property="httpparamvalue91" styleId="31" styleClass="text" size="8"/></td><td class="content"></td>
				</tr>
				<tr>
				<td class="content"><html:text name="settingsForm" property="httpparamname92" styleId="31" styleClass="text" size="8"/><html:text name="settingsForm" property="httpparamvalue92" styleId="31" styleClass="text" size="8"/></td><td class="content"></td>
				</tr>
				<tr>
				<td class="content"><html:text name="settingsForm" property="httpparamname93" styleId="31" styleClass="text" size="8"/><html:text name="settingsForm" property="httpparamvalue93" styleId="31" styleClass="text" size="8"/></td><td class="content"></td>
				</tr>
				<tr>
				<td class="content"><html:text name="settingsForm" property="httpparamname94" styleId="31" styleClass="text" size="8"/><html:text name="settingsForm" property="httpparamvalue94" styleId="31" styleClass="text" size="8"/></td><td class="content"></td>
				</tr>
			  <!--<tr><td width="100%" colspan="2" height="11"></td></tr>
			  <tr><td width="100%" class="content" colspan="2"><b>HTTP</b></td>
			  <td><html:checkbox name="settingsForm" property="proxyrequired" styleId="305" value="true" styleClass="text"/>
			  Required Proxy</tr>
			  <tr><td width="100%" colspan="4" height="11"></td></tr>
			   <tr>
				<td width="27%" class="content">Http Url</td>
				<td width="63%"><html:text name="settingsForm" property="httpurl" styleId="31" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Group Directory</td>
				<td width="63%"><html:text name="settingsForm" property="groupDirectory" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Server Group Directory</td>
				<td width="63%"><html:text name="settingsForm" property="extGroupDirectory" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Mail Template Directory</td>
				<td width="63%"><html:text name="settingsForm" property="mailTemplateDir" styleId="32" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content">Enable Debug</td>
				<td width="63%"><html:checkbox name="settingsForm" property="enableDebug" styleId="305" value="true" styleClass="text"/></td>
			  </tr>
			    <tr>
				<td width="27%" class="content">Time Restriction</td>
				<td width="63%"><html:checkbox name="settingsForm" property="enableTime" styleId="300" value="true" styleClass="text" onclick="activefield(300,304)"/></td>
			  </tr>
			  
			  <tr>
				<td width="25%" class="content" height="21">Automatic Message Validity</td>
				<td width="32%" height="21" class="content"><html:text name="settingsForm" property="messageRetry" styleId="40" styleClass="text" size="2"/>&nbsp;Minutes</td>
			  </tr>
			  <tr>
				<td width="25%" class="content" height="21">Log File User</td>
				<td width="32%" height="21" class="content"><html:text name="settingsForm" property="accessUser" styleId="41" styleClass="text" size="46"/></td>
			  </tr>
			  <tr>
				<td width="25%" class="content" height="21">Pull Service Url</td>
				<td width="63%" height="21" class="content"><html:text name="settingsForm" property="pullServerUrl" styleId="42" styleClass="text" size="46"/></td>
			  </tr>
			  <tr><td width="100%" class="content"  colspan="2" height="8"></td></tr>
		  	  <tr>
			    <td width="100%" class="content" colspan="4" height="12"><b>Mail Alert</b></td>
			  </tr>
			  <tr><td width="100%" colspan="4" height="11"></td></tr>
			  <bean:define id="disabledMail" name="settingsForm" property="enableMail" type="java.lang.String"/>
			  
			  <tr>
				<td width="27%" class="content">Enable Mail Alerts</td>
				<td width="63%" ><html:checkbox name="settingsForm" property="enableMail" styleId="250" value="true" onclick= "activefield(250,253);"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Mail Host</td>
			    <td width="63%" class="content" ><html:text name="settingsForm" property="mailHostGeneral" styleId="251" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Mail Id</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="emailId" styleId="252" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Sender Id</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="sender" styleId="253" styleClass="text" size="44" disabled="<%=disabled%>"/></td>
			  </tr>
			  <tr>
				<td width="27%" class="content" height="23">Bcc Count</td>
				<td width="63%" class="content"><html:text name="settingsForm" property="bccCount" styleId="253" styleClass="text" size="15"/></td>
			  </tr>-->-->
			</table>
		</td>
		<td style="background-image:url(../images/menu-bg-right.gif); background-repeat:repeat-y;"></td>
	</tr>
	<tr>
		<td width="5" height="5"><img src="../images/menu-bg-bottom-left.gif" alt="" width="6" height="6" border="0"></td>
		<td width="100%" style="background-image: url(../images/menu-bg-bottom.gif); background-repeat:repeat-x;"></td>
		<td width="5" height="5" style="padding-right:10px"><img src="../images/menu-bg-bottom-right.gif" alt="" width="6" height="6" border="0"></td>
	</tr>
	</table>
    </td>
  </tr>
</table>
</div>
<input type="submit" value="Update" class="logout_box">
</html:form>
</body>
</html>