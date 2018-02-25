<jsp:include page="/includefile"></jsp:include>
<div class="breadcrumb-line">
			<nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item"><i class="fa fa-home" aria-hidden="true"></i>&nbsp;<a href="#">Home</a></li>
			      <li class="breadcrumb-item active" aria-current="page">Issue</li>
			    <li class="breadcrumb-item active" aria-current="page">Staff Item Details</li>
			  </ol>
			</nav>
		</div>
<div class="panel panel-default" style="width: 100%; margin: auto;">
    <div class="panel-heading">
    	<h6><strong>Insert Staff Code</strong></h6>
    	<form action="showStaffItemDetails.click" method="post">
    	<%String staffCode= request.getParameter("id");%>
    	<%if(staffCode!=null){ %>
    	<input type="text" name="staffCode" class="form-control staffCode" style="width:20%;" value="<%=staffCode%>"> 
    	<%}else{ %> 
    	<input type="text" name="staffCode" class="form-control staffCode" style="width:20%;"> 
    	<%} %>
    	<br>
    	<input type="submit" class="btn btn-info searchbtn" value="SEARCH" >
    	</form>
    </div>
     </div>
<div class="displayform">
</div>
