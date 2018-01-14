<%@ page errorPage="error.jsp" %>
<%--<%@ page import="com.techunified.webclient.jasper.datasource.*" %>
--%><%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="net.sf.jasperreports.engine.util.*" %>
<%@ page import="net.sf.jasperreports.engine.export.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%--<%
	String reportName=request.getParameter("name");
	File reportFile = new File(application.getRealPath("/reports/"+reportName+".jasper"));

	Map parameters = new HashMap();
	parameters.put("ReportTitle", "Address Report");
	parameters.put("BaseDir", reportFile.getParentFile());
				
	JasperReport jasperReport = (JasperReport)JRLoader.loadObject(reportFile.getPath());
			
	JasperPrint jasperPrint = 
		JasperFillManager.fillReport(
			jasperReport,
			parameters, new WebappDataSource()
			);
	
	PrintRequestAttributeSet printRequestAttributeSet = new HashPrintRequestAttributeSet();
	printRequestAttributeSet.add(MediaSizeName.ISO_A4);
	
	ByteArrayOutputStream baos = new ByteArrayOutputStream();
	JRPrintServiceExporter exporter = new JRPrintServiceExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
	exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
	exporter.setParameter(JRPrintServiceExporterParameter.DISPLAY_PRINT_DIALOG, Boolean.TRUE);
	exporter.exportReport();
	byte[] bytes = baos.toByteArray();
	response.setContentType("application/octet-stream");
	response.setContentLength(bytes.length);
	ServletOutputStream ouputStream = response.getOutputStream();
	ouputStream.write(bytes, 0, bytes.length);
	ouputStream.flush();
	ouputStream.close();
%>--%>
