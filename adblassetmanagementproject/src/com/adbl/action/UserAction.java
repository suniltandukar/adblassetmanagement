package com.adbl.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

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

		String username=request.getParameter("username");
		String staffcode=request.getParameter("staffcode");
		String role=request.getParameter("roleid");
		HttpSession session=request.getSession(true);
		ResultSet userdetails=(ResultSet) session.getAttribute("userdetail");
		try{
		String mid=userdetails.getString("mid");
		String branchdb=userdetails.getString("branchdb");
		int roleid=Integer.parseInt(role);
		
		UserDao udao=new UserDaoImpl();
		Boolean status=udao.adduserdao(username,staffcode,roleid,mid,branchdb);
		if(status)
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
						request.setAttribute("roleid", editdetails.getString("roleid"));
						request.setAttribute("roledescription", editdetails.getString("roledescription"));
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
		
		
		
		String userid=request.getParameter("useridforupdate");
		System.out.println(userid);
		
		String username=request.getParameter("username");
		String staffcode=request.getParameter("staffcode");
		String role=request.getParameter("roleid");
		HttpSession session=request.getSession(true);
		ResultSet userdetails=(ResultSet) session.getAttribute("userdetail");
		try{
		String mid=userdetails.getString("mid");
		String branchdb=userdetails.getString("branchdb");
		int roleid=Integer.parseInt(role);
		
		UserDao udao=new UserDaoImpl();
		Boolean status=udao.updateuserdao(username,staffcode,roleid,mid,branchdb,userid);
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
}
	



