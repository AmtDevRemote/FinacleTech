
  <script language="JavaScript" src="calendar1.js"></script>
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
					
				</td>
				<td valign="top" width="80%" >
				
				<p><b><u><font size="3" color="#6392BE" face="Verdana, Arial, Helvetica, sans-serif">
		  		
			    </font></u></b></p>
			    <form name="form1" method="post"> <table>
			    
				<tr><td><b><font size="3" color="#6392BE">Deliver Time:-</font></b></td>
				<td><input type="text" name="datetime"></td><td><a href="javascript:cal1.popup();"><img src="cal.gif"></a></td></tr>
				
				<tr><td><input type="submit" name="submit" value="Submit" ></td>
				<td><input type="submit" name="submit" value="Cancel" ></td>
				</tr>
				
			    
				</table>  </form>
				<script type="text/javascript">
		    	var cal1 = new calendar1(document.form1.elements['datetime']);
	 			</script>
	 			
    			
				
				</td></tr>
    
    </table>
  