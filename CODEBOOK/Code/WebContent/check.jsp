<%@page import="java.sql.*" language="java"
	contentType="text/html;
charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="functions.jsp"%>
<%

	if (request.getParameter("source").equals("deleteArticle")) {
			out.print(deleteArticle(request));
	}
	
	if (request.getParameter("source").equals("editArticle")) {
			out.print(editarticle(request));
	}
	
	if (request.getParameter("source").equals("getReports")) {
			out.print(getreports(request));
	}
	
	if (request.getParameter("source").equals("validateRoll")) {
			out.print(validateRoll(request));
	}
	
	if (request.getParameter("source").equals("validateEmail")) {
			out.print(validateEmail(request));
	}
		
	if (request.getParameter("source").equals("forgetPassword")) {
			out.print(forgetpassword(request));
	}
	
	if (request.getParameter("source").equals("publishPoll")) {
			out.print(publishPoll(request));
	}
	
	if (request.getParameter("source").equals("acceptArticleRequest")) {
			out.print(acceptArticlerequest(request,session));
	}
	
	if (request.getParameter("source").equals("rejectArticleRequest")) {
			out.print(rejectArticlerequest(request,session));
	}
	
	if (request.getParameter("source").equals("showArticleRequest")) {
			out.print(showArticleRequest(request));
	}
	
	if (request.getParameter("source").equals("thoughtOfTheDay")) {
			out.print(thoughtOfTheDay(request));
	}
	
	if (request.getParameter("source").equals("wordOfTheDay")) {
			out.print(wordOfTheDay(request));
	}
	
	if (request.getParameter("source").equals("postCollegeNews")) {
			out.print(postcollegeNews(request));
	}
	
	if (request.getParameter("source").equals("acceptModeratorRequest")) {
			out.print(acceptModeratorRequest(request,session));
	}
	
	if (request.getParameter("source").equals("rejectModeratorRequest")) {
			out.print(rejectModeratorRequest(request,session));
	}
	
	if (request.getParameter("source").equals("getAllComments")) {
			out.print(getAllcomments(request,session));
	}

	if (request.getParameter("source").equals("sendModeratorRequest")) {
			out.print(sendModeratorRequest(request,session));
	}

	if (request.getParameter("source").equals("updateProfile")) {
			out.print(updateProfile(request,session));
			//session.setAttribute("FIRST_NAME",request.getAttribute("update_first_name").toString());
			//session.setAttribute("LAST_NAME",request.getAttribute("update_last_name").toString());
	}
	
	if (request.getParameter("source").equals("chagePassword")) {
			out.print(changepassword(request,session));
	}
	
	if (request.getParameter("source").equals("requestArticles")) {
			out.print(getArticles(request,session));
	}
	
	if (request.getParameter("source").equals("seeMore")) {
			out.print(seeMore(request,session));
	}
	
	if (request.getParameter("source").equals("viewProfile")) {
			out.print(viewProfile(request,session));
	}
	
	if (request.getParameter("source").equals("tick")) {
			out.print(tickArticle(request));
	}
	
	if (request.getParameter("source").equals("download")) {
			out.print(downloadArticle(request));
	}
	
	if (request.getParameter("source").equals("vote")) {
			out.print(votepoll(request));
	}
	
	if (request.getParameter("source").equals("all")) {
			out.print(getAllCategoryArticles());
	}
	
	if (request.getParameter("source").equals("postArticle")) {
			out.print(postArticle(request,session));
	}
	
	if (request.getParameter("source").equals("postComment")) {
			out.print(postComment(request,session));
	}
		
	if (request.getParameter("source").equals("signup")) {
			out.print(SignUp(request));
	}

	if (request.getParameter("source").equals("signin")) {
		if (session.getAttribute("session_status") == null) {
		//	System.out.println("New Session started now");		
			out.print(signIn(request,session));
		}else{
		//	System.out.println("Old Session continues");
		}
	}

	if (request.getParameter("source").equals("signout")) {
		out.print(signOut(request,session));
	}
%>
