<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="clases.conexion"%>
<%
    conexion con = new conexion();
    con.conectar();
    File archivo = new File(application.getRealPath("pdf/Ingresos_totales.jasper"));
    Map parameters = new HashMap();
    String from=request.getParameter("entrada");
    String to=request.getParameter("salida");
    parameters.put("inicio", from);
    parameters.put("fin", to);
      byte[] bytes = JasperRunManager.runReportToPdf(archivo.getPath(), parameters, con.conexionget());
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);
    ServletOutputStream ouputStream = response.getOutputStream();
    ouputStream.write(bytes, 0, bytes.length);
    ouputStream.flush();
    ouputStream.close();
    con.desconectar();
%>