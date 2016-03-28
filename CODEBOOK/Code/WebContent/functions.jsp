<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="com.ibm.icu.util.StringTokenizer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" language="java"
	contentType="text/html;
charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%!public String testing() {
		return "working";

	}

	public String getDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return dateFormat.format(date);
	}

	public String forgetpassword(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String email = request.getParameter("email");
			String query = "INSERT INTO CODEBOOK_FORGET_PASSWORD(EMAIL,STATUS) VALUES('"
					+ email + "',0)";
			//System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.execute();
			return "New Password will be sent to your mail";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String publishPoll(HttpServletRequest request) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			int numberOfOptions = Integer.parseInt(request
					.getParameter("option-count"));
			String pollQuestion = request.getParameter("poll-question");
			String pollOptions = "`";

			for (int count = 1; count < numberOfOptions; count++) {
				pollOptions += request.getParameter("poll-option-" + count)
						+ "`";
			}

			String pollResults = "`";

			for (int count = 1; count < numberOfOptions; count++) {
				pollResults += "0" + "`";
			}

			String query = "INSERT INTO CODEBOOK_POLLS(POLL_QUESTION,POLL_OPTIONS,POLL_RESULTS,ISLIVE) VALUES(?,?,?,?)";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, pollQuestion);
			pstmt.setString(2, pollOptions);
			pstmt.setString(3, pollResults);
			pstmt.setInt(4, 1);

			pstmt.execute();
			return "Poll Sucessfully Published";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String wordOfTheDay(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String wordOfTheDay = request.getParameter("word");
			String query = "INSERT INTO CODEBOOK_WORDOFTHEDAY(WORD_OF_THE_DAY,DATE_OF_THE_WORD) VALUES(?,?)";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, wordOfTheDay);
			pstmt.setString(2, getDate());
			pstmt.execute();
			return "Word of the Day published";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}
	
	
		public String deleteArticle(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String articleId = request.getParameter("articleId");
			String query = "DELETE FROM CODEBOOK_ARTICLES WHERE ARTICLE_ID = "+articleId;
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.execute();
			return "Article Deleted Successfully ";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}
	
	public String editarticle(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String articleId = request.getParameter("articleId");
			String content = request.getParameter("newcontent");
			String query = "UPDATE CODEBOOK_ARTICLES SET CONTENT = '"+ content + "' WHERE ARTICLE_ID = "+articleId;
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.execute();
			return "Article Edited Successfully ";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}
	
	public String validateEmail(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String email = request.getParameter("email");
			String query = "SELECT EMAIL FROM CODEBOOK_USERS WHERE EMAIL = '"+ email +"'";
			System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return "<div class='validate-error'>Email already exists</div>";
			}else{
				return "<div class='validate-success'>Available</div>";	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}
	
		public String validateRoll(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String roll = request.getParameter("roll");
			String query = "SELECT ROLL_NUMBER FROM CODEBOOK_USERS WHERE ROLL_NUMBER = '"+ roll +"'";
			System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return "<div class='validate-error'>Roll Number already exists</div>";
			}else{
				return "<div class='validate-success'>Available</div>";	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}
	
	public String postcollegeNews(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String news = request.getParameter("news");
			String query = "INSERT INTO CODEBOOK_COLLEGENEWS(NEWS,DATE) VALUES(?,?)";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, news);
			pstmt.setString(2, getDate());
			pstmt.execute();
			return "News published";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String thoughtOfTheDay(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String thoughtOfTheDay = request.getParameter("thought");
			String query = "INSERT INTO CODEBOOK_THOUGHTOFTHEDAY(THOUGHT_OF_THE_DAY,DATE_OF_THE_THOUGHT) VALUES(?,?)";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, thoughtOfTheDay);
			pstmt.setString(2, getDate());
			pstmt.execute();
			return "Word of the Day published";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String getFirstParagraph(String article) {
		int i = 0;
		String para = "";
		System.out
				.println(!(article.charAt(i) == '<'
						&& article.charAt(i + 1) == '/'
						&& article.charAt(i + 2) == 'p' && article
						.charAt(i + 3) == '>'));
		while (!(article.charAt(i) == '<' && article.charAt(i + 1) == '/'
				&& article.charAt(i + 2) == 'p' && article.charAt(i + 3) == '>')) {
			para += article.charAt(i);
			i++;
		}
		return para + "</p>";
	}

	public String getAllcomments(HttpServletRequest request, HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String articleId = request.getParameter("articleId");
			String query2 = "SELECT CODEBOOK_USERS.FIRST_NAME, CODEBOOK_USERS.LAST_NAME, CODEBOOK_COMMENTS.CONTENT, CODEBOOK_COMMENTS.DATE_OF_COMMENT,CODEBOOK_USERS.USER_ID  FROM CODEBOOK_COMMENTS AS CODEBOOK_COMMENTS, CODEBOOK_USERS AS CODEBOOK_USERS WHERE CODEBOOK_COMMENTS.USER_ID = CODEBOOK_USERS.USER_ID AND ARTICLE_ID = "
					+ articleId;
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String comments = "";
			while (rs2.next()) {
				String userCommented = rs2.getString(1) + " "
						+ rs2.getString(2);
				String comment = rs2.getString(3);
				String dateOfComment = rs2.getString(4);
				String userIdCommeneted = rs2.getString(5);
				comments += "<div style = 'background-color: #d4dae8;width: 100%;margin-top:1px;margin-left:2px' >"
						+ comment
						+ " <div>By</div> <div id='view-profile' userid='"+ userIdCommeneted +"'>" + userCommented + "</div> on " + dateOfComment;
			}
			if (comments.equals("")) {
				return "No Comments to this Article";
			} else {
				return comments;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String acceptModeratorRequest(HttpServletRequest request,
			HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String requestId = request.getParameter("requestId");
			String userId = "";
			String category = "";
			String query2 = "UPDATE CODEBOOK_ADMIN_REQUESTS SET STATUS = 1,DATE_OF_RESPONSE = '"
					+ getDate() + "' WHERE REQUEST_ID = " + requestId;
			//System.out.println(query2);
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.execute();

			String query = "SELECT * FROM CODEBOOK_ADMIN_REQUESTS WHERE REQUEST_ID ="
					+ requestId;
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				userId = rs.getString(2);
				category = rs.getString(4);
				//System.out.println(userId + "," + category);
				String query3 = "INSERT INTO CODEBOOK_MODERATORS(USER_ID,CATEGORY,IS_ACTIVE_NOW) VALUES(?,?,?)";
				//System.out.println(query3);
				PreparedStatement pstmt3 = Conn.prepareStatement(query3);

				pstmt3.setString(1, userId);
				pstmt3.setString(2, category);
				pstmt3.setInt(3, 0);

				pstmt3.execute();
			}

			return "operation success";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String rejectModeratorRequest(HttpServletRequest request,
			HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String requestId = request.getParameter("requestId");
			String query2 = "UPDATE CODEBOOK_ADMIN_REQUESTS SET STATUS = -1 WHERE REQUEST_ID = "
					+ requestId;
			//System.out.println(query2);
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.execute();
			return "operation success";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String acceptArticlerequest(HttpServletRequest request,
			HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String articleId = request.getParameter("articleId");
			String query2 = "UPDATE CODEBOOK_ARTICLES SET ISPROCESSED = 1,APPROVEDBY ="
					+ session.getAttribute("USER_ID")
					+ " WHERE ARTICLE_ID = "
					+ articleId;
			System.out.println(query2);
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.execute();
			return "operation success";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String rejectArticlerequest(HttpServletRequest request,
			HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String articleId = request.getParameter("articleId");
			String query2 = "UPDATE CODEBOOK_ARTICLES SET ISPROCESSED = -1,APPROVEDBY ="
					+ session.getAttribute("USER_ID")
					+ " WHERE ARTICLE_ID = "
					+ articleId;
			System.out.println(query2);
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.execute();
			return "operation success";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String showArticleRequest(HttpServletRequest request) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT CONTENT FROM CODEBOOK_ARTICLES WHERE ARTICLE_ID = "
					+ request.getParameter("articleId");
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String content = "";
			if (rs2.next()) {
				content = rs2.getString(1);
			}
			if (content.equals("")) {
				return "No Content";
			} else {
				return content;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String moderatorsNotificationsToAdmin() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT * FROM CODEBOOK.ADMIN_REQUESTS WHERE STATUS = 0";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String requests = "";
			while (rs2.next()) {
				String userId = rs2.getString(2);
				String dateOfRequest = rs2.getString(3);
				String subject = rs2.getString(4);
				String acceptRequest = "<input type='button' value='Accept'></input> <input type='button' value='Reject'></input>";
				requests += "<div style = 'background-color: #d4dae8;width: 100%;margin-top:1px;margin-left:2px' >"
						+ userId
						+ " Requested for Moderator Permission for subject"
						+ subject
						+ " on "
						+ dateOfRequest
						+ acceptRequest
						+ "</div>";
			}
			if (requests.equals("")) {
				return "No Requests";
			} else {
				return requests;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String sendModeratorRequest(HttpServletRequest request,
			HttpSession session) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String userID = session.getAttribute("USER_ID").toString();
			String dateOfRequest = getDate();
			String category = request.getParameter("request_subject");
			System.out.println(category);
			String query = "INSERT INTO CODEBOOK_ADMIN_REQUESTS(USER_ID,DATE_OF_REQUEST,REQUEST_SUBJECT, STATUS,DATE_OF_RESPONSE) VALUES(?,?,?,?,?)";
			System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setString(1, userID);
			pstmt.setString(2, getDate());
			pstmt.setString(3, category);
			pstmt.setInt(4, 0);
			pstmt.setString(5, dateOfRequest);

			pstmt.execute();

			return "Your Moderator Request Sent";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String updateProfile(HttpServletRequest request, HttpSession session) {
		try {

			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String firstName = request.getParameter("update_first_name");
			String lastName = request.getParameter("update_last_name");
			String updateCity = request.getParameter("update_city");
			String updatePhNO = request.getParameter("update_phno");

			String query = "UPDATE CODEBOOK_USERS SET FIRST_NAME = ?,LAST_NAME = ?,CITY = ?,PHONE_NUMBER = ? WHERE USER_ID = ?";
			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, updateCity);
			pstmt.setString(4, updatePhNO);
			pstmt.setString(5, session.getAttribute("USER_ID").toString());
			pstmt.execute();

			return "Profile Updated";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String changepassword(HttpServletRequest request, HttpSession session) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String oldPassword = request.getParameter("old_password");
			String newPassword = request.getParameter("new_password");
			String rnewPassword = request.getParameter("rnew_password");

			if (oldPassword.equals(session.getAttribute("PASSWORD"))
					&& newPassword.equals(rnewPassword)) {
				String query = "UPDATE CODEBOOK_USERS SET PASSWORD = '"
						+ newPassword + "' WHERE USER_ID = ?";
				PreparedStatement pstmt = Conn.prepareStatement(query);
				pstmt.setString(1, session.getAttribute("USER_ID").toString());
				pstmt.execute();
				return "Pasword Changed Successfully";
			} else {
				return "Pasword Not Changed";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String getreports(HttpServletRequest request){
			try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			
			String type = request.getParameter("type");
			String period = request.getParameter("period");
			String sdate = request.getParameter("sdate");
			String edate = request.getParameter("edate");			
				
			if( type.equals("User Report")){
				if( period.equals("On")){				
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_USERS WHERE DATE_OF_REG LIKE '"+ sdate +"%'";
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports = "Totals Users registered " + rs2.getString(1);
					}	
					return reports;
				}
				else{
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_USERS WHERE DATE_OF_REG BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports = "Totals Users registered " + rs2.getString(1);
					}	
					return reports;
				}	
			}
			
				
			if( type.equals("Article Report")){
				if( period.equals("On")){				
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE DATE_OF_POST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports += "Totals Articles Posted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND DATE_OF_POST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Totals Articles Accepted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = -1 AND DATE_OF_POST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Totals Articles Rejected " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 0 AND DATE_OF_POST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Articles not processed " + rs2.getString(1) + "<br/>";
					}	
					return reports;
				}
				else{
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE DATE_OF_POST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports += "Totals Articles Posted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND DATE_OF_POST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Totals Articles Accepted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = -1 AND DATE_OF_POST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Totals Articles Rejected " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 0 AND DATE_OF_POST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Articles not processed " + rs2.getString(1) + "<br/>";
					}	
					return reports;
				}	
			}
			if( type.equals("Moderator Report")){
				if( period.equals("On")){				
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE DATE_OF_REQUEST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports += "Total Moderator Requests " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 1 AND DATE_OF_REQUEST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator requested Accepted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = -1 AND DATE_OF_REQUEST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator requests Rejected " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 0 AND DATE_OF_REQUEST LIKE '"+ sdate +"%'";
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator Requests not processed " + rs2.getString(1) + "<br/>";
					}	
					return reports;
				}
				else{
					String query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE DATE_OF_REQUEST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					PreparedStatement pstmt2 = Conn.prepareStatement(query2);
					ResultSet rs2 = pstmt2.executeQuery();
					String reports = "";
					while (rs2.next()) {
						reports += "Total Moderator Requests " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 1 AND DATE_OF_REQUEST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator requested Accepted " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = -1 AND DATE_OF_REQUEST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator requests Rejected " + rs2.getString(1) + "<br/>";
					}
					query2 = "SELECT COUNT(*) FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 0 AND DATE_OF_REQUEST BETWEEN '"+ sdate +"' AND '"+ edate + "'" ;
					System.out.println(query2);
					pstmt2 = Conn.prepareStatement(query2);
					rs2 = pstmt2.executeQuery();
					while (rs2.next()) {
						reports += "Moderator Requests not processed " + rs2.getString(1) + "<br/>";
					}	
					return reports;
				}	
			}
			return "";
			
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}
	
	
	public String getArticles(HttpServletRequest request, HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			int start = Integer.parseInt(request.getParameter("start")
					.toString());
			String query = "";
			String category = request.getParameter("category");
			if (category.equals("all")) {
				if (start == 0) {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				} else {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND ARTICLE_ID < "
							+ start
							+ " ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				}
				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY ARTICLE_ID DESC) AS rowNum FROM CODEBOOK_ARTICLES) AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
			} else if (category.equals("mt")) {
				if (start == 0) {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 ORDER BY TICKS DESC FETCH FIRST 10 ROWS ONLY";
				} else {
					String query4 = "SELECT TICKS FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND ARTICLE_ID = "
							+ start;
					//System.out.println(query4);
					PreparedStatement pstmt4 = Conn.prepareStatement(query4);
					ResultSet rs4 = pstmt4.executeQuery();
					rs4.next();
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND TICKS < "
							+ rs4.getString(1)
							+ " ORDER BY TICKS DESC FETCH FIRST 10 ROWS ONLY";
				}
				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY TICKS DESC) AS rowNum FROM CODEBOOK_ARTICLES) AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
			}else if (category.equals("md")) {
				if (start == 0) {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 ORDER BY NUMBER_OF_DOWNLOADS DESC FETCH FIRST 10 ROWS ONLY";
				} else {
					String query4 = "SELECT NUMBER_OF_DOWNLOADS FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND ARTICLE_ID = "
							+ start;
					PreparedStatement pstmt4 = Conn.prepareStatement(query4);
					ResultSet rs4 = pstmt4.executeQuery();
					rs4.next();
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND NUMBER_OF_DOWNLOADS < "
							+ rs4.getString(1)
							+ " ORDER BY NUMBER_OF_DOWNLOADS DESC FETCH FIRST 10 ROWS ONLY";
				}
				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY TICKS DESC) AS rowNum FROM CODEBOOK_ARTICLES) AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
			} else if (category.equals("myArticles")) {
				String userId = session.getAttribute("USER_ID").toString();
				if (start == 0) {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND USERID ="
							+ userId
							+ " ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				} else {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND ARTICLE_ID < "
							+ start
							+ " AND USERID = "
							+ userId
							+ " ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				}

				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY ARTICLE_ID DESC) AS rowNum FROM CODEBOOK_ARTICLES WHERE USERID = "+ userId +" ) AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
			}else if (category.equals("searchArticle")) {
					String keyword = request.getParameter("keyword");
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND LOWER(CONTENT) LIKE '%"+ keyword.toLowerCase() +"%' OR LOWER(TITLE) LIKE '%"+ keyword.toLowerCase() +"%' FETCH FIRST 10 ROWS ONLY";
					System.out.println("Search articles " + query);
				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY ARTICLE_ID DESC) AS rowNum FROM CODEBOOK_ARTICLES WHERE USERID = "+ userId +" ) AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
			}else {
				//query = "SELECT * FROM ( SELECT ARTICLE_ID,USERID,CONTENT,DATE_OF_POST,APPROVEDBY,NOOFCOMMENTS,CATEGORY,NUMBER_OF_DOWNLOADS,TITLE,ISPROCESSED,TICKS, ROW_NUMBER() OVER (ORDER BY ARTICLE_ID DESC) AS rowNum FROM CODEBOOK_ARTICLES WHERE CATEGORY = '"+ category +"') AS x WHERE rowNum BETWEEN "+ start +" AND "+ end;
				if (start == 0) {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED =1 AND CATEGORY = '"
							+ category
							+ "' ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				} else {
					query = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 1 AND ARTICLE_ID < "
							+ start
							+ " AND CATEGORY = '"
							+ category
							+ "' ORDER BY ARTICLE_ID DESC FETCH FIRST 10 ROWS ONLY";
				}
				System.out.println(" Get Articles "+query);
			}
			//System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			String articleList = new String("");
			int articleCount = 0;
			while (rs.next()) {
				String articleId = rs.getString(1);
				String userId = rs.getString(2);
				String content = rs.getString(3);
				String dateOfPost = rs.getString(4);
				//	int approvedBy = rs.getInt(5);
				int noOfComments = rs.getInt(6);
				String articleCategory = rs.getString(7);
				int numberOfDownloads = rs.getInt(8);
				String title = rs.getString(9);
				//	int isProcessed = rs.getInt(10); 
				int ticks = rs.getInt(11);
				String imageURL = "images/" + articleCategory.toLowerCase()
						+ ".jpg";

				String query3 = "SELECT COUNT(*) FROM CODEBOOK_COMMENTS WHERE ARTICLE_ID ='"
						+ articleId + "'";
				PreparedStatement pstmt3 = Conn.prepareStatement(query3);
				ResultSet rs3 = pstmt3.executeQuery();
				if (rs3.next()) {
					noOfComments = rs3.getInt(1);
				}

				//String query2 = "SELECT CODEBOOK_COMMENTS.COMMENT_ID, CODEBOOK_COMMENTS.ARTICLE_ID, CODEBOOK_COMMENTS.DATE_OF_COMMENT, CODEBOOK_COMMENTS.CONTENT, CODEBOOK_COMMENTS.USER_ID, CODEBOOK_USERS.FIRST_NAME, CODEBOOK_USERS.LAST_NAME FROM CODEBOOK_COMMENTS AS CODEBOOK_COMMENTS, CODEBOOK_USERS AS CODEBOOK_USERS WHERE CODEBOOK_COMMENTS.USER_ID = CODEBOOK_USERS.USER_ID AND ARTICLE_ID = "+ articleId;				
				//System.out.println(comments);

				String query1 = "SELECT * FROM CODEBOOK_USERS WHERE USER_ID = '"
						+ userId + "'";

				PreparedStatement pstmt1 = Conn.prepareStatement(query1);
				ResultSet rs1 = pstmt1.executeQuery();
				String userName = "anonymous";
				if (rs1.next()) {
					userName = rs1.getString(2) + " " + rs1.getString(3);
				}

				articleList += "<div class=article-holder id='" + articleId
						+ "' style='padding:10px;margin-top:5px'>";
				articleList += "<img class='article-view-typeimage' src='"
						+ imageURL + "' type='" + articleCategory + "'></img>";
				articleList += "<div class='article-view-titlecontent'>";
				
				if (category.equals("searchArticle")){
				String keyword = request.getParameter("keyword");
					title = title.replaceAll("(?i)"+keyword,"<b>"+keyword+"</b>");
				}else{
					title = title + "";
				}
				articleList += "<div class='article-view-title'><div><div id='title-name' style='color:green;padding-right:5px'>" + title
						+ "</div> <div id='published-by-data'> published by</div> </div><div id='view-profile' userid='"+ userId +"'>" + userName + "</div>, " + dateOfPost
						+ "</div>";
				articleList += "<div class='article-view-content' id='article-view-content-"
						+ articleId + "' article='" + articleId + "'>";
				if (category.equals("searchArticle")){
				String keyword = request.getParameter("keyword");
				articleList += getFirstParagraph(content).replaceAll("(?i)"+keyword,"<b>"+keyword+"</b>");
				}else{
					articleList += getFirstParagraph(content);
				}
				articleList += "</div>";
				articleList += "<div class = 'see-more' article = '"
						+ articleId
						+ "' id='see-more-"
						+ articleId
						+ "' style='padding-left:10px;color:blue'>See More</div>";
				articleList += "<div class='options-pane'>";
				if (session.getAttribute("session_status") != null) {
					if(category.equals("myArticles")){
							articleList += "<div class='edit' " 
							+ "article='" + articleId + "'><img class='tickicon' src='images/tickicon.jpg'/> Edit "
							+ "</div><div class='delete' "
							+ " article='" + articleId
							+ "'><img class='commenticon' src='images/commenticon.jpg'/> Delete "
							+ "</div>";
					}
					else{
					articleList += "<div class='tick' count='" + ticks
							+ "' article='" + articleId + "'><img class='tickicon' src='images/tickicon.jpg'/> Tick " + ticks
							+ "</div><div class='comment' count = '"
							+ noOfComments + "' article='" + articleId
							+ "'><img class='commenticon' src='images/commenticon.jpg'/> Comment " + noOfComments
							+ "</div><div class='download' count= '"
							+ numberOfDownloads + "' article='" + articleId
							+ "'><img class='downloadicon' src='images/downloadicon.jpg'/> Download " + numberOfDownloads
							+ "</div> <div class='book-look' article='"
							+ articleId + "'><img class='booklookicon' src='images/booklookicon.jpg'/> BookLook </div> "
							+"<div class='simplelook' article='"
							+ articleId + "'><img class='simplelookicon' src='images/simplelookicon.jpg'/> SimpleLook </div>";
						}
				} else {
					articleList += "<div class='nontick' count='" + ticks
							+ "' article='" + articleId + "'><img class='tickicon' src='images/tickicon.jpg'/> Tick " + ticks
							+ "</div><div class='noncomment' count = '"
							+ noOfComments + "' article='" + articleId
							+ "'><img class='commenticon' src='images/commenticon.jpg'/> Comment " + noOfComments
							+ "</div><div class='download' count= '"
							+ numberOfDownloads + "' article='" + articleId
							+ "'><img class='downloadicon' src='images/downloadicon.jpg'/> Download " + numberOfDownloads
							+ "</div> <div class='book-look' article='"
							+ articleId + "'><img class='booklookicon' src='images/booklookicon.jpg'/> BookLook </div>"
							+"<div class='simplelook' article='"
							+ articleId + "'><img class='simplelookicon' src='images/simplelookicon.jpg'/> SimpleLook </div>";;
				}
				articleList += "</div>";
				articleList += "<div class='comments-heading' article='"
						+ articleId + "'> Comments</div>";
				articleList += "<div class='comments-pane' id='comments-"
						+ articleId + "' ></div>";
				articleList += "</div>";
				articleList += "</div>";
				articleCount++;
			}
			// sample template of the article

			//<div class=article-holder' id='1000'>
			//	<img class='article-view-typeimage' src='images/ci.jpg'></img>
			//	<div class='article-view-titlecontent'>
			//		<div class='article-view-title'>Article Title published by Mahesh Siyyadri</div>
			//		<div class='article-view-content'>
			//			sd fsdkl j;klfjdi gfdi sjk ;lgj;dkfsl jgkl jdfskljg kd jgkdjfkgljdfs jgkfdjg kds;jff kgljdsfklg jklsd jgklsfdjg ir gre kglj kfld jkjsd; gjkfdssk;fdl g;jksdf ;gkl;djsfgoirtyu rt unmb bbsdf kjlhg hdsj kghsjlkgh kjlhgsjklghsjdlkfghjdsfhgjdsk jksdhglkshglksjdghjklhldfsjghfjdghlsjk hsj bnvbcnvbfdsjhgjhfdlghsl hsj mbcn,bkjds ghsjsfhd gjk hdsf jkghsfdk hglkjds ljk lhsdkfjghlsdkj hgsl gjhj hfdjklknvdkfjghlk kfdjghljkfdhg jkdsghfljkdghjk fkjsghjksd
			//		</div>
			//		<div class='options-pane'>
			//			<div class='tick'>Tick 100</div><div class='comment'> Comment 35</div><div class='download'> Download 20</div> 
			//		</div>
			//		<div class='comments-pane'>All the comments will appear here </div>
			//	</div>
			//</div>
			//System.out.println(articleList);
			//String articles = "<div class=article-holder' id='1000'><img class='article-view-typeimage' src='images/ci.jpg'></img><div class='article-view-titlecontent'><div class='article-view-title'>Article Title published by Mahesh Siyyadri</div><div class='article-view-content'>sd fsdkl j;klfjdi gfdi sjk ;lgj;dkfsl jgkl jdfskljg kd jgkdjfkgljdfs jgkfdjg kds;jff kgljdsfklg jklsd jgklsfdjg ir gre kglj kfld jkjsd; gjkfdssk;fdl g;jksdf ;gkl;djsfgoirtyu rt unmb bbsdf kjlhg hdsj kghsjlkgh kjlhgsjklghsjdlkfghjdsfhgjdsk jksdhglkshglksjdghjklhldfsjghfjdghlsjk hsj bnvbcnvbfdsjhgjhfdlghsl hsj mbcn,bkjds ghsjsfhd gjk hdsf jkghsfdk hglkjds ljk lhsdkfjghlsdkj hgsl gjhj hfdjklknvdkfjghlk kfdjghljkfdhg jkdsghfljkdghjk fkjsghjksd</div><div class='options-pane'><div class='tick'>Tick 100</div><div class='comment'> Comment 35</div><div class='download'> Download 20</div> </div><div class='comments-pane'>All the comments will appear here </div></div></div>";
			if (articleList.equals("")) {
				articleList = "<div id='no-more-articles' style='background-color: #3b5998;width:100%;height:30px;padding:0px;font-size: 15px;color: white;'>No More articles in this category</div>";
			} else if (articleCount < 10) {
				articleList += "<div id='no-more-articles' style='background-color: #3b5998;width:100%;height:30px;padding:0px;font-size: 15px;color: white;'>No More articles in this category</div>";
			}
			return articleList;
		} catch (Exception e) {
			e.printStackTrace();
			//return e.toString();
			return "<div id='no-more-articles' style='background-color: #3b5998;width:100%;height:30px;padding:0px;font-size: 15px;color: white;'>No More articles in this category</div>";
		}
	}

	public String seeMore(HttpServletRequest request, HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String articleId = request.getParameter("articleId");
			String query = "SELECT CONTENT FROM CODEBOOK_ARTICLES WHERE ARTICLE_ID = "
					+ articleId + "";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String content = rs.getString("CONTENT");
			return content;
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}
	
	public String viewProfile(HttpServletRequest request, HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String userId = request.getParameter("userId");
			String query = "SELECT * FROM CODEBOOK_USERS WHERE USER_ID = "
					+ userId + "";
			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String name = rs.getString(2) + " " + rs.getString(3);
			String email = rs.getString(4);
			String college = rs.getString(5);
			String city = rs.getString(6);
			String dob = rs.getString(8);
			String phno = rs.getString(10);
			String rollno = rs.getString(11);
			String branch = rs.getString(12);
			
			String profile = "<div class='heading'>Profile Info</div>";
			profile += "Name: " +  name + "<br/>";
			profile += "Email: " + email + "<br/>";
			profile += "College: " + college + "<br/>";
			profile += "City: " + city + "<br/>";
			profile += "D.O.B: " + dob + "<br/>";
			profile += "Phone: " + phno + "<br/>";
			profile += "Roll: " + rollno + "<br/>";
			profile += "Branch: " + branch + "<br/>";
			 
			if(profile.equals("")){
				return "Profile Not Available";
			} else{
				return profile;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String tickArticle(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "UPDATE CODEBOOK_ARTICLES SET TICKS = TICKS + 1 WHERE ARTICLE_ID = ?";
			String query2 = "SELECT TICKS FROM CODEBOOK_ARTICLES WHERE ARTICLE_ID = ?";
			String articleId = request.getParameter("articleId");

			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, articleId);
			pstmt.execute();

			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.setString(1, articleId);
			ResultSet rs = pstmt2.executeQuery();
			String tickUpdate = "Tick 0";
			if (rs.next()) {
				tickUpdate = "<img class='tickicon' src='images/tickicon.jpg'/> Tick " + rs.getString(1);
			}
			//System.out.println("returning value " + tickUpdate);
			return tickUpdate;
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}
	
		public String downloadArticle(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "UPDATE CODEBOOK_ARTICLES SET NUMBER_OF_DOWNLOADS = NUMBER_OF_DOWNLOADS + 1 WHERE ARTICLE_ID = ?";
			String query2 = "SELECT NUMBER_OF_DOWNLOADS FROM CODEBOOK_ARTICLES WHERE ARTICLE_ID = ?";
			String articleId = request.getParameter("articleId");

			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.setString(1, articleId);
			pstmt.execute();

			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			pstmt2.setString(1, articleId);
			ResultSet rs = pstmt2.executeQuery();
			String tickUpdate = "Download 0";
			if (rs.next()) {
				tickUpdate = "Download " + rs.getString(1);
			}
			//System.out.println("returning value " + tickUpdate);
			return tickUpdate;
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String votepoll(HttpServletRequest request) {
		try {
			//	System.out.println("in tick update function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			int pollOption = Integer.parseInt(request
					.getParameter("pollOption"));
			String pollId = request.getParameter("pollId");
			String query2 = "SELECT * FROM CODEBOOK_POLLS WHERE POLL_ID = "
					+ pollId;
			System.out.println(query2);		
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			int optionCount = 0;
			String currentOption = "";
			int currentVotes = 0;
			String toInsert = "`";
			int votes = 0;
			if (rs2.next()) {
				StringTokenizer st = new StringTokenizer(rs2.getString(3), "`");
				StringTokenizer st2 = new StringTokenizer(rs2.getString(4), "`");
				System.out.println(st.countTokens() + "---" + st2.countTokens());
				int totalTokens = st.countTokens();
				for(int count = 1;count <= totalTokens;count++){
					votes = Integer.parseInt(st2.nextToken());
					if (pollOption == count) {
						votes++;
						currentOption = st.nextToken();
						currentVotes = votes;
					}else{
						st.nextToken();
					}
					toInsert += votes + "`";
					optionCount++;
					System.out.println("toInsert "+toInsert);
				}
			}
			System.out.println("toInsert End "+toInsert);
			String query = "UPDATE CODEBOOK_POLLS SET POLL_RESULTS = '"+ toInsert +"' WHERE POLL_ID = "+ pollId;
			System.out.println(query);
			PreparedStatement pstmt = Conn.prepareStatement(query);
			pstmt.execute();
			
			System.out.println(currentOption + " "+ votes);
			return currentOption + " ("+ currentVotes + ")";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}

	}

	public String getAllCategoryArticles() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "SELECT * FROM CODEBOOK_ARTICLES ORDER BY ARTICLE_ID DESC";

			PreparedStatement pstmt = Conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			String articleList = "";
			while (rs.next()) {
				String articleId = rs.getString(1);
				String userId = rs.getString(2);
				String content = rs.getString(3);
				String dateOfPost = rs.getString(4);
				//	int approvedBy = rs.getInt(5);
				int noOfComments = rs.getInt(6);
				//	String category = rs.getString(7);
				int numberOfDownloads = rs.getInt(8);
				String title = rs.getString(9);
				//	int isProcessed = rs.getInt(10); 
				int ticks = rs.getInt(11);
				String query1 = "SELECT * FROM CODEBOOK_USERS WHERE USER_ID = '"
						+ userId + "'";

				PreparedStatement pstmt1 = Conn.prepareStatement(query1);
				ResultSet rs1 = pstmt1.executeQuery();
				String userName = "anonymous";
				if (rs1.next()) {
					userName = rs1.getString(2) + " " + rs1.getString(3);
				}
				articleList += "<div class=article-holder' id='" + articleId
						+ "' style='padding:10px;margin-top:5px'>";
				articleList += "<img class='article-view-typeimage' src='images/ci.jpg'></img>";
				articleList += "<div class='article-view-titlecontent'>";
				articleList += "<div class='article-view-title'>" + title
						+ " published by " + userName + " on " + dateOfPost
						+ "</div>";
				articleList += "<div class='article-view-content'>";
				articleList += content;
				articleList += "</div>";
				articleList += "<div class='options-pane'>";
				articleList += "<div class='tick' article='" + articleId
						+ "'>Tick " + ticks
						+ "</div> . <div class='comment' article='" + articleId
						+ "'> Comment " + noOfComments
						+ "</div> . <div class='download' article='"
						+ articleId + "'> Download " + numberOfDownloads
						+ "</div>. <div class='book-look' article='"
						+ articleId + "'> BookLook</div>";
				articleList += "</div>";
				articleList += "<div class='comments-pane' id='comments-"
						+ articleId
						+ "' >All the comments will appear here </div>";
				articleList += "</div>";
				articleList += "</div>";
			}
			// sample template of the article

			//<div class=article-holder' id='1000'>
			//	<img class='article-view-typeimage' src='images/ci.jpg'></img>
			//	<div class='article-view-titlecontent'>
			//		<div class='article-view-title'>Article Title published by Mahesh Siyyadri</div>
			//		<div class='article-view-content'>
			//			sd fsdkl j;klfjdi gfdi sjk ;lgj;dkfsl jgkl jdfskljg kd jgkdjfkgljdfs jgkfdjg kds;jff kgljdsfklg jklsd jgklsfdjg ir gre kglj kfld jkjsd; gjkfdssk;fdl g;jksdf ;gkl;djsfgoirtyu rt unmb bbsdf kjlhg hdsj kghsjlkgh kjlhgsjklghsjdlkfghjdsfhgjdsk jksdhglkshglksjdghjklhldfsjghfjdghlsjk hsj bnvbcnvbfdsjhgjhfdlghsl hsj mbcn,bkjds ghsjsfhd gjk hdsf jkghsfdk hglkjds ljk lhsdkfjghlsdkj hgsl gjhj hfdjklknvdkfjghlk kfdjghljkfdhg jkdsghfljkdghjk fkjsghjksd
			//		</div>
			//		<div class='options-pane'>
			//			<div class='tick'>Tick 100</div><div class='comment'> Comment 35</div><div class='download'> Download 20</div> 
			//		</div>
			//		<div class='comments-pane'>All the comments will appear here </div>
			//	</div>
			//</div>
			//System.out.println(articleList);
			//String articles = "<div class=article-holder' id='1000'><img class='article-view-typeimage' src='images/ci.jpg'></img><div class='article-view-titlecontent'><div class='article-view-title'>Article Title published by Mahesh Siyyadri</div><div class='article-view-content'>sd fsdkl j;klfjdi gfdi sjk ;lgj;dkfsl jgkl jdfskljg kd jgkdjfkgljdfs jgkfdjg kds;jff kgljdsfklg jklsd jgklsfdjg ir gre kglj kfld jkjsd; gjkfdssk;fdl g;jksdf ;gkl;djsfgoirtyu rt unmb bbsdf kjlhg hdsj kghsjlkgh kjlhgsjklghsjdlkfghjdsfhgjdsk jksdhglkshglksjdghjklhldfsjghfjdghlsjk hsj bnvbcnvbfdsjhgjhfdlghsl hsj mbcn,bkjds ghsjsfhd gjk hdsf jkghsfdk hglkjds ljk lhsdkfjghlsdkj hgsl gjhj hfdjklknvdkfjghlk kfdjghljkfdhg jkdsghfljkdghjk fkjsghjksd</div><div class='options-pane'><div class='tick'>Tick 100</div><div class='comment'> Comment 35</div><div class='download'> Download 20</div> </div><div class='comments-pane'>All the comments will appear here </div></div></div>";
			return articleList;
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String postArticle(HttpServletRequest request, HttpSession session) {

		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "INSERT INTO CODEBOOK_ARTICLES(USERID, CONTENT, DATE_OF_POST, APPROVEDBY, NOOFCOMMENTS, CATEGORY, NUMBER_OF_DOWNLOADS, TITLE, ISPROCESSED) VALUES(?,?,?,?,?,?,?,?,?)";

			String userID = session.getAttribute("USER_ID").toString();
			String content = request.getParameter("article_content");
			String dateOfPost = getDate();
			String approvedBy = "0";
			String title = request.getParameter("article_title");
			String category = request.getParameter("article_type");

			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setString(1, userID);
			pstmt.setString(2, content);
			pstmt.setString(3, dateOfPost);
			pstmt.setString(4, approvedBy);
			pstmt.setInt(5, 0);
			pstmt.setString(6, category);
			pstmt.setInt(7, 0);
			pstmt.setString(8, title);
			pstmt.setInt(9, 0);

			pstmt.execute();

			return "Article posted Sucessfully";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String postComment(HttpServletRequest request, HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "INSERT INTO CODEBOOK_COMMENTS(ARTICLE_ID, DATE_OF_COMMENT,CONTENT,USER_ID) VALUES(?,?,?,?)";

			int articleID = Integer.parseInt(request.getParameter(
					"commentfor_article").toString());
			String dateOfPost = getDate();
			String content = request.getParameter("comment_content");
			int userID = Integer.parseInt(session.getAttribute("USER_ID")
					.toString());

			//System.out.println(articleID +","+dateOfPost + ","+content + ","+userID);
			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setInt(1, articleID);
			pstmt.setString(2, dateOfPost);
			pstmt.setString(3, content);
			pstmt.setInt(4, userID);

			pstmt.execute();

			return "Commented Sucessfully";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String SignUp(HttpServletRequest request) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "INSERT INTO CODEBOOK_USERS(FIRST_NAME, LAST_NAME, EMAIL, COLLEGE, CITY, COUNTRY, DATEOFBIRTH, PASSWORD, PHONE_NUMBER, ROLL_NUMBER, BRANCH, DATE_OF_REG, GENDER, USER_TYPE) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			String first_name = request.getParameter("first_name");
			String last_name = request.getParameter("last_name");
			String email = request.getParameter("email");
			String college = request.getParameter("college");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String dateofbirth = request.getParameter("dob");
			String password = "123456";
			String phno = request.getParameter("phno");
			String rollno = request.getParameter("rollno");
			String branch = request.getParameter("branch");
			String dateofreg = getDate();
			String gender = request.getParameter("gender");
			String role = request.getParameter("role");

			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setString(1, first_name);
			pstmt.setString(2, last_name);
			pstmt.setString(3, email);
			pstmt.setString(4, college);
			pstmt.setString(5, city);
			pstmt.setString(6, country);
			pstmt.setString(7, dateofbirth);
			pstmt.setString(8, password);
			pstmt.setString(9, phno);
			pstmt.setString(10, rollno);
			pstmt.setString(11, branch);
			pstmt.setString(12, dateofreg);
			pstmt.setString(13, gender);
			pstmt.setString(14, role);

			pstmt.execute();

			return "hope data inserted ";
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String signIn(HttpServletRequest request, HttpSession session) {
		try {
			//System.out.println("in the sign in function");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query = "SELECT * FROM CODEBOOK_USERS WHERE EMAIL = ? AND PASSWORD = ?";

			String login_email = request.getParameter("login-email");
			String login_password = request.getParameter("login-password");

			PreparedStatement pstmt = Conn.prepareStatement(query);

			pstmt.setString(1, login_email);
			pstmt.setString(2, login_password);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				//System.out.println("there is a user");
				session.setAttribute("session_status", "exist");
				session.setAttribute("USER_ID", rs.getString(1));
				session.setAttribute("FIRST_NAME", rs.getString(2));
				session.setAttribute("LAST_NAME", rs.getString(3));
				session.setAttribute("EMAIL", rs.getString(4));
				session.setAttribute("COLLEGE", rs.getString(5));
				session.setAttribute("CITY", rs.getString(6));
				session.setAttribute("COUNTRY", rs.getString(7));
				session.setAttribute("DATEOFBIRTH", rs.getString(8));
				session.setAttribute("PASSWORD", rs.getString(9));
				session.setAttribute("PHONE_NUMBER", rs.getString(10));
				session.setAttribute("ROLL_NUMBER", rs.getString(11));
				session.setAttribute("BRANCH", rs.getString(12));
				session.setAttribute("DATE_OF_REG", rs.getString(13));
				session.setAttribute("GENDER", rs.getString(14));
				session.setAttribute("USER_TYPE", rs.getString(15));

				return "Welcome " + session.getAttribute("FIRST_NAME") + " "
						+ session.getAttribute("LAST_NAME");

			} else {
				session.setAttribute("auth_error", "true");
				return "";
			}

		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String signOut(HttpServletRequest request, HttpSession session) {
		session.removeAttribute("session_status");
		session.removeAttribute("USER_ID");
		session.removeAttribute("FIRST_NAME");
		session.removeAttribute("LAST_NAME");
		session.removeAttribute("EMAIL");
		session.removeAttribute("COLLEGE");
		session.removeAttribute("CITY");
		session.removeAttribute("COUNTRY");
		session.removeAttribute("DATEOFBIRTH");
		session.removeAttribute("PASSWORD");
		session.removeAttribute("PHONE_NUMBER");
		session.removeAttribute("ROLL_NUMBER");
		session.removeAttribute("BRANCH");
		session.removeAttribute("DATE_OF_REG");
		session.removeAttribute("GENDER");
		session.removeAttribute("USER_TYPE");
		session.invalidate();
		return "SignOut";
	}%>
