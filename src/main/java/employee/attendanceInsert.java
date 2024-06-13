package employee;

import java.io.IOException;



import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.AttendanceRecord;
import dao.Attendancedao;


@WebServlet("/attendanceInsert")
public class attendanceInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public attendanceInsert() {
        super();
      
    }

	
   // private List<AttendanceRecord> attendanceRecords = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  	  Attendancedao at = new Attendancedao(); 

    	
        String emp_id1 = request.getParameter("employeeId");
        String name = request.getParameter("name");
        String workfrom = request.getParameter("workfrom");
        
        int emp_id = Integer.parseInt(emp_id1);
        
        java.util.Date date=new java.util.Date();
        java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        Time sqlTime=new java.sql.Time(date.getTime());
        
        AttendanceRecord  e = new AttendanceRecord();
        
        e.setEmp_id(emp_id);  
        e.setName(name);  
        e.setDate(sqlDate);  
        e.setLoginTime(sqlTime); 
        e.setWork_from(workfrom);
        
        int Status;
        Status = Attendancedao.insertlogdetail(e);
      //  HttpSession session = request.getSession();
        if (Status > 0) {
        	
		 	response.sendRedirect("employee/emp_dashboard.jsp");

        }else {
		 	response.sendRedirect("employee/emp_profile.jsp");

        }
        
         }

    

    
    
    
    
//    private Date getCurrentDate() {
//        // Implement logic to get the current date (e.g., using java.util.Calendar or java.time.LocalDate)
//        // For simplicity, we'll use the current date as an example
//        return new Date(0);
//    }
//
//    private String getCurrentDateAsString() {
//        // Implement logic to get the current date as a string
//        // For simplicity, we'll use the current date as an example
//        return "2023-01-01";
//    }

//    private List<AttendanceRecord> fetchAttendanceRecords(String selectedDate) {
//        // Implement logic to fetch attendance records for the selected date
//        // For simplicity, we'll use the current date as an example
//        List<AttendanceRecord> records = new ArrayList<>();
//        records.add(new AttendanceRecord("1", "2023-01-01", true));
//        records.add(new AttendanceRecord("2", "2023-01-02", false));
//        // Add more records as needed
//        return records;
//    }

//    private int calculateTotalWorkingHours(List<AttendanceRecord> attendanceRecords) {
//        // Implement logic to calculate total working hours for the month
//        // For simplicity, we'll assume each day has 8 working hours
//        int totalHours = 0;
//        for (AttendanceRecord record : attendanceRecords) {
//            if (record.isPresent()) {
//                totalHours += 8; // Assuming 8 working hours per day
//            }
//        }
//        return totalHours;
//    }
}
