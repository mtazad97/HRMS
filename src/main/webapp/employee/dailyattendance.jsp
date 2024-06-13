<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Dashboard Employee</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Chart CSS -->
		<link rel="stylesheet" href="assets/plugins/morris/morris.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@page import="bean.AttendanceRecord"%>
<%@page import="dao.Attendancedao"%>
<%@page import="java.sql.*"%>
		<%@page import="java.util.*"%>
		<%@page import="bean.user"%>
		<%@page import="java.text.*"%>
		<%@page import="java.util.Date"%>
</head>
<body>
<%int id = (int)session.getAttribute("id"); %>
<% List<user> list=Attendancedao.getAttendanceData(id);
request.setAttribute("ad",list); %>

			<div class="col-md-12 col-lg-6 col-xl-4 d-flex">
							<div class="card flex-fill">
										<form method="Post" action="../attendanceInsert">
							
							<c:forEach items="${ad}" var="u" >
								<div class="card-body">								
									<h4 class="card-title" >Today Attendance <span class="badge bg-inverse-danger ml-2">
									<input type="hidden"  value="${u.getEmp_id()}" name="employeeId">${u.getEmp_id()}</span></h4>
																		
									<div class="leave-info-box">
										<div class="media align-items-center">
											<a href="#" class="avatar"><img alt="" src="assets/img/user.jpg"></a>
											<div class="media-body">
												<div class="text-sm my-0" >
												
												<input class="text-sm my-0" type="hidden" name="name" value="${u.getFname()} ${u.getLname()}">
												${u.getFname()} ${u.getLname()}
												</div>
											</div>
										</div>
										
									<!--  	<fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss" var="date"/>  -->
   
										<div class="row align-items-center mt-2">
											<div class="col-6">
												<h6 class="mb-0"><%= (new java.util.Date()).toLocaleString()%></h6>
												<span class="text-sm text-muted">
												<label>Work From</label>
												<select class="form-control select" name="workfrom">
									  			<option value="Office">Office</option>
									  			<option value="Home">Home</option>
									    		<option value="other">Other</option>	
									    		</select> 									
									    	</span>
											</div>
											<div class="col-6 text-right">
												<span ><button type="submit" class="badge bg-inverse-success">Login</button></span>
											</div>
											
											
										</div>
										</div>
									</div>
									</c:forEach>
									</form>
								
				<% 					String message =null ;	
									int flag;
									AttendanceRecord at1=new AttendanceRecord();
									Attendancedao.getAttendanceData(id);
									flag= at1.getLog_flag();
									if(flag==0){
										message= "You are Login";
									}else{
										message= "You are Logout";
									}
				%>
									<div class="badge bg-inverse-success text-center">
									<h4><%out.print(message); %></h4>
									</div>
									<% AttendanceRecord at =Attendancedao.getAttendanceDatalogout(id); 
										request.setAttribute("au",at); %> 
									<form method="Post" action="../logoutdatainsert">
																		<div class="card-body">								
										
									<div class="leave-info-box">
										<div class="media align-items-center">
											<a href="#" class="avatar"><img alt="" src="assets/img/user.jpg"></a>
											<div class="media-body">
												<div class="text-sm my-0">${au.getName()}</div>
									<h4><input type="hidden"  value="${au.getEmp_id()}" name="emp_id"></h4>
									<h4><input type="hidden"  value="${au.getAtt_id()}" name="att_id"></h4>
												
											</div>
										</div>
										<div class="row align-items-center mt-3">
											<div class="col-6">
												<h6 class="mb-0"> Date : <%= (new java.util.Date()).toLocaleString()%></h6>
												
												<h6 class="mb-0">Login Time : ${au.getLoginTime()}</h6>											
												
											</div>
											<h4><input type="hidden"  value="${au.getLoginTime()}" name="login"></h4>
											
											<div class="col-6 text-right">
									<span ><button type="submit" class="badge bg-inverse-success">Logout</button></span>
												
											</div>
										</div>
									</div>
									<div class="load-more text-center">
										<a class="text-dark" href="javascript:void(0);">Load More</a>
									</div>
										</div>
									</form>
								</div>
							</div>
							
						
					

			
	
	
	<script>
      // create a function to update the date and time
      function updateDateTime() {
        // create a new `Date` object
        const now = new Date();

        // get the current date and time as a string
        const currentDateTime = now.toLocaleString();

        // update the `textContent` property of the `span` element with the `id` of `datetime`
        document.querySelector('#datetime').textContent = currentDateTime;
      }

      // call the `updateDateTime` function every second
      setInterval(updateDateTime, 1000);
      </script>
<script src="assets/js/jquery-3.5.1.min.js"></script>
		
		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
		
		<!-- Slimscroll JS -->
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		
		<!-- Chart JS -->
		<script src="assets/plugins/morris/morris.min.js"></script>
		<script src="assets/plugins/raphael/raphael.min.js"></script>
		<script src="assets/js/chart.js"></script>
		
		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
</body>
</html>