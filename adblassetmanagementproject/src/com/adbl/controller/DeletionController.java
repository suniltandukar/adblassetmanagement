package com.adbl.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.action.InitialDetailDeleteAction;
import com.adbl.action.UserAction;

@WebServlet("/DeletionController")
public class DeletionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeletionController() {

		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.endsWith("company.del")) {
			InitialDetailDeleteAction i;
			try {
				i = new InitialDetailDeleteAction(request, response);
				i.deletecompany(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if (uri.endsWith("group.del")) {
			InitialDetailDeleteAction i;
			try {
				i = new InitialDetailDeleteAction(request, response);
				i.deletegroup(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if (uri.endsWith("fundsource.del")) {
			InitialDetailDeleteAction i;
			try {
				i = new InitialDetailDeleteAction(request, response);
				i.deletefundsource(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if (uri.endsWith("itemcondition.del")) {
			InitialDetailDeleteAction i;
			try {
				i = new InitialDetailDeleteAction(request, response);
				i.deleteitemcondition(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if (uri.endsWith("userrole.del")) {
			UserAction user=new UserAction();
			user.deleteuserrole(request,response);
		}

	}

}
