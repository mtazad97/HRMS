<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.user"%>
<%@page import="dao.empdao"%>
<%
	String email1 = request.getParameter("email");
	String password1 = request.getParameter("password");
	
	 user u = new user();

    //empdao.getLogin(email1);
    try{  
		 Class.forName("com.mysql.jdbc.Driver");  
		 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
	        PreparedStatement ps=con.prepareStatement("select emp_id,fname,email,password,approve from employee where email= ? and password =?");  
	        ps.setString(1, email1);
	        ps.setString(2, password1);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	             u.setEmp_id(rs.getInt(1));
	             u.setFname(rs.getString(2));
	             u.setEmail(rs.getString(3)); 
	             u.setPassword(rs.getString(4));
	             u.setApprove(rs.getInt(5));
	            //list.add(u);  
	            System.out.println(rs.getString(1));
	        } 
	       // System.out.println(list);
	    }catch(Exception e){System.out.println(e);}
    
    
    String email =u.getEmail();
	String password =u.getPassword();
	int approve = u.getApprove();
	String name =u.getFname();
	int id =u.getEmp_id();
	
	session.setAttribute("name",name);
    session.setAttribute("id",id);
	if (email1.equals(email) && password1.equals(password))
	{
		if(approve ==0) {
			out.print("<p> you are login your profile<p>");
		 	response.sendRedirect("emp_dashboard.jsp");

			out.print("sucessfully");
			
		}else
		{
			out.print("<p> you are not approve for login<p>");
		 	response.sendRedirect("login_emp.jsp");

			
		}
	}else {
		out.print(" mismatch id & pass");
	}
	 
	 
	
%>