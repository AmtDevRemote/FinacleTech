<%@ page contentType="application/pdf;charset=UTF-8" errorPage="error.jsp" %>
<%--<%@ page import="com.techunified.webclient.jasper.datasource.*" %>
--%><%@ page import="net.sf.jasperreports.engine.export.JRPdfExporter" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
	JasperPrint jasperPrint = (JasperPrint)session.getAttribute("report");
	Map imagesMap = new HashMap();
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	JRPdfExporter exporter = new JRPdfExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
	exporter.exportReport();
	byte[] bytes = baos.toByteArray();
	response.setContentType("application/pdf");
	response.setContentLength(bytes.length);
	ServletOutputStream ouputStream = response.getOutputStream();
	ouputStream.write(bytes, 0, bytes.length);
	ouputStream.flush();
	ouputStream.close();
%>
