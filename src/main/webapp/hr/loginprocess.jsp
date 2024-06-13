<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.user"%>
<%@page import="dao.admindao"%>
<%
	String email1 = request.getParameter("email");
	String password1 = request.getParameter("password");
	
	 user u = new user();
	u.setEmail(email1);
	 u.setPassword(password1);
	 List<user> list  = admindao.getLogin(u);
	 Iterator<user> itr = list.iterator();
	 String email =u.getEmail();
	String password =u.getPassword();
	
	String name =u.getFname();
	int id =u.getEmp_id();
	

	if (email.equals(email1) && password.equals(password1)){	
		out.print("<p> you are login your profile<p>");
		session.setAttribute("name",name);
	    session.setAttribute("id",id);
		request.getRequestDispatcher("dashboard.jsp").include(request, response);
	
	}else {
		out.print(" mismatch id & pass");
		request.getRequestDispatcher("login_ad.jsp").include(request, response);

	}
	
%>