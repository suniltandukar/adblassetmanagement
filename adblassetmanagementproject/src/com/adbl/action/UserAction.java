package com.adbl.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.UserDao;
import com.adbl.daoimpl.UserDaoImpl;

public class UserAction {

	public void adduser(HttpServletRequest request, HttpServletResponse response) {

		String username=request.getParameter("username");
		String staffcode=request.getParameter("staffcode");
		String role=request.getParameter("role");
		String branchdb=request.getParameter("branchdb");
		
		UserDao udao=new UserDaoImpl();
		udao.adduserdao(username,staffcode,role);
		
	}
	

}
