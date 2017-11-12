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
		String[] editdetails=udao.edituserdao(userid);
		
		
		try {
			if(editdetails.length>0)
			{
				try {
					request.setAttribute("update", "update");
					request.setAttribute("username",editdetails[0]);
					request.setAttribute("staffcode", editdetails[1]);
					request.setAttribute("roleid", editdetails[2]);
					request.setAttribute("roledescription", editdetails[3]);
				RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
				rd.forward(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
				
				
			}
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	
		
		
	}
	



