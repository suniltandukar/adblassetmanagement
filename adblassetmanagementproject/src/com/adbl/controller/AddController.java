package com.adbl.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.action.InitialDetailAddAction;
import com.adbl.action.UserAction;

/**
 * Servlet implementation class AddController
 */
@WebServlet("/AddController")
public class AddController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("group.add"))
		{
			InitialDetailAddAction action=new InitialDetailAddAction(request, response);
			try {
				action.addgroup(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("itemcondition.add"))
		{
			InitialDetailAddAction action=new InitialDetailAddAction(request, response);
			try {
				action.additemcondition(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("fundsource.add"))
		{
			InitialDetailAddAction action=new InitialDetailAddAction(request, response);
			try {
				action.addfundsource(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
			
		}
		if(uri.endsWith("company.add"))
		{
			InitialDetailAddAction action=new InitialDetailAddAction(request, response);
			try {
				action.addcompany(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("inventory.add")){
			RequestDispatcher rd=request.getRequestDispatcher("initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("adduseraction.add"))
		{
			UserAction user=new UserAction();
			user.adduser(request,response);
		}
		if(uri.endsWith("updateuser.add"))
		{
		UserAction user=new UserAction();
		user.updateuser(request,response);
		}
	}

}
