<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>Profile</title>
		
		<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
		<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
		
		<!-- Lineawesome CSS -->
        <link rel="stylesheet" href="assets/css/line-awesome.min.css">
		
		<!-- Select2 CSS -->
		<link rel="stylesheet" href="assets/css/select2.min.css">
		
		<!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="assets/js/html5shiv.min.js"></script>
			<script src="assets/js/respond.min.js"></script>
			
			
		<![endif]-->
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
		    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.AttendanceRecord"%>
<%@page import="dao.Attendancedao"%>
<%@page import="java.sql.Date"%>
</head>
<body>

<%
String id_attlist = request.getParameter("id");
int att_id = Integer.parseInt(id_attlist);
%>
<% List<AttendanceRecord> list=dao.Attendancedao.getAttendanceview(att_id);
request.setAttribute("attendanceRecords",list); %>
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
                <c:forEach items="${attendanceRecords}" var="u" >
                
					<div class="row">
						<div class="col-md-8 offset-md-2">

									<div class="row">
									
									<div class="col-sm-4">
										<div class="form-group">
											<label>Employee Id</label>
									<input type="hidden"  value="${u.getAtt_id()}" name="att_id">
										<h4 class="form-control"> ${u.getEmp_id()}</h4>
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>Name</label>
									<h4 class="form-control"> ${u.getName()}</h4>
											
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>Date <span class="text-danger"></span></label>
										<input type="hidden"  value="${u.getDate()}" name="date">
											
										<h4 class="form-control">${u.getDate()}</h4>
										</div>
									
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Login Time</label>
										<h4 class="form-control"> ${u.getLoginTime()}</h4>
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>Logout Time</label>
									<h4 class="form-control">${u.getLogoutTime()}</h4>
											
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>Day </label>
										<h4 class="form-control">${u.getHours()}</h4>
										</div>
									
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Hours</label>
										<h4 class="form-control"> ${u.getWork_from()}</h4>
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
									<label>Work From</label>
									<h4 class="form-control">${u.getDay()}</h4>
											
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label>Message</label>
											<input class="form-control " type="text" name="massege" value="${u.getMassege()}" >
										</div>
									</div>
									</div>
									
							
									
						</div>
						
                </div>
				<!-- /Page Content -->
				</c:forEach>
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->
								
<script src="assets/js/tausif.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>

		<!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

		<!-- Slimscroll JS -->
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		
		<!-- Select2 JS -->
		<script src="assets/js/select2.min.js"></script>

		<!-- Custom JS -->
		<script src="assets/js/app.js"></script>
		
</body>
</html>