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
      	String query = "SELECT USER_ID,FIRST_NAME,LAST_NAME,EMAIL,COLLEGE,DATEOFBIRTH,ROLL_NUMBER,BRANCH,DATE_OF_REG,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE USER_ID = USERID) AS ARTICLES_POSTED,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE USER_ID = USERID AND ISPROCESSED = 1) AS ARTICLES_ACCEPTED ,(SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE USER_ID = USERID AND ISPROCESSED = -1) AS ARTICLES_REJECTED FROM CODEBOOK_USERS";
      	connection = DriverManager.getConnection("jdbc:db2://localhost:50000/CODEBOOK","mahesh", "db2admin");
      statement = connection.createStatement();

      resultSet = statement.executeQuery(query);
    	 
		URL url;
		try {
			url = new URL("http://localhost:9080/sample/UsersReport.jrxml");
			InputStream is = url.openStream();
			System.out.flush();
			FileOutputStream fos = null;
			fos = new FileOutputStream("UsersReport.jrxml");
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
JasperReport jasperReport = JasperCompileManager.compileReport("UsersReport.jrxml");
JasperPrint print = JasperFillManager.fillReport(jasperReport,new HashMap(),new JRResultSetDataSource(resultSet));
JasperExportManager.exportReportToPdfStream(print,response.getOutputStream());
response.getOutputStream().flush();
%>


