<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<%@page import="dao.emp_leave_dao"%>
<%@page import="bean.leaveuser"%>
<title>Apply leave</title>
</head>
<body>
       <%int id = Integer.parseInt(request.getParameter("id"));%> 
		<% List<leaveuser> list=dao.emp_leave_dao.LeaveDataView(id);
request.setAttribute("u1",list); %>               
            <!-- Page Wrapper -->
            <div class="page-wrapper">
			<c:forEach items="${u1}" var="u">
				<!-- Page Content -->
                <div class="content container-fluid">
                <div class="dropdown action-label">
                                        <a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#" data-toggle="dropdown" >
                                            <i class="fa fa-dot-circle-o text-success"></i> Pending
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="approve_leave.jsp?id=${u.getLeave_id()}"><i class="fa fa-dot-circle-o text-success"></i> Approve</a>
                                            <a class="dropdown-item" href="disapprove_leave.jsp?id=${u.getLeave_id()}"><i class="fa fa-dot-circle-o text-danger"></i> UnApprove</a>
                                        </div>
                                    </div>
					<div class="row">
						<div class="col-md-8 offset-md-2">
						
								<form method="post" enctype="multipart/form-data" action="../leaveupdate">
								
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label>Leave ID<span class="text-danger"></span></label>
											<input class="form-control" type="text" name="leav_id" value="${u.getLeave_id()}">
										</div>
									</div>
									<div class="col-sm-3">
										<div class="form-group">
											<label>Employee ID<span class="text-danger"></span></label>
											<input class="form-control" type="text" name="emp_id" value="${u.getEmp_id()}">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Name <span class="text-danger"></span></label>
											<input class="form-control" type="text" name="name" value="${u.getName()}">
										</div>
									</div>
									
									</div>
								<div class="row">
										<div class="col-sm-4">
										<div class="form-group">
											<label>From date</label>
    									<input type="date" class="form-control" id="startDate" name="startDate" value="${u.getFrom()}">
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>To date</label>
    										<input type="date" class="form-control" id="endDate" name="endDate" value="${u.getEnd()}">
											
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
										
										<input type="hidden" id="result"  name="cal" >
										<label>Day</label>

    									<p class="form-control" >${u.getDay()}</p>

										</div>
										</div>
										<div class="col-sm-2">
										<div class="form-group">
										<label>Apply Day</label>
										<p class="form-control">${u.getApply()}</p>
										</div>
										</div>
									</div>
									
								<div class="row">
									<div class="col-sm-5">
										<div class="form-group">
											<label>Employee Message</label>
											<p class="form-control">${u.getMessage()}</p>
										</div>
									</div>
									<div class="col-sm-5">
										<div class="form-group" >
											<label>Message</label>
											<input class="form-control" type="text" name="message" value="${u.getAd_message()}">
										</div>
									</div>
									<div class="col-sm-3">
										
										<div class="form-group">
											<label>Approve</label>
										<select class="form-control"  name="approve">
  										<option value="0">Approve</option>
										  	<option value="2">Disapprove</option>
										  
											</select>		

									</div>
											
									
									</div>
									</div>
							
                                    
 						<div class="formgroup container-fluid">
						 <input type="file" name="pdf_file" accept=".pdf"/>
 							<input type="hidden" name="file" value="12108864"/> 
 								</div> 
 						<div class="form-group">
            				<button type="submit" class="btn btn-primary btn-lg">Update</button>
        							</div>
</form>

</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->
 </c:forEach>
        </div>
		<!-- /Main Wrapper -->


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
</body>
</html>