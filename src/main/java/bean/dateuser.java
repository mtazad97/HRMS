package bean;

import java.util.HashMap;
import java.util.Map;

public class dateuser {
	
	private int emp_id;
    private String fname;
    private Map<String, String> attendanceRecords;  // Date -> "LoginTime|LogoutTime"
   
    public dateuser() {
        this.attendanceRecords = new HashMap<>();  
    }

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Map<String, String> getAttendanceRecords() {
		return attendanceRecords;
	}

	public void setAttendanceRecords(Map<String, String> attendanceRecords) {
		this.attendanceRecords = attendanceRecords;
	}

	public dateuser(int emp_id, String fname, Map<String, String> attendanceRecords) {
		super();
		this.emp_id = emp_id;
		this.fname = fname;
		this.attendanceRecords = attendanceRecords;
	}
	public void recordAttendance(String date, String loginTime, String logoutTime) {
        String attendance = loginTime + "|" + logoutTime;
        attendanceRecords.put(date, attendance);
    }
}
