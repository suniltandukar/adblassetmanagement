<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <%@page import="java.sql.*" %>
 <%@page import="java.util.*" %>
 <%@page import="com.adbl.model.UserRole" %>
<%if((session.getAttribute("userdetail"))!=null){
	ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
	ResultSet roleid=(ResultSet)request.getAttribute("role");%>
	<jsp:include page="/includefile"></jsp:include>
<!DOCTYPE html>
<html lang="en-US" ng-app="myApp">
<head>
	<style>
	#nav1,#nav2,#nav3,#nav4,#nav5,#nav6,#nav7,#nav8,#nav9,#nav10,#nav11,#nav12,#nav13,#nav14{
	display:none;}

	<%=userdetail.getString("givenrole")%>
	{
display:block;}


</style>
</head>
<body   class="hold-transition skin-blue sidebar-mini" >

<div class="wrapper"  >

  <header class="main-header" >
    <!-- Logo -->
    <a href="" class="logo" style="background-color:#007B38;">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>ADBL</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><%=userdetail.getString("username") %></b>&nbsp;ADBL</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" style="background-color:#007B38;">
      <!-- Sidebar toggle button-->
      <a  class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <span class="navbar-text bg-info"><strong>ARTHIK BARSA (2073-2074)</strong></span>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a class="dropdown-toggle clickable" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">1</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 1 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a>
                      <div class="pull-left">
                        <a href="#"><i class="fa fa-user"></i> Shishir Karki</a>
                         <a href="#"><i class="fa fa-user"></i> Sunil Tandukar</a>
                      </div>
                     
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a class="dropdown-toggle clickable" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">1</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 1 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> abc
                    </a>
                  </li>
                  
                </ul>
              </li>
              <li class="footer"><a class="clickable">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a class="dropdown-toggle clickable" data-toggle="dropdown">
              <i class="fa fa-user"></i>
              <span class="hidden-xs"></span>
            </a>
            <ul class="dropdown-menu">
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a class="clickable">Setting1</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a class="clickable">Setting2</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a class="clickable">Setting3</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a  class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="logout.adbl" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
        <h4><i class="fa fa-user"></i></h4>
        </div>
        <div class="pull-left info">
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-home"></i>
            <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			 <li class="header"><a href="#/!"><i class="fa fa-circle-o"></i> Dashboard</a></li>            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bars"></i>
            <span>Items</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="nav1" ><a href="viewinventory.click" target="iframe_a"><i class="fa fa-circle-o" ></i> View Inventory</a></li>
            <li id="nav2" ><a href="addinventory.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Add Inventory</a></li>
            <li id="nav3" ><a href="editinventory.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Edit Inventory</a></li>
            
          		 
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-exchange"></i>
            <span>Transfer/Issue</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="nav4" ><a href="transferitem.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Transfer Items</a></li>
            <li id="nav5" ><a href="issuedetail.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Issue Details</a></li>
            <li id="nav6" ><a href="issueitem.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Issue Items</a></li>
            <li id="nav7" ><a href="issueconfirmation.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Issue Confirmation</a></li>
            
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-money"></i>
            <span>Bill</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="nav8" ><a href="uploadbill.click" target="iframe_a"><i class="fa fa-circle-o" ></i> Upload Bill</a></li>
            <li id="nav9" ><a href="viewbill.click" target="iframe_a"><i class="fa fa-circle-o" ></i> View Bill</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-cogs"></i>
            <span>Settings</span>
            
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          
          <ul class="treeview-menu">
          	<li class="treeview">
          		<a href="#">
			        <i class="fa fa-users"></i> <span>User Settings</span>
			          <span class="pull-right-container">
			        <i class="fa fa-angle-left pull-right"></i>
			          </span>
         		</a>
          		<ul class="treeview-menu">
          			 	<li id="nav10"><a href="addusers.click" target="iframe_a"><i class="fa fa-circle-o"></i>Manage Users</a></li>
               	 		<li id="nav11"><a href="userrolemanagement.click" target="iframe_a"><i class="fa fa-circle-o"></i>Manage User Roles</a></li>
               	 		<li id="nav12"><a href="changeusernamepassword.click" target="iframe_a"><i class="fa fa-circle-o"></i>Change Username/password</a></li>
          		 		<li id="nav13"><a href="logindetails.click" target="iframe_a"><i class="fa fa-circle-o"></i>Login Details</a></li>
          	
          		 	<%--  <c:if test = "${userrole =='admin'}">
          		 	 </c:if> --%>
         	 
      				
      </ul>
          	</li>
            <li id="nav14"><a href="initialdetails.click" target="iframe_a"><i class="fa fa-circle-o"></i> Add/Edit Initial Details</a></li>
            
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
     
  
  <div class="content-wrapper view"  style="height:1300px;">
  	<iframe height="1000px" width="100%" src="" id="Iframe" name="iframe_a">
	</iframe>
  </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-body">
          <p><b>${msg}</b></p><br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>
<script>
<%if(request.getAttribute("msg")!=null){%>
$('#myModal').modal('show');
<%}%>
</script>
</body>
</html>
<%}else{out.println("No User Session Found!");} %>
