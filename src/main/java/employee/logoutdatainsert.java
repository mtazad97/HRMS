package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AttendanceRecord;
import dao.Attendancedao;

/**
 * Servlet implementation class logoutdatainsert
 */
@WebServlet("/logoutdatainsert")
public class logoutdatainsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public logoutdatainsert() {
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

		PrintWriter out =  response.getWriter();
		String emp_id1 = request.getParameter("emp_id");
		String att_id1 = request.getParameter("att_id");
		String logintime = request.getParameter("login");

        int emp_id = Integer.parseInt(emp_id1);
        int att_id = Integer.parseInt(att_id1);
        Time login_time = Time.valueOf(logintime);
        out.print("<p> successfully!</p>");  

        System.out.println(emp_id);
        System.out.println(att_id);

        java.util.Date date=new java.util.Date();
        //java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        java.sql.Time currenttime=new java.sql.Time(date.getTime());
        String logouttime = String.valueOf(currenttime);
        AttendanceRecord  e = new AttendanceRecord();
        
        
        
        //time calculate
          
            // Assuming you have Time objects for login and logout times
            Time loginTime = Time.valueOf(logintime);
            Time logoutTime = Time.valueOf(logouttime);

            // Calculate time difference
            long timeDifferenceMillis = logoutTime.getTime() - loginTime.getTime();

            // Convert milliseconds to hours, minutes, and seconds
            long seconds = timeDifferenceMillis / 1000;
            long minutes = seconds / 60;
            long hours = minutes / 60;

            // Calculate remaining minutes and seconds
            seconds = seconds % 60;
            minutes = minutes % 60;

            // Create a LocalTime object to store hours, minutes, and seconds
            LocalTime timeDifference1 = LocalTime.of((int) hours, (int) minutes, (int) seconds);
              Time timeDifference = Time.valueOf(timeDifference1);

            // Display the time difference
            System.out.println("Time Difference: " + timeDifference1);
            
            
            e.setAtt_id(att_id);  
            e.setLogoutTime(currenttime);
           // e.setLoginTime(login_time); 
            e.setHours(timeDifference);
            
            //int daytime =9;
            if(hours >=9) {
            	e.setDay("fullDay");
            	
            }else  {
            	e.setDay("HalfDay");

            }
           
            Attendancedao at = new Attendancedao();
            
            
            int Status;
            Status =Attendancedao.getAttendanceDatalogoutUpadate(e);

    		//HttpSession session = request.getSession();

            if (Status > 0) {
    		 	response.sendRedirect("employee/emp_dashboard.jsp");
    		 	

            }else {
    		 	response.sendRedirect("employee/emp_dashboard.jsp");

            }
        
        
	}

}
