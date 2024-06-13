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
        <title>Admin</title>
		
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
		<%@page import="java.util.*"%>
		  <%@page import="dao.empdao"%>
		  <%@page import="bean.user"%>
		  <%@page import="dao.admindao"%>	  
		   <%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	   
		   
    </head>
<body>
	
	<div class="row">
    <div class="col-md-12 d-flex">
        <div class="card card-table flex-fill">
            <div class="card-header">
                <h3 class="card-title mb-0">Employee List</h3>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                
         <form method="post" >
                    <table class="table custom-table mb-0">
                    <% List<user> list=admindao.getTotalList(); 
						request.setAttribute("total",list); %>
                        <thead>
                            <tr>
                                <th>emp_id</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Contact</th>
                                <th>Salary</th>

                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        
                         <tbody>
                                <c:forEach items="${total}" var="u">
                            <tr>
                                <td> ${u.getEmp_id()}</td>
                                <td>
                                   ${u.getFname()} ${u.getLname()}
                                </td>
                                <td>${u.getEmail()}</td>
                                <td>${u.getContact()}</td>
                                <td>
                                    salary
                                </td>
                                <td class="text-right">
                                    <div class="dropdown dropdown-action">
                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="a_emp_profile.jsp?id=${u.getEmp_id()}"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                            <a class="dropdown-item" href=""><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
				</div>
				
				<!-- /Page Content -->
		
            </div>
			<!-- /Page Wrapper -->
			
        </div>
        	<div class="form-group">
            	<a  href="add_employee.jsp" class="btn btn-primary btn-lg">Add</a>
        </div>
        
        
		<!-- /Main Wrapper -->
		
		<!-- jQuery -->
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