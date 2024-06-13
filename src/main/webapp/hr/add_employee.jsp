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
        <title>add employee</title>
		
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
										<h3 class="page-title">Add Employee</h3>
										
									</div>
								</div>
							</div>

			<form method="post" action="../a_add_employee">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>First Name <span class="text-danger">*</span></label>
											<input class="form-control" type="text" name="fname" >
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Middle Name</label>
											<input class="form-control " type="text" name="mname">
										</div>
										</div>
										<div class="col-sm-4">
										<div class="form-group">
											<label>Last Name</label>
											<input class="form-control "type="text" name="lname" >
										</div>
									</div>
								</div>
								
									<div class="row">
									
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>City</label>
										<select class="form-control" id="mySelect" onchange="handleSelect(this)" name="city" >
  										<option > select</option>
  										<option value="nagpur">nagpur</option>
										  	<option value="pune">pune</option>
										   <option value="mumbai">mumbai</option>
										   <option value="nasik">nasik</option>
										   <option value="other">Other</option>
											
											</select>		
																	
									</div>
									</div>

									
									<div class="col-sm-6 col-md-6 col-lg-3">
										<div class="form-group">
											<label>Password </label>
											<input class="form-control" type="password" name="password"  >
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label>Date Of Birth</label>
											<input class="form-control" type="date" name=dob >
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label>Gender</label>
										<select class="form-control select" name="gender" >
									  	
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
									<div class="col-sm-8">
										<div class="form-group">
											<label>Mobile Number</label>
											<input class="form-control" type="text" name="contact" value=${u.getContact()}>
										</div>
									</div>
									
								</div>
								</div>
				
								
								<div class="form-group">
            	<button type="submit" class="btn btn-primary btn-lg">add</button>
        </div>
		</form>
		
			</div>
                </div>
				<!-- /Page Content -->
				
            </div>
			<!-- /Page Wrapper -->

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