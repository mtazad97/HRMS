<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Table with Search, Sort, and Filter</title>
  <style>
    table {
      font-family: Arial, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: #f2f2f2;
    }

    input[type=text] {
      padding: 8px;
      margin-bottom: 10px;
    }
  </style>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="bean.AttendanceRecord"%>
<%@page import="dao.Attendancedao"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
</head>
<body>





</head>
<body>

    <h2>Date Difference Calculator</h2>

    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate">

    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate">

    <button type="button" onclick="calculateDateDifference()">Calculate Difference</button>

    <p id="result"></p>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="employee/assets/js/tau.js"></script>


</body>
</html>



