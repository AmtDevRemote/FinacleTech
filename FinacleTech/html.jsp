<%@ page contentType="text/html; charset=utf-8" errorPage="error.jsp"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="net.sf.jasperreports.engine.data.JRBeanCollectionDataSource" %>
<%@ page import="com.techunified.smpp.app.util.JulianDate" %>
<%@ page import="com.techunified.webclient.report.datasource.DataSourceHelper" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%
	JasperPrint jasperPrint = (JasperPrint)session.getAttribute("report");
	JRHtmlExporter exporter = new JRHtmlExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_MAP, (Map)session.getAttribute("IMAGES_MAP"));
	StringBuffer buffer = new StringBuffer("</td><td width=\"50%\">&nbsp;</td></tr>\n");
	buffer.append("</table>\n");
	if ("print".equals((String)request.getAttribute("print")))
	{
		buffer.append("<script language=\"JavaScript\">\r\n");
		buffer.append("this.focus();\r\n");
		buffer.append("this.print();\r\n");
		buffer.append("</script>\r\n");
	}
	buffer.append("</body>\n");
	buffer.append("</html>\n");
	exporter.setParameter(JRHtmlExporterParameter.HTML_FOOTER, buffer.toString());
	buffer = new StringBuffer("<div style=\"page-break-before:always\">&nbsp;</div>");
	exporter.setParameter(JRHtmlExporterParameter.BETWEEN_PAGES_HTML, buffer.toString());
	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "../image.jsp?image=");
	System.out.println("Coming till here successfully4");
	exporter.exportReport();
	System.out.println("Coming till here successfully5");
%>
