package admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.leaveuser;
import dao.emp_leave_dao;

@WebServlet("/leaveupdate")
public class leaveupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public leaveupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		 	String leav_id1 = request.getParameter("leav_id");
	        String emp_id1 = request.getParameter("emp_id");
	        String startDate = request.getParameter("startDate");
	        String endDate = request.getParameter("endDate");
	        String cal = request.getParameter("cal");
	        String ad_message = request.getParameter("message");
	        String approve1 = request.getParameter("approve");
		
	        int leav_id= Integer.parseInt(leav_id1);
	        int emp_id= Integer.parseInt(emp_id1);
	        int approve= Integer.parseInt(approve1);
	        int calcu= Integer.parseInt(cal);
	        Date startDate1= Date.valueOf(startDate);
	        Date endDate1= Date.valueOf(endDate);
	        
	        emp_leave_dao et = new emp_leave_dao();
     	   leaveuser at = new leaveuser();
     	   at.setFrom(startDate1);
     	   at.setEnd(endDate1);
     	   at.setDay(calcu);
     	   at.setAd_message(ad_message);
     	   at.setApprove(approve);
     	   
     	   
     	  int status;
     		
     	 status =emp_leave_dao.LeaveUpdateAdmin(leav_id);
     	String massages = null;
     	String massages1="succes";
     	String massages2="unsucces";
     	HttpSession session = request.getSession();
      if (status > 0) {
    	  
		session.setAttribute(massages,massages1);
		 	response.sendRedirect("hr/dashbroard.jsp");

      }else {
  		session.setAttribute(massages,massages2);
		 	response.sendRedirect("hr/leaveview.jsp");

      }


	}

}
