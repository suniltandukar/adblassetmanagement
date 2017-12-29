<%@page import='java.sql.*'%>
<%@page import='com.org.dbconnection.DBConnection'%>


<%
  String id="";
  id = request.getParameter("id");
   try {
       Connection con=DBConnection.getConnection();
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet rs = smt.executeQuery("select usertbl.userid,usertbl.username,companycodetbl.* from usertbl join companycodetbl on usertbl.cid=companycodetbl.cid where (usertbl.cid='" + id + "');");
    	//String query1="select usertbl.userid,usertbl.username,companycodetbl.* from usertbl join companycodetbl on usertbl.cid=companycodetbl.cid where (cid='" + id + "')";

        %>
        <option value="0" selected>Select User</option>
        <%
        while (rs.next()) {
         %>
         <option value="<%=rs.getString("username")%>"><%=rs.getString("username") %></option>
         <%
          
        }
   
   } catch (Exception e) {
        e.printStackTrace();
   }
  
%>