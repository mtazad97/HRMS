package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.ResultSetMetaData;

import bean.user;

public class admindao {
	
	 public static List<user> getLogin(user u)
		{
			 List<user> list=new ArrayList<user>();  
			 try{  
				 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
			        PreparedStatement ps=con.prepareStatement("select ad_id,fname,email,password from admin where email= ? and password =?");  
			        ps.setString(1, u.getEmail());
			        ps.setString(2, u.getPassword());
			        ResultSet rs=ps.executeQuery();  
			        while(rs.next()){  
			             u.setEmp_id(rs.getInt(1));
			             u.setFname(rs.getString(2));
			             u.setEmail(rs.getString(3)); 
			             u.setPassword(rs.getString(4));
			            list.add(u);  
			            System.out.println(rs.getString(1));
			        } 
			        System.out.println(list);
			    }catch(Exception e){System.out.println(e);}  
			    return list; 
			  
		}
	 		
	 public static List<user> totalempoyee(){
	 		user u = new user();
			 List<user> list=new ArrayList<user>();  

	 		
	 		try {
	 			 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
			        PreparedStatement ps=con.prepareStatement("select e.emp_id,e.fname,e.lname,e.email,e.contact,e.gender,e.dob,e.city,e.password,e.mname, ed.country,ed.state,ed.url,ed.github_id,ed.address,ed.postal_code,e.department from employee e join emp_detail ed on e.emp_id=ed.emp_id");  
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
			            u.setDepartment(rs.getString(17));}
			            
//			        ResultSetMetaData rsmd =(ResultSetMetaData) rs.getMetaData();
//			            int column_count =rsmd.Count();
			           // u.setEmp_count(column_count);
			            list.add(u);  
			        //System.out.println(column_count);
	 			
	 		}catch(Exception e){System.out.println(e);}
	 		
			return list;
			}
	 public static List<user> getTotalList()
		{
			 List<user> list=new ArrayList<user>(); 
			 int i=0;
			 try{  
				 Class.forName("com.mysql.jdbc.Driver");  
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");   
			        PreparedStatement ps=con.prepareStatement("select emp_id,fname,lname,email,contact from employee where approve =0");  
			        ResultSet rs=ps.executeQuery();  
			        while(rs.next()){  
			            user u=new user();  
			            u.setEmp_id(rs.getInt(1));  
			            u.setFname(rs.getString(2)); 
			            u.setLname(rs.getString(3));
			            u.setEmail(rs.getString(4)); 
			            u.setContact(rs.getLong(5));
			            i=++i;
			            
			            //System.out.println(i);
			            list.add(u);  
			            } 
			        
			    }catch(Exception e){System.out.println(e);}  
			    return list;  
		}
	 public static user emp_Profile(int id)
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
	 public static Integer emp_update(user u){  
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
	 		
	 public static Integer admin_emp_add(user u){  
		  int status=0;
		    List<user> list=new ArrayList<user>(); 
		    //user u=new user();
		    try{  
		    	 Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hrms","root","");  
				PreparedStatement ps=con.prepareStatement("insert into employee(fname,lname,email,password,contact,start_date,mname,gender,city,dob,department,approve) values (?,?,?,?,?,?,?,?,?,?,?,?)"); 
				   ps.setString(1,u.getFname());  
		           ps.setString(2,u.getLname());  
		           ps.setString(3,u.getEmail());  
		           ps.setString(4,u.getPassword()); 
		           ps.setLong(5,u.getContact());
		           ps.setDate(6,u.getJoin());
		           ps.setString(7,u.getMname());
		           ps.setString(8,u.getGender());  
		           ps.setString(9,u.getCity());  			       
		           ps.setString(10, u.getDob());
			       ps.setString(11, u.getDepartment()); 
			       ps.setInt(12,1);
			       status=ps.executeUpdate(); 
		    }catch(Exception e){System.out.println(e);}  
		    return status;  
		}
	 		
	 public static void main(String arg[]) {
		 admindao e =new admindao();
		// e.totalempoyee();
	 }

}
