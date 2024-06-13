package dao;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.user;

public class empdao {
	static Connection con = null;
	
	public static Integer registerEmp(user e)
	{
		int Status = 0;
		try
		{
		//connect(); 
		
		Class.forName("com.mysql.jdbc.Driver");  
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
		  PreparedStatement ps=con.prepareStatement("insert into employee(fname,lname,email,password,contact,start_date,approve) values (?,?,?,?,?,?,?)"); 
		   ps.setString(1,e.getFname());  
           ps.setString(2,e.getLname());  
           ps.setString(3,e.getEmail());  
           ps.setString(4,e.getPassword()); 
           ps.setLong(5,e.getContact());
           ps.setDate(6,e.getJoin());
           ps.setInt(7,1);
           
           Status=ps.executeUpdate();  
		}catch(Exception e1)
		{
			e1.printStackTrace();
		}
		return Status;
	}
	
	public static List<user> getApprovalList()
	{
		 List<user> list=new ArrayList<user>();  
		 try{  
			 Class.forName("com.mysql.jdbc.Driver");  
			 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
		        PreparedStatement ps=con.prepareStatement("select emp_id,fname,lname,email,contact from employee where approve =1");  
		        ResultSet rs=ps.executeQuery();  
		        while(rs.next()){  
		            user u=new user();  
		            u.setEmp_id(rs.getInt(1));  
		            u.setFname(rs.getString(2)); 
		            u.setLname(rs.getString(3));
		            u.setEmail(rs.getString(4)); 
		            u.setContact(rs.getLong(5));
		            list.add(u);  
   
		        } 
		    }catch(Exception e){System.out.println(e);}  
		    return list;  
	}

	
	 public static void approve(int  ids)
		{
			//int status = 0;
			try{  
				 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
			        PreparedStatement ps=con.prepareStatement("update employee set approve = 0 WHERE emp_id ="+ids);  
			        ps.executeUpdate(); 
			        
			    }catch(Exception e2){System.out.println(e2);} 
		}
	 
	 //emp_detail insert id
	 //admin approve eployee, the was come from approve_emp
	 public static void emp_detail_update(int  ids)
	 {
		  int status=0;
		 
		 try{  
			 Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");
				  PreparedStatement ps=con.prepareStatement("insert into emp_detail(emp_id) values (?)"); 
				   ps.setInt(1,ids); 
        status=ps.executeUpdate(); 
        System.out.println(status);
    }catch(Exception e){System.out.println(e);}      
 }	 
	 
	 
//	 public static user getLogin(String eml)
//		{
//		 user u1 = null;
//			 try{  
//				 Class.forName("com.mysql.jdbc.Driver");  
//				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
//			        PreparedStatement ps=con.prepareStatement("select emp_id,fname,email,password,approve from employee where email="+eml );  
//			        //ps.setString(1, eml);
//			       // ps.setString(2, pass);
//			        ResultSet rs=ps.executeQuery();  
//			        while(rs.next()){  
//			        	u1 = new user();
//			             u1.setEmp_id(rs.getInt(1));
//			             u1.setFname(rs.getString(2));
//			             u1.setEmail(rs.getString(3)); 
//			             u1.setPassword(rs.getString(4));
//			             u1.setApprove(rs.getInt(5)); 
//			            System.out.println(rs.getString(1));
//			        } 			        
//			    }catch(Exception e){System.out.println(e);}  
//			    return u1; 		  
//		}
	 
	 public static Integer update(user u){  
		  int status=0;
		    List<user> list=new ArrayList<user>(); 
		    //user u=new user();
		    try{  
		    	 Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");  
		        PreparedStatement ps=con.prepareStatement("update employee as e join  emp_detail as ed on e.emp_id=ed.emp_id set e.fname=?,e.mname=?,e.lname=?,e.contact=?,e.gender=?,e.city=?,e.dob=?,e.department=?,ed.country=?,ed.state=?,ed.url=?,ed.github_id=?,ed.address=?,ed.postal_code=? where e.emp_id=?");  
		        ps.setString(1,u.getFname());
		        ps.setString(2,u.getMname());
		        ps.setString(3,u.getLname());  
		        ps.setLong(4,u.getContact());  
		        ps.setString(5,u.getGender());  
		        ps.setString(6,u.getCity());  			       
		        ps.setString(7, u.getDob());
		        ps.setString(8, u.getDepartment());
		        ps.setString(9,u.getCountry());
		        ps.setString(10,u.getState());  
		        ps.setString(11,u.getUrl());  
		        ps.setString(12,u.getGithub()); 
		        ps.setString(13,u.getAddress());
		        ps.setInt(14,u.getPoster_code());
		        ps.setInt(15, u.getEmp_id());
		        status=ps.executeUpdate(); 

		    }catch(Exception e){System.out.println(e);}  
		    return status;  
		} 
	 
	
	 public static user getProfile(int id)
		{
		  user u=new user();
			 List<user> list=new ArrayList<user>();  
			 try{ 
				 
				 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
			        PreparedStatement ps=con.prepareStatement("select e.emp_id,e.fname,e.lname,e.email,e.contact,e.gender,e.dob,e.city,e.password,e.mname, ed.country,ed.state,ed.url,ed.github_id,ed.address,ed.postal_code,e.department from employee e join emp_detail ed on e.emp_id=ed.emp_id where e.emp_id =" + id);  
			        //ps.setInt(1,u.getUserid());
			        ResultSet rs=ps.executeQuery();  
			        while(rs.next()){  
			             
			            u.setEmp_id(rs.getInt(1));  
			            u.setFname(rs.getString(2)); 
			            u.setLname(rs.getString(3));
			            u.setEmail(rs.getString(4)); 
			            u.setContact(rs.getLong(5));
			            u.setGender(rs.getString(6));
			            u.setDob(rs.getString(7));
			            u.setCity(rs.getString(8));
			            u.setPassword(rs.getString(9));
			            u.setMname(rs.getString(10));
			            u.setCountry(rs.getString(11));
			            u.setState(rs.getString(12));
			            u.setUrl(rs.getString(13));
			            u.setGithub(rs.getString(14));
			            u.setAddress(rs.getString(15));
			            u.setPoster_code(rs.getInt(16));
			            u.setDepartment(rs.getString(17));
			            list.add(u);  
			        
			        }  
			    }catch(Exception e){System.out.println(e);}  
			    return u;  
		}
	 
	 	
	 
	 public static void main(String arg[]) {
		 empdao e =new empdao();
		 //e.hj();
	 }

}

