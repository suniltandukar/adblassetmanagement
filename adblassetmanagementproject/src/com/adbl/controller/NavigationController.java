package com.adbl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NavigationController")
public class NavigationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public NavigationController() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("viewinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventory.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("addinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/addinventory.jsp");
			rd.forward(request, response);
		}
		
				
		if(uri.endsWith("editinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/editinventory.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("initialdetails.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("addusers.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
			rd.forward(request, response);
		}
	
		
	}

}
