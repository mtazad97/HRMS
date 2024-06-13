package dao;

import java.io.FileInputStream;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import bean.AttendanceRecord;
import bean.leaveuser;

public class emp_leave_dao {
	
	public  Integer leavefile(leaveuser u) {
        int row = 0;
        try {
    		
        	Class.forName("com.mysql.jdbc.Driver");  
        	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
    		  PreparedStatement ps=con.prepareStatement("insert into emp_leave(emp_id,name,from_date,end_date,message,apply_date,day,approve) values (?,?,?,?,?,?,?,?)"); 
    		
    		  ps.setInt(1, u.getEmp_id());
    		  ps.setString(2, u.getName());
    		  ps.setDate(3, u.getFrom());
    		  ps.setDate(4, u.getEnd());
    		  ps.setString(5, u.getMessage());
    		  ps.setDate(6, u.getApply());
    		  ps.setInt(7, u.getDay());
    		  ps.setInt(8, 1);
    		 
//            if (file != null) {
//                // fetches input stream of the upload file for the blob column
//                ps.setBlob(8, file);
//            }

            // sends the statement to the database server
           
    		  row = ps.executeUpdate();
        } catch (Exception e) {
            // process sql exception
            System.out.println(e);
        }
        return row;
    }

	public static List<leaveuser> LeaveDataViewlist() {
	   	 List<leaveuser> records = new ArrayList<>(); 
	   	 
	   	try { 
	   	Class.forName("com.mysql.jdbc.Driver");  
	   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
			  PreparedStatement ps=con.prepareStatement("select lev_id,emp_id,name,from_date,end_date,message,ad_message,apply_date,approve,day from emp_leave where approve=1"); 
	           ResultSet resultSet = ps.executeQuery();
	           //int i = 0;
	               while (resultSet.next()) {
	            	   leaveuser at = new leaveuser();
	            	   at.setLeave_id(resultSet.getInt(1));
	                   at.setEmp_id(resultSet.getInt(2));
	                   at.setName(resultSet.getString(3));
	                   at.setFrom(resultSet.getDate(4));
	                   at.setEnd(resultSet.getDate(5));
	                   at.setMessage(resultSet.getString(6)) ;
	                   at.setAd_message(resultSet.getString(7));
	                   at.setApply(resultSet.getDate(8));
	                   at.setApprove(resultSet.getInt(9));
	                   at.setDay(resultSet.getInt(10));	            		             
	                   
	                   records.add(at);
	               }
	           
	       } catch (Exception e) {
	           e.printStackTrace(); 
	       }
	       return records;
	   }
	
	public static List<leaveuser> LeaveDataView(int id) {
   	 List<leaveuser> records = new ArrayList<>(); 
   	 
   	try { 
   	Class.forName("com.mysql.jdbc.Driver");  
   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
		  PreparedStatement ps=con.prepareStatement("select lev_id,emp_id,name,from_date,end_date,message,ad_message,apply_date,approve,day from emp_leave where lev_id ="+id); 
           ResultSet resultSet = ps.executeQuery();
           //int i = 0;
               while (resultSet.next()) {
            	   leaveuser at = new leaveuser();
            	   at.setLeave_id(resultSet.getInt(1));
                   at.setEmp_id(resultSet.getInt(2));
                   at.setName(resultSet.getString(3));
                   at.setFrom(resultSet.getDate(4));
                   at.setEnd(resultSet.getDate(5));
                   at.setMessage(resultSet.getString(6)) ;
                   at.setAd_message(resultSet.getString(7));
                   at.setApply(resultSet.getDate(8));
                   at.setApprove(resultSet.getInt(9));
                   at.setDay(resultSet.getInt(10));	            		             
                   
                   records.add(at);
               }
           
       } catch (Exception e) {
           e.printStackTrace(); 
       }
       return records;
   }

	public static void LeaveApprove(int  ids)
	{
		//int status = 0;
		try{  
			 Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
		        PreparedStatement ps=con.prepareStatement("update emp_leave set approve = 0 WHERE lev_id ="+ids);
		        
		        ps.executeUpdate(); 
		        
		    }catch(Exception e2){System.out.println(e2);} 
	}
	public static void Leavedisapprove(int ids)
	{
		//int status = 0;
		try{  
			 Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
		        PreparedStatement ps=con.prepareStatement("update emp_leave set approve = 2 WHERE lev_id ="+ids);
		        
		        ps.executeUpdate(); 
		        
		    }catch(Exception e2){System.out.println(e2);} 
	}
	
	public static int LeaveUpdateAdmin(int  ids)
	{
		leaveuser u = new leaveuser();
		
		// Sample dates (you can replace these with your actual dates)
        //Date startDate = u.getFrom();
       // Date endDate = u.getEnd();

        // Parse the date strings into LocalDate objects
//        Date startDate = LocalDate.parse(startDateStr);
//        Date endDate = LocalDate.parse(endDateStr);

        // Calculate the difference in days
       // int daysDifference = (int) getDateDifference(startDate, endDate);

       // System.out.println("Difference in days: " + daysDifference);
		
		int status = 0;
		try{  
			 Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
		        PreparedStatement ps=con.prepareStatement("update emp_leave set from_date=?,end_date=?,day=?,ad_message=?,approve = ? WHERE lev_id ="+ids);
		        ps.setDate(1, u.getFrom());
		        ps.setDate(2, u.getEnd());
		        ps.setInt(3, u.getDay());
		        ps.setString(4, u.getAd_message());
		        ps.setInt(5, u.getApprove());
		        
		         status = ps.executeUpdate();		        
		        
		    }catch(Exception e2){System.out.println(e2);}
		return status; 
	}

	private static long getDateDifference(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return 0;
	}
}
