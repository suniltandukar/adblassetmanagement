package com.adbl.action;

import java.sql.ResultSet;

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
		udao.adduserdao(username,staffcode,roleid,mid,branchdb);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		request.setAttribute("username",username);
		
		
	}
	

}

