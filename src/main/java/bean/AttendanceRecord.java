package bean;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalTime;

public class AttendanceRecord {
	
	 private String name;
	private int emp_id;
	private int att_id,log_flag;
    

	private Date date;
    private String Present;
    private Time loginTime;
    private Time logoutTime;
	private String work_from;
	private String day;
	private Time hours;
	private String message;
    

	

//	public AttendanceRecord(int emp_id, Date date, boolean isPresent, Date loginTime, Date logoutTime, String work_from,
//			String day, int hours) {
//		super();
//		this.emp_id = emp_id;
//		this.date = date;
//		this.isPresent = isPresent;
//		this.loginTime = loginTime;
//		this.logoutTime = logoutTime;
//		this.work_from = work_from;
//		this.day = day;
//		this.hours = hours;
//	}

	
	
	public int getAtt_id() {
		return att_id;
	}

	public String getMassege() {
		return message;
	}

	public void setMassege(String massege) {
		this.message = massege;
	}

	public int getLog_flag() {
		return log_flag;
	}

	public void setLog_flag(int log_flag) {
		this.log_flag = log_flag;
	}

	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}
	
	public int getEmp_id() {
		return emp_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getWork_from() {
		return work_from;
	}

	public void setWork_from(String work_from) {
		this.work_from = work_from;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	

	public Time getHours() {
		return hours;
	}

	public void setHours(Time hours) {
		this.hours = hours;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Time getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Time loginTime) {
		this.loginTime = loginTime;
	}

	public Time getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(Time logoutTime) {
		this.logoutTime = logoutTime;
	}

	public String getPresent() {
		return Present;
	}

	public void setPresent(String Present) {
		this.Present = Present;
	}
	
	
}
