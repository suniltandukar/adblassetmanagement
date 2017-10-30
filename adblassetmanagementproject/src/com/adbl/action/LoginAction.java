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
		
		LoginDao ldao=  new LoginDaoImpl();
		ResultSet userdetail=ldao.verifyuserDao(staffcode, username, password);
		String branchdb="adblheadofficedb";
		
		if(userdetail.next()==true){
			HttpSession session=request.getSession(true);
			session.setAttribute("userdetail", userdetail);
			DBConnection.getConnectionNext(branchdb);
			boolean status=ldao.verifybranchuserDao(staffcode, username, password);
			if(status)
			{
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		}
		else{
			String msg="Invalid Login Credentials!";
			request.setAttribute("msg", msg);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
