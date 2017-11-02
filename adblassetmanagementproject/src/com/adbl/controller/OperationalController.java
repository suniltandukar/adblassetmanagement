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
import javax.servlet.http.HttpSession;

import com.adbl.action.InventoryAction;
import com.adbl.action.LoginAction;

@WebServlet("/OperationalController")
public class OperationalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OperationalController() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
	}
	public void destroy() {
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("login.adbl"))
		{
			LoginAction action=new LoginAction();
			try {
				action.verifyuser(request,response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(uri.endsWith("logout.adbl"))
		{
			HttpSession session=request.getSession(false);
			session.invalidate();
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("addinventory.adbl"))
			
		{
			InventoryAction action=new InventoryAction();
			boolean status=action.addinventory(request,response);
			
			if(status){
				request.setAttribute("msg", "Congrats");
				RequestDispatcher rd=request.getRequestDispatcher("addinventory.jsp");
				rd.forward(request, response);
			}
			else{
				RequestDispatcher rd=request.getRequestDispatcher("addinventory.jsp");
				rd.forward(request, response);
			}
		}
	}

}
