<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

session.invalidate();
request.getRequestDispatcher("login_emp.jsp").include(request, response);

%>
