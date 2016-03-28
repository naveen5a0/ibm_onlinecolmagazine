<%@ page contentType="application/pdf" %>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
		Connection connection = null;
    	ResultSet resultSet = null;
    	Statement statement = null;
    	Class.forName("com.ibm.db2.jcc.DB2Driver");
      	String query = "SELECT POLL_QUESTION,POLL_OPTIONS,POLL_RESULTS FROM CODEBOOK_POLLS";
      	connection = DriverManager.getConnection("jdbc:db2://localhost:50000/CODEBOOK","mahesh", "db2admin");
      statement = connection.createStatement();

      resultSet = statement.executeQuery(query);
    	 
		URL url;
		try {
			url = new URL("http://localhost:9080/sample/PollReport.jrxml");
			InputStream is = url.openStream();
			System.out.flush();
			FileOutputStream fos = null;
			fos = new FileOutputStream("PollReport.jrxml");
			int oneChar, count = 0;
			while ((oneChar = is.read()) != -1) {
				fos.write(oneChar);
				count++;
			}
			is.close();
			fos.close();
		} catch (Exception e) {
		}

response.getOutputStream().flush();
JasperReport jasperReport = JasperCompileManager.compileReport("PollReport.jrxml");
JasperPrint print = JasperFillManager.fillReport(jasperReport,new HashMap(),new JRResultSetDataSource(resultSet));
JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
response.getOutputStream().flush();
%>


