<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*"%>
<%@page import="dao.emp_leave_dao"%>
<%@page import="bean.leaveuser"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		   
		   <% 
  int id = Integer.parseInt(request.getParameter("id"));
		//System.out.println(id);
		leaveuser u = new leaveuser();
		
		//int ids = Integer.parseInt(id);
		
		//int count;
		try {
		emp_leave_dao.Leavedisapprove(id);
		 out.print("Succesfully approved");
		 	response.sendRedirect("dashboard.jsp");

		 %>
		 <% 

		} catch (Exception e) {
		
			e.printStackTrace();
		}
		%>
