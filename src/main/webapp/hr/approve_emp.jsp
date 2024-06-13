<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.*"%>
		  <%@page import="dao.empdao"%>
		  <%@page import="bean.user"%>
		   <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		   
    <% 
  String id = request.getParameter("id");
		//System.out.println(id);
		user u = new user();
		
		int ids = Integer.parseInt(id);
		
		//int count;
		try {
		 empdao.approve(ids);
		 empdao.emp_detail_update(ids);
		 out.print("Succesfully approved");
	     request.getRequestDispatcher("dashboard.jsp").include(request, response);

		} catch (Exception e) {
		
			e.printStackTrace();
		}
		%>