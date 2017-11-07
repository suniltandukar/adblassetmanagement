package com.adbl.action;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.LoginDao;
import com.adbl.daoimpl.LoginDaoImpl;
import com.org.dbconnection.DBConnection;

public class LoginAction {

	public void verifyuser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String staffcode=request.getParameter("staffcode");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ResultSet userdetail=null;
		String branchdb="";
		LoginDao ldao=  new LoginDaoImpl();
		boolean maindbstatus=ldao.checkmaindb(staffcode, username, password);
		if(maindbstatus){
			userdetail=ldao.userdetail(staffcode, username, password);
			
			if(userdetail.next()){
			 branchdb=userdetail.getString("branchdb");
			}
			
			boolean companydbstatus=ldao.checkcompanydb(staffcode, username, password, branchdb);
			
			if(companydbstatus){
				HttpSession session=request.getSession(true);
				session.setAttribute("userdetail", userdetail);
				try{
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
				}catch(Exception e){
					System.out.println(e);
				}
			}
			else{
				try{
					String msg="Unmatched Login Credentials!";
					request.setAttribute("msg", msg);
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
					}catch(Exception e){
						System.out.println(e);
					}			
				}
		}
		else{
			try{
				String msg="Unmatched Login Credentials!";
				request.setAttribute("msg", msg);
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				}catch(Exception e){
					System.out.println(e);
				}		
			}
	}
}
