<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<jsp:include page="functions.jsp" flush="false"></jsp:include>
<%@page import="com.ibm.icu.util.StringTokenizer"%>
<html>
<head>
<title>iBook - Tribute to Steve Jobs</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Application Developer">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/code.css" type="text/css">
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="tiny_mce/jquery.tinymce.js"></script>
<script type="text/javascript" src="jsfunctions.js" charset="UTF-8"></script>
<script src="booklet/jquery-ui-1.8.9.custom.min.js"
	type="text/javascript"></script>
<script src="booklet/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="booklet/jquery.booklet.1.2.0.min.js" type="text/javascript"></script>
<link href="booklet/jquery.booklet.1.2.0.css" type="text/css"
	rel="stylesheet" media="screen, projection, tv" />
</head>
<body>
<div id="wrapper">
<div id="header">
<div id="heading-holder">
<div id="logo" 
	style="margin-left:70px;margin-top:20px;font-size: 40px;color: white;float: left; ">iBook
<div id='t2s' style='font-size: 10px;float: right;padding-right: 85px;'>t2s</div>
</div>
<div id="login-status">
<div id="before-login">
<div style="float: left;"><div id="email-lab">Email:</div>
<div><input id="login-email" type="text" size=20 value=""
	name="login-email" /></div>
</div>
<div style="float: left;margin-left:20px "><div id="password-lab">Password:</div>
<div><input id="login-password" type="password" size=20 value=""
	name="login-password" /></div>
<div id="forget-password" style="margin: 1px">Forget password</div>
</div>
<div style="float: left;margin-left:20px ">
<div><input id="signin" type="button" name="signin" value="SignIn"></input></div>
</div>
<div style="float: left;margin-left:20px ">
<div id="signup-div"><input id="signup" type="button"
	name="signup" value="SignUp"></input></div>
</div>
</div>
<div id="after-login" style="display: none;">
<div id="welcome-status" style="float: left;padding-left:250px">Welcome User!!!</div>
<div style="float: left;margin-left:20px ">
<div><input id="signout" type="button" name="signout"
	value="SignOut"></input></div>
</div>
</div>
</div>
</div>
	<div id="lang" style="float:right">
		<select id="language">
			<option value="1">English</option>
			<option value="2">తెలుగు</option>
		</select>
	</div>
</div>
<div id="content">
<div id="content-left">
<ul id="css_vertical_menu">
	<li id="all" class="vmenu vactive" name="all"><img class="image-icon" src='images/all.jpg'></img>  All</li>
	<li id="cs" class="vmenu" name="CSIT"><img class="image-icon" src='images/cs.jpg'></img> Computer Science</li>
	<li id="ec" class="vmenu" name="ECE"><img class="image-icon" src='images/ec.jpg'></img> Electronics</li>
	<li id="ee" class="vmenu" name="EEE"><img class="image-icon" src='images/ee.jpg'></img> Electrical</li>
	<li id="me" class="vmenu" name="MECH"><img class="image-icon" src='images/me.jpg'></img> Mechanical</li>
	<li id="ci" class="vmenu" name="CIVIL"><img class="image-icon" src='images/ci.jpg'></img> Civil</li>
	<li id="ch" class="vmenu" name="CHEM"><img class="image-icon" src='images/ch.jpg'></img> Chemical</li>
	<li id="ca" class="vmenu" name="CURRENTAFFAIRS"><img class="image-icon" src='images/ca.jpg'></img> Current Affairs</li>
	<li id="gk" class="vmenu" name="GK"><img class="image-icon" src='images/gk.jpg'></img> General Knowledge</li>
	<li id="sp" class="vmenu" name="SPORTS"><img class="image-icon" src='images/sp.jpg'></img> Sports</li>
	<li id="ms" class="vmenu" name="MANAGEMENT"><img class="image-icon" src='images/ms.jpg'></img> Management Studies</li>
	<li id="cl" class="vmenu" name="CULTURALS"><img class="image-icon" src='images/cl.jpg'></img> Culturals</li>
	<li id="ot" class="vmenu" name="OTHERS"><img class="image-icon" src='images/ot.jpg'></img> Others</li>
	<li id="mt" class="vmenu" name="mt"><img class="image-icon" src='images/tick.jpg'></img> Most Ticked</li>
	<li id="md" class="vmenu" name="md"><img class="image-icon" src='images/dw.jpg'></img> Most Downloaded</li>
</ul>
<hr/>
<div>
<div id='search-article-heading'>Search article:</div><img class='searchicon' src='images/searchicon.jpg'></img> <input id="keyword" type="text" size=30 ></input>
<input id="search-article" type="button" name="Search" value="Search"></input>
</div>
</div>
<div id="content-main">
<ul id="css_horizontal_menu" style="display: none;padding-left: 10px">
	<li class="hmenu hactive" name="va" id="va">View Articles</li>
	<li class="hmenu" name="ca" id="ca">Create Article</li>
	<li class="hmenu" name="ma" id="ma">My Articles</li>
	<li class="hmenu" name="ms" id="ms">My Settings</li>
	<li class="hmenu" name="mo" id="mo" style='display:none'>Moderator</li>
	<li class="hmenu" name="ad" id="ad" style='display:none'>Admin</li>
	<li class="hmenu" name="st" id="st" style='display:none'>Stats</li>
</ul>
<div id="singup-form" style="display: none;padding: 30px">
<div class="heading">Register by filling the below information</div>
<table>
	<tr>
		<td>First Name:</td>
		<td><input id="first_name" type="text" size=30 value=""
			name="first_name" /></td>
		<td><div id='val_fn'></div></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input id="last_name" type="text" size=30 value=""
			name="last_name" /></td>
		<td><div id='val_ln'></div></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input id="email" type="text" size=30 value="" name="email" /></td>
		<td><div id='val_email'></div></td>	
	</tr>
	<tr>
		<td>College:</td>
		<td><input id="college" type="text" size=30 value=""
			name="college" /></td>
		<td><div id='val_college'></div></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input id="city" type="text" size=30 value="" name="city" /></td>
		<td><div id='val_city'></div></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><input id="country" type="text" size=30 value=""
			name="country" /></td>
		<td><div id='val_country'></div></td>
	</tr>
	<tr>
		<td>Date of Birth:</td>
		<td><input id="dob" type="text" size=30 value="" name="dob" /></td>
		<td><div id='val_dob'></div></td>
	</tr>
	<tr>
		<td>Phone Number:</td>
		<td><input id="phno" type="text" size=30 value="" name="phno" /></td>
		<td><div id='val_phno'></div></td>
	</tr>
	<tr>
		<td>Roll Number:</td>
		<td><input id="rollno" type="text" size=30 value="" name="rollno" /></td>
		<td><div id='val_rollno'></div></td>
	</tr>
	<tr>
		<td>Branch:</td>
		<td><input id="branch" type="text" size=30 value="" name="branch" /></td>
		<td><div id='val_branch'></div></td>
	</tr>
	<tr>
		<td>Gender:</td>
		<td><select id="gender">
			<option value="1">Male</option>
			<option value="2">Female</option>
		</select></td>
	</tr>
	<tr>
		<td>Role:</td>
		<td><select id="role">
			<option value="1">Student</option>
			<option value="2">Faculty</option>
			<option value="2">Alumni</option>
		</select></td>
	</tr>
</table>
<input id="signup-save" type="button" name="signup" value="Sign Up"
	style="align:center"></input> <input id="signup-cancel" type="button"
	name="cancel" value="Cancel" style="align:center"></input></div>
<div id="article-area" style="display: block;"></div>
<div id="create-article-area" style="display: none;padding-left: 10px"><input
	id="create-article-button" type="button" value="Create Article" /></div>
<div id="my-article-area" style="display: none;padding-left: 10px"></div>
<div id="my-settings-area" style="display: none;padding-left: 10px">
<div class="heading">Password Settings</div>
<table id="change-password">
	<tr>
		<td>Old Password</td>
		<td><input id="change-pwd-oldpwd" type="password" size="20" /></td>
	</tr>
	<tr>
		<td>New Password</td>
		<td><input id="change-pwd-newpwd" type="password" size="20" /></td>
	</tr>
	<tr>
		<td>Repeat New Password</td>
		<td><input id="change-pwd-rnewpwd" type="password" size="20" /></td>
	</tr>
</table>
<input id="chage-password-commit" type="button" value="Change Password" />
<div class="heading">Update My-Profile</div>
<table>
	<tr>
		<td>First Name:</td>
		<td><input id="update_first_name" type="text" size=30 value=""
			name="first_name" /></td>
	</tr>
	<tr>
		<td>Last Name:</td>
		<td><input id="update_last_name" type="text" size=30 value=""
			name="last_name" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input id="update_city" type="text" size=30 value=""
			name="city" /></td>
	</tr>
	<tr>
		<td>Phone Number:</td>
		<td><input id="update_phno" type="text" size=30 value=""
			name="phno" /></td>
	</tr>
</table>
<input id="update-profile-info" type="button" name="signup"
	value="Update" style="align:center"></input>

<div class="heading">Moderator Settings</div>
<%
			if (session.getAttribute("USER_ID") != null
			&& isModerator(Integer.parseInt(session.getAttribute(
			"USER_ID").toString()))) {
%>
<div>Moderator Permission Granted</div>
<%
			} else if (session.getAttribute("USER_ID") != null
			&& isModeratorRequestSent(Integer.parseInt(session
			.getAttribute("USER_ID").toString()))) {
%>
<div>Moderator Request has been sent</div>
<%
			} else if (session.getAttribute("USER_ID") != null
			&& Integer.parseInt(session.getAttribute("USER_ID")
			.toString()) != 1026) {
%>
<div>
<div style="padding-top: 5px;">Subject: <select
	id="request-subject">
	<option value="1">CSIT</option>
	<option value="2">ECE</option>
	<option value="3">EEE</option>
	<option value="4">MECH</option>
	<option value="5">CIVIL</option>
	<option value="6">CHEM</option>
	<option value="7">CURRENTAFFAIRS</option>
	<option value="8">GK</option>
	<option value="9">SPORTS</option>
	<option value="1">MANAGEMENT</option>
	<option value="1">CULTURALS</option>
	<option value="1">OTHERS</option>
</select></div>
<br>
<input id="send-moderator-request" type="button"
	value="Send Moderator Request" /></div>
<%
}
%>
</div>
<div id="moderator-area" style="display: none;padding-left: 10px">
<div class="heading">Article Notifications</div>
<div id='article-requests-tomoderator'>
<%
		if (session.getAttribute("USER_ID") != null) {
		out.println(articleNotificationstoModerator(Integer
		.parseInt(session.getAttribute("USER_ID").toString())));
	}
%>
</div>
</div>
<div id="admin-area" style="display: none;padding-left: 10px">
<div class="heading">Moderator's Notifications</div>
<div id='moderator-requests-toadmin'>
<%
out.println(moderatorsNotificationsToAdmin());
%>
</div>
<div class="heading">Thought of the Day</div>
<div id="thought-of-the-day-panel" style="padding:2px">Thought of the day : <input
	type="text" id="thought-of-the-day" size="30" /><br />
<input id="publish-thought-of-the-day" type="button"
	value="Set Thought of Today" /></div>
<div class="heading">Word of the Day</div>
<div id="word-of-the-day-panel" style="padding:2px">Word of the day : <input
	type="text" id="word-of-the-day" size="30" /><br />
<input id="publish-word-of-the-day" type="button"
	value="Set Word of Today" /></div>
<div class="heading">Post College News</div>
<div id="post-college-news-panel" style="padding:2px">Post Some news : <input
	type="text" id="college-news" size="30" /><br />
<input id="submit-college-news" type="button" value="Post College News" />
</div>
<div class="heading">Poll Panel</div>
<div id="create-new-panel" style="padding:2px"><input id="create-new-poll" type="button" value="Create a new poll" /></div>
</div>
<div id="stats-area" style="display: none;padding-left: 10px">
<div class="heading">Reports</div>
<br/>
Select Report Type: 
	<select	id="request-report-type">
		<option value="1">User Report</option>
		<option value="2">Article Report</option>
		<option value="3">Moderator Report</option>
	</select>
	<br/><br/>
	Select Report Period: 
	<select	id="request-report-between">
		<option value="1">On</option>
		<option value="2">Between</option>
	</select>
	<input type="text" id="start-date" size="10" /> - <input type="text" id="end-date" style='display:none' size="10" />
	<br/>
	<input id="get-report" type="button" value="Get Reports" />
	<br/>
	<div id='report-area'>Reports appear here</div>
	<div class="heading">Reports Panel</div>
	<div > <input id="user-report" type="button" value="Get User Report" /></div>
	<br/><div > <input style='margin-left:20px' id="moderator-report" type="button" value="Get Moderator Report" /></div>
	<br/>
	<div > <input id="polls-report" type="button" value="Get Polls Report" /></div>
</div>
</div>
<div id="content-right">
<div class="todheading"><img class="todicon" src="images/todicon.jpg"></img><div id="thoughtoftheday-heading">Thought of the
day:</div></div>
<br />
<%
out.println(getThoughtOfTheDay());
%>
<hr />
<div class="wodheading"><img class="wodicon" src="images/todicon.jpg"></img><div id="wordoftheday-heading">Word of the
day:</div></div>
<br />
<%
out.println(getWordOfTheDay());
%>
<hr />
<div class="pollheading"><img class="pollicon" src="images/todicon.jpg"></img><div id="poll-heading">Poll:</div></div>
<br/>
<%
out.println(showpoll(session));
%>
<hr />
<div class="newsheading"><img class="newsicon" src="images/todicon.jpg"></img><div id="news-heading">College News:</div></div>
<%
out.println(showNews());
%>
</div>
</div>
</div>
<%
		if (session.getAttribute("session_status") != null) {
		String username = session.getAttribute("FIRST_NAME").toString()
		+ " " + session.getAttribute("LAST_NAME").toString();
		//System.out.println(username);
%>
<script type="text/javascript">
	$("#before-login").hide();
	$("#after-login").show();			
	$("#css_horizontal_menu").show();
	$(".fbinfobox").hide();
	$(".fbinfobox").html("Your are successfully Signed In");
	$(".fbinfobox").show();
	$('.fbinfobox').fadeOut(3000, function() {});
	$("#welcome-status").html("<%=username %>");
</script>
<%
		if (Integer
		.parseInt(session.getAttribute("USER_ID").toString()) == 1026) {
%>
<script type="text/javascript">
		$('#mo').show();
		$('#ad').show();
		$('#st').show();
		</script>
<%
		} else if (isModerator(Integer.parseInt(session.getAttribute(
		"USER_ID").toString()))) {
%>
<script type="text/javascript">
		$('#mo').show();
		</script>
<%
	}
	} else {
		//System.out.println("session arrtibute is null");
	}
%>

<%
		if (session.getAttribute("auth_error") != null) {
		System.out.println("authentication error");
%>
<script type="text/javascript">	
	$(".fberrorbox").hide();
	$(".fberrorbox").html("Invalid UserName and Password");
	$(".fberrorbox").show();
	//$('.fberrorbox').fadeOut(3000, function() {
  });
</script>
<%
	session.removeAttribute("auth_error");
	}
%>

<div id="article-editor" style="display: none;">
<table id="create-article-heading">
	<tr>
		<td>Article Title:</td>
		<td><input id="article-title" type="text" size="50"
			name="article-title" /></td>
		<td>Article Type:</td>
		<td><select id="article-type">
			<option value="1">CSIT</option>
			<option value="2">ECE</option>
			<option value="3">EEE</option>
			<option value="4">MECH</option>
			<option value="5">CIVIL</option>
			<option value="6">CHEM</option>
			<option value="7">CURRENTAFFAIRS</option>
			<option value="8">GK</option>
			<option value="9">SPORTS</option>
			<option value="1">MANAGEMENT</option>
			<option value="1">CULTURALS</option>
			<option value="1">OTHERS</option>
		</select></td>
	</tr>
</table>
<table id="comment-article-heading">
	<tr>
		<td>Comment:</td>
	</tr>
</table>

<div><textarea id="editor" class="tinymce"
	style="padding: 10px;height: 400px;width: 800px;margin: auto;background-color: green;"></textarea></div>
<input id="finish-editing" type="button" value="Finish" name="finish" />
<input id="cancel-editing" type="button" value="Cancel" name="cancel" />
</div>
<div class="fbinfobox" style="display: none;"></div>
<div class="fberrorbox" style="display: none;"></div>
<div class="book-look-area">
<div id="mybook">
<div class="b-load"></div>
</div>
</div>
<div class="forget-password-panel"><div id='forget-email-label'>Enter your EMail:</div> 
<input id="forget-password-email" type="text" size="30" /><br />
<input id="forget-password-submit" type="button" value="Submit" /></div>

<div class="view-profile-panel" style="display:none;"></div>
</body>
</html>


<%!String articleNotificationstoModerator(int userID) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query4 = "SELECT * FROM CODEBOOK_MODERATORS WHERE USER_ID = "
					+ userID;
			//System.out.println(query4);
			PreparedStatement pstmt4 = Conn.prepareStatement(query4);
			ResultSet rs4 = pstmt4.executeQuery();
			String category = "";
			if (rs4.next()) {
				category = rs4.getString(3);
			}

			String query2 = "";
			if (userID != 1026) {
				query2 = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 0 AND CATEGORY = '"
						+ category + "'";
			} else {
				query2 = "SELECT * FROM CODEBOOK_ARTICLES WHERE ISPROCESSED = 0";
			}
			//System.out.println("Query "+query2);
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String requests = "<table>";

			while (rs2.next()) {
				String articleId = rs2.getString(1);
				String userId = rs2.getString(2);
				String query3 = "SELECT FIRST_NAME, LAST_NAME FROM CODEBOOK_USERS WHERE USER_ID = "
						+ userId;
				//System.out.println("Query3 "+ query3);
				PreparedStatement pstmt3 = Conn.prepareStatement(query3);
				ResultSet rs3 = pstmt3.executeQuery();
				rs3.next();
				String userName = rs3.getString(1) + " " + rs3.getString(2);
				String dateOfPost = rs2.getString(4);
				String acceptRequest = "<td><input id='show-article-request' article='"
						+ articleId
						+ "' type='button' value='Show' style='padding-left:3px'></input></td><td><input id='accept-article-request' article='"
						+ articleId
						+ "' type='button' value='Accept' style='padding-left:3px'></input></td><td><input id='reject-article-request'  article='"
						+ articleId
						+ "' type='button' value='Reject' style='padding-left:3px'></input></td>";
				requests += "<tr id='article-request-" + articleId
						+ "' ><td><div><div id='view-profile' userid='"
						+ userId + "'>" + userName
						+ "</div> Posted an Article on " + dateOfPost + "</td>"
						+ acceptRequest + "</div></tr>";
			}
			requests += "</table>";
			if (requests.equals("<table></table>")) {
				return "No Requests";
			} else {
				return requests;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	String moderatorsNotificationsToAdmin() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT * FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 0";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String requests = "<table>";
			while (rs2.next()) {
				String requestId = rs2.getString(1);
				String userId = rs2.getString(2);
				String query3 = "SELECT FIRST_NAME, LAST_NAME FROM CODEBOOK_USERS WHERE USER_ID = "
						+ userId;
				PreparedStatement pstmt3 = Conn.prepareStatement(query3);
				ResultSet rs3 = pstmt3.executeQuery();
				rs3.next();
				String userName = rs3.getString(1) + " " + rs3.getString(2);
				String dateOfRequest = rs2.getString(3);
				String subject = rs2.getString(4);
				String acceptRequest = "<td><input id='accept-moderator-request' request='"
						+ requestId
						+ "' type='button' value='Accept' style='padding-left:3px'></input></td><td><input id='reject-moderator-request'  request='"
						+ requestId
						+ "' type='button' value='Reject' style='padding-left:3px'></input></td>";
				requests += "<tr id='request-"
						+ requestId
						+ "' ><td><div><div id='view-profile' userid='"
						+ userId
						+ "'>"
						+ userName
						+ "</div> Requested for Moderator Permission for subject "
						+ subject + " on " + dateOfRequest + "</td>"
						+ acceptRequest + "</div></tr>";
			}
			requests += "</table>";
			if (requests.equals("<table></table>")) {
				return "No Requests";
			} else {
				return requests;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String getDate() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return dateFormat.format(date);
	}

	public String getWordOfTheDay() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT WORD_OF_THE_DAY FROM CODEBOOK_WORDOFTHEDAY ORDER BY WORD_ID DESC";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			if (rs2.next()) {
				return rs2.getString(1);
			} else {
				return "Word of the day not set Yet";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String getThoughtOfTheDay() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT THOUGHT_OF_THE_DAY FROM CODEBOOK_THOUGHTOFTHEDAY ORDER BY THOUGHT_ID DESC";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			if (rs2.next()) {
				return rs2.getString(1);
			} else {
				return "thought of the day not set Yet";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public boolean isModerator(int userId) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT * FROM CODEBOOK_MODERATORS WHERE USER_ID = "
					+ userId;
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			//System.out.println(query2);
			if (rs2.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean isModeratorRequestSent(int userId) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");
			String query2 = "SELECT * FROM CODEBOOK_ADMIN_REQUESTS WHERE STATUS = 0 AND USER_ID = "
					+ userId;
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			//System.out.println(query2);
			if (rs2.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public String showNews() {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query2 = "SELECT * FROM CODEBOOK_COLLEGENEWS ORDER BY NEWS_ID DESC FETCH FIRST 8 ROWS ONLY";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String news = "<marquee direction='up' scrollamount='1'>";
			while (rs2.next()) {
				news = news + rs2.getString(2) + "<hr/>";
			}
			news += "</marquee>";
			if (news
					.equals("<marquee direction='up' scrollamount='2'></marquee>")) {
				return "No News";
			} else {
				return news;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}

	public String showpoll(HttpSession session) {
		try {
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection Conn = DriverManager
					.getConnection("jdbc:db2://localhost:50000/CODEBOOK",
							"mahesh", "db2admin");

			String query2 = "SELECT * FROM CODEBOOK_POLLS WHERE ISLIVE = 1";
			PreparedStatement pstmt2 = Conn.prepareStatement(query2);
			ResultSet rs2 = pstmt2.executeQuery();
			String poll = "";
			//String pollQuestion = "";
			String pollOptions = "";
			//String pollResults = "";
			int pollId;
			int optionCount = 1;
			if (rs2.next()) {
				pollId = rs2.getInt(1);
				poll = "<div style='color:red'>Q." + rs2.getString(2) + "</div><br/><br/>";
				StringTokenizer st = new StringTokenizer(rs2.getString(3), "`");
				StringTokenizer st2 = new StringTokenizer(rs2.getString(4), "`");
				while (st.hasMoreTokens() && st2.hasMoreTokens()) {
					String votes = st2.nextToken();
					if (session.getAttribute("session_status") != null) {
						pollOptions += "<div style='color:green' class='vote' poll='" + pollId
								+ "' Option='" + optionCount + "' votes='"
								+ votes + "'>" + optionCount +". " + st.nextToken() + " (" + votes
								+ ") </div><br/>";
					} else {
						pollOptions += "<div style='color:green' class='novote' poll='" + pollId
								+ "' Option='" + optionCount + "' votes='"
								+ votes + "'>" + optionCount +". " + st.nextToken() + " (" + votes
								+ ") </div><br/>";
					}
					optionCount++;
				}
				optionCount++;
				poll += pollOptions;
				return poll;
			} else {
				return "No Poll";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
	}%>
