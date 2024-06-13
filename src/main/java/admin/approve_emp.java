package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.user;
import dao.empdao;


@WebServlet("/approve_emp")
public class approve_emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public approve_emp() {
        super();
    }

	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
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
	}

}
