<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>College Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
</head>
<frameset rows="30,*,30" frameborder="0">
  <frame src="../frametop.jsp" name="topframe" scrolling="NO" noresize>
  <frameset cols="200,*,200">
    <frame src="../action/serviceleft" name="leftframe" scrolling="auto" noresize>
	  <frameset rows="31,*">
	    <frame src="../framequickmenu.jsp" name="barframe" scrolling="NO" noresize>
	    <frame src="../about_Product.htm" name="mainframe" scrolling="auto" noresize>
	  </frameset>
	<frame src="../action/serviceright" name="leftright" scrolling="auto" noresize>
  </frameset>
  <frame src="../framebottom.jsp" name="bottomframe" scrolling="NO" noresize >
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>