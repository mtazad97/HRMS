package dao;

//AttendanceDAO.java
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Time;
import java.time.LocalTime;

import bean.AttendanceRecord;
import bean.user;

public class Attendancedao {

//	public void saveAttendanceRecord(AttendanceRecord record) {
//        String sql = "INSERT INTO attendance (employee_id, date, is_present) VALUES (?, ?, ?)";
//        try (Connection connection = getConnection();
//             PreparedStatement statement = connection.prepareStatement(sql)) {
//
//           // statement.setString(1, record.getEmp_Id());
//            statement.setDate(2, record.getDate());
//            statement.setBoolean(3, record.isPresent());
//            statement.setTimestamp(4, new Timestamp(record.getLoginTime().getTime()));
//            statement.setTimestamp(5, new Timestamp(record.getLogoutTime().getTime()));
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace(); // Handle or log the exception appropriately
//        }
//    }

    // Method to fetch attendance records for a specific date from the database
    public static List<AttendanceRecord> getAttendancelist(int ids) {
    	 List<AttendanceRecord> records = new ArrayList<>(); 
    	
    	try { 
    	Class.forName("com.mysql.jdbc.Driver");  
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
		  PreparedStatement ps=con.prepareStatement("select emp_id,date,presenty,login_time,logout_time,hours,day,work_from,att_id,message from attendance where emp_id ="+ids); 
 
            ResultSet resultSet = ps.executeQuery();
            int i = 0;
                while (resultSet.next()) {
                	AttendanceRecord at = new AttendanceRecord();
                    at.setEmp_id(resultSet.getInt(1));
                    at.setDate(resultSet.getDate(2));
                    at.setPresent(resultSet.getString(3));
                    at.setLoginTime(resultSet.getTime(4));
                    at.setLogoutTime(resultSet.getTime(5)) ;
                    at.setHours(resultSet.getTime(6));
                    at.setDay(resultSet.getString(7));
                    at.setWork_from(resultSet.getString(8));
    		        at.setAtt_id(resultSet.getInt(9));	            		             
    		        at.setMassege(resultSet.getString(10));
                    //System.out.println(i++);
                    
                    records.add(at);
                }
            
        } catch (Exception e) {
            e.printStackTrace(); // Handle or log the exception appropriately
        }
        return records;
    }

    
    public static List<user> getAttendanceData(int id)
	{
		 List<user> list=new ArrayList<user>();  
		 try{  
			 Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
		        PreparedStatement ps=con.prepareStatement("select emp_id,fname,lname from employee where emp_id ="+id);  
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            user u=new user();  
		            u.setEmp_id(rs.getInt(1));  
		            u.setFname(rs.getString(2)); 
		            u.setLname(rs.getString(3));		           
		            list.add(u);  

		        } 
		    }catch(Exception e){System.out.println(e);}  
		    return list;  
	}
    			
    
    public static Integer insertlogdetail(AttendanceRecord e)
	{
		int Status = 0;
		try
		{
		//connect(); 
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
		  PreparedStatement ps=con.prepareStatement("insert into attendance(emp_id,name,date,login_time,presenty,work_from,log_flag) values (?,?,?,?,?,?,?)"); 
		   ps.setInt(1,e.getEmp_id());  
           ps.setString(2,e.getName());  
           ps.setDate(3,e.getDate());  
           ps.setTime(4,e.getLoginTime()); 
           ps.setString(5,"Present");
           ps.setString(6,e.getWork_from());
           ps.setInt(7,1);
           
           Status=ps.executeUpdate();  
		}catch(Exception e1)
		{
			e1.printStackTrace();
		}
		return Status;

	}
    
    public static AttendanceRecord getAttendanceDatalogout(int id)
   	{
    	AttendanceRecord u=new AttendanceRecord(); 
   		java.util.Date date=new java.util.Date();
	        java.sql.Date cDate=new java.sql.Date(date.getTime());
   		 try{  
   			 Class.forName("com.mysql.jdbc.Driver");  
   			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
   		        PreparedStatement ps=con.prepareStatement("select att_id,emp_id,name,login_time,log_flag from attendance where emp_id = ? and date = ? ");  
   		        ps.setInt(1, id);
		        ps.setDate(2, cDate);
   		        ResultSet rs=ps.executeQuery();  
   		        while(rs.next()){  
   		        	 
   		            u.setAtt_id(rs.getInt(1));
   		            u.setEmp_id(rs.getInt(2));
   		            u.setName(rs.getString(3)); 
   		            u.setLoginTime(rs.getTime(4));
   		            u.setLog_flag(rs.getInt(5));
   		        } 
   		    }catch(Exception e){System.out.println(e);}  
   		    return u;  
   	}
    
    public static Integer getAttendanceDatalogoutUpadate(AttendanceRecord u)
   	{ 
   		
	        int Status = 0;
   		 try{  
   			 Class.forName("com.mysql.jdbc.Driver");  
   			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
   		        PreparedStatement ps=con.prepareStatement("update attendance set logout_time=?,day=?,hours=?,log_flag=?  where att_id = ? and log_flag=1");  
   		        ps.setTime(1, u.getLogoutTime());
		        ps.setString(2, u.getDay());
		        ps.setTime(3, u.getHours());
		        ps.setInt(4, 2);
		        ps.setInt(5, u.getAtt_id());	            		             
		        Status=ps.executeUpdate(); 
   		    }catch(Exception e){System.out.println(e);}  
   		    return Status;  
   	}
    
//     void time() throws ParseException {
//    	 String logtime = "01:10" ;
//         String endtime = "11:45";
//        
//         SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
//         Date d1 = (Date) sdf.parse(logtime);
//         Date d2 = (Date) sdf.parse(endtime);
//         double diff =d2.getTime()-d1.getTime();
//         double d3 = (diff/(1000*60*60));
//         System.out.println(d3);
         
    // }
    public static List<AttendanceRecord> getAttendanceview(int ids) {
   	 List<AttendanceRecord> records = new ArrayList<>(); 
   	AttendanceRecord at = new AttendanceRecord();
   	try { 
   	Class.forName("com.mysql.jdbc.Driver");  
   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
		  PreparedStatement ps=con.prepareStatement("select emp_id,date,presenty,login_time,logout_time,hours,day,work_from,att_id,message,name from attendance where att_id = " +ids); 
		  	
           ResultSet resultSet = ps.executeQuery();
           int i = 0;
               while (resultSet.next()) {
               	
                   at.setEmp_id(resultSet.getInt(1));
                   at.setDate(resultSet.getDate(2));
                   at.setPresent(resultSet.getString(3));
                   at.setLoginTime(resultSet.getTime(4));
                   at.setLogoutTime(resultSet.getTime(5)) ;
                   at.setHours(resultSet.getTime(6));
                   at.setDay(resultSet.getString(7));
                   at.setWork_from(resultSet.getString(8));
                   at.setAtt_id(resultSet.getInt(9));	            		             
   		        	at.setMassege(resultSet.getString(10));
   		        	at.setName(resultSet.getString(11));
                    
                   records.add(at);
               }
           
       } catch (Exception e) {
           e.printStackTrace(); // Handle or log the exception appropriately
       }
       return records;
   }
    
    public static void main(String arg[]) throws Exception  {
		 //empdao e =new empdao();
		 //e.hj();
    	 
    	Attendancedao at = new Attendancedao();
    	
			
		
	 }
}




 class TimeDifferenceCalculator {

	 public static void timecalculate() {
	        // Assuming you have Time objects for login and logout times
	        Time loginTime = Time.valueOf("10:00:00");
	        Time logoutTime = Time.valueOf("12:30:15");

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
	        LocalTime timeDifference = LocalTime.of((int) hours, (int) minutes, (int) seconds);

	        // Display the time difference
	        System.out.println("Time Difference: " + timeDifference);
	    }
}
