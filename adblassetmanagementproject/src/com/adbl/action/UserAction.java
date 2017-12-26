package com.adbl.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.UserDao;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.UserRole;

public class UserAction {

	public void adduser(HttpServletRequest request, HttpServletResponse response) {

		 String[] name = request.getParameterValues("role");
		 String role=Arrays.toString(name).replace("[","").replace("]","");
		 String[] allow= request.getParameterValues("branch");
		
		 UserDao udao=new UserDaoImpl();
		 String effectivedate=request.getParameter("edate");
		 String enddate=request.getParameter("enddate");
		 
		String username=request.getParameter("username");
		String staffcode=request.getParameter("staffcode");
		String roles=request.getParameter("roleid");
		HttpSession session=request.getSession(true);
		ResultSet userdetails=(ResultSet) session.getAttribute("userdetail");
		
		try{
		String mid=userdetails.getString("mid");
		String branchdb=userdetails.getString("branchdb");
		int roleid=Integer.parseInt(roles);
		
		
		String id=udao.getrecentid();
		 //for user branch
		 String usercid=request.getParameter("usercid");
		
		 String userbranch=udao.getUserCid(usercid);
		 System.out.println(userbranch+"latest userbranch");
		 
		
		String[] totalbranch=new String[300];
		totalbranch=request.getParameterValues("branch");
		System.out.println(totalbranch[0]+" totla");
		boolean status1=false;
		int i;	
		boolean mainstatus=udao.addusertomainbranch(username,staffcode,roleid,mid,userbranch,role,effectivedate,enddate,usercid);
		
		for(i=0;i<totalbranch.length;i++){
			String code=totalbranch[i];
			String branch=udao.getUserCid(code);
			System.out.println(branch+"brach");
		boolean status=udao.adduserdao(username,staffcode,roleid,mid,branch,role,effectivedate,enddate,usercid);
		System.out.println(totalbranch[0]+" totlal");
	
		
		}
	 
		if(mainstatus)
		{
			request.setAttribute("msg", "User Created Successfully");
			request.setAttribute("username",username);
			request.setAttribute("staffcode", staffcode);
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
			rd.forward(request, response);
			
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
		
		
	}
	public void edituser(HttpServletRequest request, HttpServletResponse response) {

		String userid=request.getParameter("id");
	
		
		UserDao udao=new UserDaoImpl();
		ResultSet editdetails=udao.edituserdao(userid);
		
		if(editdetails!=null)
		{
					try {

						request.setAttribute("update", "update");
						request.setAttribute("updatebtn", "showupdatebutton");
						request.setAttribute("username",editdetails.getString("username"));
						request.setAttribute("staffcode", editdetails.getString("staffcode"));
						request.setAttribute("givenrole", editdetails.getString("givenrole"));
						request.setAttribute("roleid", editdetails.getString("roleid"));
						request.setAttribute("roledescription", editdetails.getString("roledescription"));
						request.setAttribute("edate", editdetails.getString("edate"));
						request.setAttribute("enddate", editdetails.getString("enddate"));
						request.setAttribute("branchname", editdetails.getString("branchname"));
						request.setAttribute("branchdb", editdetails.getString("branchdb"));
						RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
						rd.forward(request, response);
						
					} catch (Exception e) {
						System.out.println("EditUserAction Error");
						e.printStackTrace();
					}
				}
		
	
		} 
		
	public void deleteuser(HttpServletRequest request, HttpServletResponse response) {
		String userid=request.getParameter("id");
		
		
		
		HttpSession session=request.getSession(true);
		ResultSet userdetails=(ResultSet) session.getAttribute("userdetail");
		
		try {

			String branchdb=userdetails.getString("branchdb");
			UserDao dao=new UserDaoImpl();
			Boolean status=dao.deleteuserdao(userid,branchdb);
			
			if(status)
			{
				RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
				try {
					rd.forward(request, response);
					System.out.println("Delete Successful");
				} catch (Exception e) {
					System.out.println("display error");
					e.printStackTrace();
				} 
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
		
		
	}
	public void updateuser(HttpServletRequest request, HttpServletResponse response) {
		
		String[] name = request.getParameterValues("role");
		String role=Arrays.toString(name).replace("[","").replace("]","");
		
		String userid=request.getParameter("useridforupdate");
		String username=request.getParameter("username");
		String staffcode=request.getParameter("staffcode");
		String effectivedate=request.getParameter("edate");
		String enddate=request.getParameter("enddate");
		
		String rolei=request.getParameter("roleid");
		HttpSession session=request.getSession(true);
		ResultSet userdetails=(ResultSet) session.getAttribute("userdetail");
		try{
		String mid=userdetails.getString("mid");
		String branchdb=userdetails.getString("branchdb");
		int roleid=Integer.parseInt(rolei);
		
		UserDao udao=new UserDaoImpl();
		Boolean status=udao.updateuserdao(username,staffcode,roleid,mid,branchdb,userid,role,effectivedate,enddate);
		if(status)
		{
			request.setAttribute("msg", "User Updated Successfully");
			request.setAttribute("username",username);
			request.setAttribute("staffcode", staffcode);
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
			rd.forward(request, response);
			
		}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	public void updateuserrole(HttpServletRequest request, HttpServletResponse response) {
		String roleid=request.getParameter("roleid");
		String roledescription=request.getParameter("roledescription");
		UserDao udao=new UserDaoImpl();
		boolean status=udao.updateuserroledao(roleid, roledescription);
		try{
			String msg="";
		if(status){
			msg="Successful !";
			request.setAttribute("msg", msg);
		}
		else{
			msg="Unsuccessful !";
			request.setAttribute("msg", msg);
		}
		RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/userrolemgmt.jsp");
		rd.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void deleteuserrole(HttpServletRequest request, HttpServletResponse response) {
		String roleid=request.getParameter("id");
		String roledescription=request.getParameter("roledescription");
		UserDao udao=new UserDaoImpl();
		boolean status=udao.deleteuserroledao(roleid);
		try{
			String msg="";
		if(status){
			msg="Successful !";
			request.setAttribute("msg", msg);
		}
		else{
			msg="Unsuccessful !";
			request.setAttribute("msg", msg);
		}
		RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/userrolemgmt.jsp");
		rd.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public void usernamepasswordupdate(HttpServletRequest request,
			HttpServletResponse response) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		HttpSession session=request.getSession();
		ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
		String username="";
		String branchdb="";
		try {
			username=userdetail.getString("username");
			branchdb=userdetail.getString("branchdb");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String newusername=request.getParameter("newusername");
		String newpassword=request.getParameter("newpassword");
		UserDao u=new UserDaoImpl();
		boolean status1=u.updateusernamepasswordInBranchdb(username, newusername, newpassword, branchdb);
		if(status1){
			boolean status2=u.updateusernamepasswordInMaindb(username,newusername,newpassword);
			if(status2){
				request.setAttribute("msg", "Update Successful!");
			}
			else{
				request.setAttribute("msg", "Update Failed!");
			}
		}
		else{
			request.setAttribute("msg", "Update Failed!");
		}
		out.println("Update Successful. Login Again!");
		
	}
	
	
	
}
	



