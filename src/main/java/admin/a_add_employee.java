package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.user;
import dao.admindao;


@WebServlet("/a_add_employee")
public class a_add_employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	user u = new user();
	admindao ud = new admindao();
    public a_add_employee() {
        super();
        // TODO Auto-generated constructor stub
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		//String id1=request.getParameter("emp_id");
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname =request.getParameter("lname");
		String city=request.getParameter("city");
		String gender=request.getParameter("gender");
		String contact=request.getParameter("contact");
		String password=request.getParameter("password");
		//String state=request.getParameter("state");
		//String country=request.getParameter("country");
		//String postal=request.getParameter("postal");
		String dob=request.getParameter("dob");
		String email=request.getParameter("email");
		//String github=request.getParameter("github");
		//String url=request.getParameter("url");
		String department=request.getParameter("department");

		//String id1=request.getParameter("id"); 
	
		HttpSession session = request.getSession();
		//int id = (int)session.getAttribute("id");
	
		List<user> list=new ArrayList<user>();
		//int id =  Integer.parseInt(id1);
		long contact1 = Long.parseLong(contact);
		//int postal1 = Integer.parseInt(postal);
		
		
		java.util.Date date=new java.util.Date();
        java.sql.Date joindate=new java.sql.Date(date.getTime());
		
			 u.setFname(fname);
			 u.setMname(mname);
			 u.setLname(lname);
			 u.setContact(contact1);
			// u.setAddress(address);
			 u.setCity(city);
			 u.setGender(gender);
			// u.setEmp_id(id);
			 u.setEmail(email);
			// u.setCountry(country);
		     // u.setState(state);  
		      //u.setUrl(url);  
		      //u.setGithub(github); 
			 u.setPassword(password);
		      u.setDob(dob);
		      u.setDepartment(department);
		      //u.setPoster_code(postal1);
		     // u.setAddress(address);
		      u.setJoin(joindate);
			 list.add(u);
			 
			// System.out.println(id);
			 
			
			int status ;
				status = admindao.admin_emp_add(u);
	        if(status>0){  
	            pw.print("<p>Record Updated successfully!</p>"); 
			 	response.sendRedirect("hr/totalemployee.jsp");

	            //request.getRequestDispatcher("hr/totalemployee.jsp").include(request, response);  
	        }else{  
	            pw.println("Sorry! unable to Update record");  
	            request.getRequestDispatcher("hr/totalemployee.jsp").include(request, response);  

	        } 
	}
		
	

}
