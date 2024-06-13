<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!-- attendance.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee Attendance</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        .present {
            background-color: #a3f5cf;
        }

        .absent {
            background-color: #ff8f8f;
        }

        #datepicker {
            display: block;
            margin-bottom: 20px;
        }
    </style>

    <!-- Include jQuery and jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- Datepicker script -->
    <script>
        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd',
                onSelect: function(dateText, inst) {
                    // Redirect to the attendance page with the selected date
                    window.location.href = '${pageContext.request.contextPath}/attendance?date=' + dateText;
                }
            });
        });
    </script>
    
    
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.AttendanceRecord"%>
<%@page import="dao.Attendancedao"%>
<% int id =1001;%>
 <% List<AttendanceRecord> list=dao.Attendancedao.getAttendancelist(id);
request.setAttribute("attendanceRecords",list); %> 
</head>
<body>
    <h1>Employee Attendance</h1>
 <!--
    <form action="${pageContext.request.contextPath}/attendance" method="post">
        <label for="employeeId">Employee ID:</label>
        <input type="text" name="employeeId" required>
        
        <label for="isPresent">Present?</label>
        <input type="checkbox" name="isPresent" value="true">
        
        <button type="login">Submit Attendance</button>
    </form>

     <div id="datepicker"></div>  -->

    
    
    <div class="col-md-12 col-lg-6 col-xl-4 d-flex">
							<div class="card card-table ">
								<div class="card-header">
									<h3 class="card-title mb-0">Attendance</h3>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									<input type="text" id="searchInput" placeholder="Search for names">
<label for="entries">Show entries:</label>
<select id="entries" onchange="changeEntries()">
  <option value="10">10</option>
  <option value="20">20</option>
  <option value="50">50</option>
  <option value="all">All</option>
</select>
										<table class="table custom-table mb-0" id="data-table">
											<thead>
												<tr>
													<th>Date </th>
													
													<th class="text-right">Attendance</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${attendanceRecords}" var="record" >
												<tr>
													<td>
														<h2>${record.getDate()}</h2>
														<input type="hidden"  value="${record.getDate()}" name="date">
													</td>
													
													<td >
														<div class="dropdown dropdown-action">
															<div class="dropdown-menu dropdown-menu-right">
															<h3 >${record.getPresent()}</h3>
																<a class="dropdown-item" href="attendanceview.jsp?id=${record.getAtt_id()}"><i class="fa fa-pencil m-r-5"></i> view</a>
															</div>
														</div>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-footer">
									<a href="#">View all projects</a>
								</div>
							</div>
						</div>
				
				
				
				<!-- /Page Content -->
    

    <script src="assets/js/tau.js"></script>
    
</body>
</html>
   

  
   

