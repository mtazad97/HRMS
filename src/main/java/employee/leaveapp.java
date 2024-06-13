package employee;

import java.io.IOException;



import java.io.PrintWriter;
import java.io.FileInputStream;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import bean.leaveuser;
import dao.emp_leave_dao;


@WebServlet("/leaveapp")
@MultipartConfig()
public class leaveapp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public leaveapp() {
        super();
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		PrintWriter out = response.getWriter();

		emp_leave_dao leave =new emp_leave_dao();
		leaveuser u = new leaveuser();
		//FileInputStream inputStream = null;
		
		String ids = request.getParameter("emp_id");
		String name = request.getParameter("name");
		String from = request.getParameter("startDate");
		String end = request.getParameter("endDate");
		String day1 = request.getParameter("result");
		String message = request.getParameter("message");
		
       // Part file = request.getPart("file");
  
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Calendar doj = Calendar.getInstance();
        String str = formatter.format(doj.getTime());
        
       int day = Integer.parseInt(day1);
       int id = Integer.parseInt(ids);
        Date from1 = Date.valueOf(from);
        Date end1 = Date.valueOf(end);
        Date apply = Date.valueOf(str);
        System.out.println(day);
        
      //  String message1 = null;
        // obtains the upload file part in this multipart request
        
//        if (file != null) {
//            // prints out some information for debugging
//            System.out.println(file.getName());
//            System.out.println(file.getSize());
//            System.out.println(file.getContentType());

            // obtains input stream of the upload file
           // inputStream = (FileInputStream) file.getInputStream();
            //9322251804
            u.setEmp_id(id);
            u.setName(name);
            u.setMessage(message);
            u.setFrom(from1);
            u.setEnd(end1);
            u.setApply(apply);
            u.setDay(day);
            //leave.leavefile(u);
       // }
        int row;
	
			row = leave.leavefile(u);

		
        if (row > 0) {
        	out.println("request sent to admin");
		 	response.sendRedirect("employee/emp_dashboard.jsp");

        }else {
        	out.print("some error in ruquest plz check");
		 	response.sendRedirect("employee/emp_leave.jsp");

        }
        //message1 = "File uploaded and saved into database";

        // sets the message in request scope
        //request.setAttribute("Message", message1);

        // forwards to the message page
//        getServletContext().getRequestDispatcher("/message.jsp")
//            .forward(request, response);
		
        
    }

		
	}


