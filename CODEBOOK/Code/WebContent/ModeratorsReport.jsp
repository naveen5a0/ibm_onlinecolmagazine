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
      	String query = "SELECT FIRST_NAME,EMAIL,CATEGORY,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE APPROVEDBY = CM.USER_ID) AS ARTICLES_PROCESSED,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE APPROVEDBY = CM.USER_ID AND ISPROCESSED = 1) AS ARTICLES_ACCEPTED,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE APPROVEDBY = CM.USER_ID AND ISPROCESSED = -1) AS ARTICLES_REJECTED FROM CODEBOOK_USERS CU,CODEBOOK_MODERATORS CM WHERE CM.USER_ID = CU.USER_ID";
      	connection = DriverManager.getConnection("jdbc:db2://localhost:50000/CODEBOOK","mahesh", "db2admin");
      statement = connection.createStatement();

      resultSet = statement.executeQuery(query);
    	 
		URL url;
		try {
			url = new URL("http://localhost:9080/sample/ModeratorsReport.jrxml");
			InputStream is = url.openStream();
			System.out.flush();
			FileOutputStream fos = null;
			fos = new FileOutputStream("ModeratorsReport.jrxml");
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
JasperReport jasperReport = JasperCompileManager.compileReport("ModeratorsReport.jrxml");
JasperPrint print = JasperFillManager.fillReport(jasperReport,new HashMap(),new JRResultSetDataSource(resultSet));
JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
response.getOutputStream().flush();
%>


