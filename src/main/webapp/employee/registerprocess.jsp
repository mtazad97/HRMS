<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.user"%>
<%@page import="dao.empdao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String contact = request.getParameter("contact");
String pass = request.getParameter("password");
String cpass = request.getParameter("cpassword");

DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
Calendar doj = Calendar.getInstance();
String str = formatter.format(doj.getTime());

Date join = Date.valueOf(str);
if(pass.equals(cpass))
{
	 user u = new user();
	 u.setFname(fname);
	 u.setLname(lname);
	 u.setEmail(email);
	 u.setContact(Long.parseLong(contact));
	 u.setPassword(pass);
	 u.setJoin(join);
	 int status ;
		status = empdao.registerEmp(u);
 if(status>0){  
     out.print("Record saved successfully!");
     request.getRequestDispatcher("login_emp.jsp").include(request, response);
%>

<%

}else{  
    out.print("Sorry! unable to save record"); 
    request.getRequestDispatcher("login_emp.jsp").include(request, response);

}  
}
else
{
 out.print("password and confirm password not match");
 request.getRequestDispatcher("register.jsp").include(request, response);

}
%>
