<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta name="description" content="Smarthr - Bootstrap Admin Template">
		<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
        <meta name="author" content="Dreamguys - Bootstrap Admin Template">
        <meta name="robots" content="noindex, nofollow">
        <title>leave</title>
		
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
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.user"%>
<%@page import="dao.empdao"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%int id =(int)session.getAttribute("id");%> 
		<% user u1 =empdao.getProfile(id); 
		request.setAttribute("u",u1); %>
</head>
<body>							
								<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
					<div class="row">
						<div class="col-md-8 offset-md-2">
						
								<form method="post" enctype="multipart/form-data" action="../leaveapp">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>ID <span class="text-danger">*</span></label>
											<input class="form-control" type="text" name="emp_id" value="${u.getEmp_id()}">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Name <span class="text-danger">*</span></label>
											<input class="form-control" type="text" name="name" value="${u.getFname()} ${u.getLname()}">
										</div>
									</div>
									
									</div>
								<div class="row">
										<div class="col-sm-4">
										<div class="form-group">
											<label>From date</label>
    									<input type="date" class="form-control" id="startDate" name="startDate">
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>To date</label>
    										<input type="date" class="form-control" id="endDate" name="endDate">
											
										</div>
										 									</div>
									<div class="col-sm-4">
										<div class="form-group">

										<input type="hidden" id="result"  name="result">
										</div>
										</div>
									</div>
									
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>Message</label>
											<input class="form-control" type="text" name="message">
										</div>
									</div>
									</div>
		
 						<div class="formgroup container-fluid">
						 <input type="file" name="pdf_file" accept=".pdf"/>
 							<input type="hidden" name="file" value="12108864"/> 
 								</div> 
 						<div class="form-group">
            				<button type="submit" class="btn btn-primary btn-lg">Apply</button>
        							</div>
</form>

 <%-- Java code for date difference calculation --%>
    <%--
        String startDateStr = request.getParameter("from");
        String endDateStr = request.getParameter("end");

        if (startDateStr != null && endDateStr != null) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date startDate = sdf.parse(startDateStr);
                Date endDate = sdf.parse(endDateStr);

                long differenceInMillis = endDate.getTime() - startDate.getTime();
                long differenceInDays = differenceInMillis / (24 * 60 * 60 * 1000);

                out.println("<p>Date difference: " + differenceInDays + " days</p>");
            } catch (Exception e) {
                out.println("<p>Error parsing dates: " + e.getMessage() + "</p>");
            }
        }
    --%>
</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->
</body>
	<script src="assets/js/tau.js"></script>
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
</html>