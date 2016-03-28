<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>article</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
</head>
<body>
<%
try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String articleId = request.getParameter("id");
			String query = "SELECT TITLE,CONTENT FROM  CODEBOOK_ARTICLES WHERE ARTICLE_ID = "
					+ articleId + "";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			out.println("<center><h1>"+ title +"</h1></center>");
			out.println("<hr/>");
			out.println(content);
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
</body>
</html>
