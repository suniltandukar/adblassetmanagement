package com.adbl.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.action.CheckAction;

/**
 * Servlet implementation class CheckController
 */
@WebServlet("/CheckController")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CheckController() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
	}
	public void destroy() {
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("username.check")){
			CheckAction c=new CheckAction();
			c.checkusername(request,response);
		}
		if(uri.endsWith("staffcode.check")){
			CheckAction c=new CheckAction();
			c.checkstaffcode(request,response);
		}
	
		
	
	}

}
