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
		
		<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.user"%>
<%@page import="dao.admindao"%>

<%
String id_total = request.getParameter("id");
int id = Integer.parseInt(id_total);
%>
		<% user ua= admindao.emp_Profile(id); 
		request.setAttribute("u",ua); %> 
    </head>
    <body>
		
			
			<!-- Page Wrapper -->
            <div class="page-wrapper">
			
				<!-- Page Content -->
                <div class="content container-fluid">
					<div class="row">
						<div class="col-md-8 offset-md-2">
						
							<!-- Page Header -->
							<div class="page-header">
								<div class="row">
									<div class="col-sm-12">
										<h3 class="page-title">Profile</h3>
										
									</div>
								</div>
							</div>
							<!-- /Page Header -->
							
							<form method="post" action="../emp_updateprofile">
							<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>ID <span class="text-danger">*</span></label>
											<input class="form-control" type="text" name="emp_id" value=${u.getEmp_id()}>
										</div>
									</div>
									</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>First Name <span class="text-danger">*</span></label>
											<input class="form-control" type="text" name="fname" value=${u.getFname()}>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Middle Name</label>
											<input class="form-control " type="text" name="mname" value=${u.getMname()}>
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>Last Name</label>
											<input class="form-control "type="text" name="lname" value=${u.getLname()}>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label>Address</label>
											<input class="form-control " type="text" name="address" value=${u.getAddress()} >
										</div>
									</div>
									</div>
									<div class="row">
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group" >
											<label>Country</label>
											<select class="form-control select" id="mySelect" onchange="handleSelect(this)" name="country">
											<option value="${u.getCountry()}">${u.getCountry()}</option>
												<option value="India">Indin</option>
											
											</select>
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>City</label>
										<select class="form-control" id="mySelect" onchange="handleSelect(this)" name="city" >
  										<option value="${u.getCity()}">${u.getCity()}</option>
  										<option value="nagpur">nagpur</option>
										  	<option value="pune">pune</option>
										   <option value="mumbai">mumbai</option>
										   <option value="nasik">nasik</option>
										   <option value="other">Other</option>
											
											</select>		
									<input type="text" id="otherText" style="display: none;" name="city" placeholder="Enter your option">
																	
									</div>
									</div>

									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>State/Province</label>
											<select class="form-control" id="mySelect" onchange="handleSelect(this)" name="state" >
											<option  value="${u.getState()}">${u.getState()}</option>
												<option value="Maharashtra">Maharashtra</option>
												<option value="MP">MP</option>
												<option value="Delhy">Delhy</option>
												<option value="other">Other</option>	 
											
											<option> <input "text" id="otherText" style="display: none;" name="state" placeholder="Enter your option"> </option>
											</select> 
										</div>
										
									</div>
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Postal Code</label>
											<input class="form-control" type="number" name="postal" value="${u.getPoster_code()}" >
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>Date Of Birth</label>
											<input class="form-control" type="date" name=dob value="${u.getDob()}">
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Gender</label>
										<select class="form-control select" name="gender" value="${u.getGender()}">
									  	
									  	<option value="male">Male</option>
									  	<option value="female">Female</option>
									    <option value="other">Other</option>	
									    </select> 									
									    </div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Department</label>
										<select class="form-control" id="mySelect" onchange="handleSelect(this)" name="department">
									  	<option value="${u.getDepartment()}">${u.getDepartment()} </option>
									  	<option value="java fullstact">Java Fullstact</option>
									  	<option value="saleforce">Saleforce</option>
									  	<option value="database">DataBase</option>
									  	<option value="mant">Mant</option>
									    <option value="other">Other</option>
									    </select>
											<input type="text" id="otherText" style="display: none;" name="department" placeholder="Enter your option">
										</div>
									</div>
								</div> 
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Email</label>
											<input class="form-control" type="email" name="email" value=${u.getEmail()} >
										</div>
									</div>
									
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label>Mobile Number</label>
											<input class="form-control" type="text" name="contact" value=${u.getContact()}>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label>GitHub Id</label>
											<input class="form-control" type="text" name="github" value="${u.getGithub()}">
										</div>
									</div>
								</div>
								</div>
				
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label>Website Url</label>
											<input class="form-control" type="text" name="url" value="${u.getUrl()}" >
										</div>
									</div>
									
								</div>
								<div class="form-group">
            	<button type="submit" class="btn btn-primary btn-lg">update</button>
        </div>
							</form>
						</div>
					</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->

        </div>
		<!-- /Main Wrapper -->

		<!-- jQuery -->
		
<script>
    function handleSelect(selectElement) {
      var otherText = document.getElementById('otherText');

      if (selectElement.value === 'other') {
        otherText.style.display = 'block'; // Show the input field
      } else {
        otherText.style.display = 'none'; // Hide the input field
      }
    }
  </script>
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