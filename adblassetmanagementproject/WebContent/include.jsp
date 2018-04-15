 <%@page import="java.sql.*" %>
 <%@page import="java.util.*" %>
 <%@page import="com.adbl.model.UserRole" %>

<!DOCTYPE html>
<html lang="en-US" ng-app="myApp">
<head>
	 <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/button.dataTables.min.css">
  
 
  
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="assets/css/ionicons.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
  <link rel="stylesheet" type="text/css" href="assets/nepaliDatePicker/nepali.datepicker.v2.2.min.css" />
  <!-- Theme style -->
  <link rel="stylesheet" href="assets/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="assets/css/_all-skins.min.css">

  <!-- Google Font -->
   <link href="assets/css/switchery.min.css" rel="stylesheet">
    <link href="assets/css/bootstrap-tagsinput.css" rel="stylesheet">
  <style type="text/css">
  	a {
    cursor: pointer;
}
  </style>
</head>


<div class="new">
 
 <script src="assets/js/jquery.min.js"></script>
 <!-- jQuery 3 -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/dateConverter.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="assets/nepaliDatePicker/nepali.datepicker.v2.2.min.js"></script>
<script type="text/javascript" src="assets/js/jszip.min.js"></script>
<script type="text/javascript" src="assets/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="assets/js/buttons.print.min.js"></script>
<script type="text/javascript" src="assets/js/buttons.colVis.min.js"></script>
<script type="text/javascript" src="assets/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="assets/js/pdfmake.min.js"></script>
<script type="text/javascript" src="assets/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="assets/js/vfs_fonts.js"></script>


<!-- jQuery UI 1.11.4 -->
<script src="assets/js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 3.3.7 -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/adminlte.min.js"></script>
<script src="assets/js/validator.js"></script>
<!-- jQuery Tags Input -->
    <script type="text/javascript" src="template/js/jquery.tagsinput.js"></script>
    
   
</div>
