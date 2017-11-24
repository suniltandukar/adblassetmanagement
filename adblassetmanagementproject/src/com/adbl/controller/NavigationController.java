package com.adbl.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.action.TransferAction;
import com.adbl.action.UserAction;

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
		if(uri.endsWith("viewinventoryitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventoryitem.jsp");
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
		if(uri.endsWith("userrolemanagement.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/userrolemgmt.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("edituser.click"))
		{
			UserAction action=new UserAction();
			action.edituser(request, response);
			
		}
		if(uri.endsWith("deleteuser.click"))
		{
			UserAction action=new UserAction();
			action.deleteuser(request, response);
			
		}
		if(uri.endsWith("transferitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferitem.jsp");
			rd.forward(request, response);
			
		}
		if(uri.endsWith("issueitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueitem.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("issueconfirmation.click"))
		{
			TransferAction t=new TransferAction();
			ResultSet issueditemdetails=t.issueditemsdetails(request, response);
			request.setAttribute("issueditemdetails", issueditemdetails);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueconfirmation.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("uploadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/uploadbill.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("viewbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/viewbill.jsp");
			rd.forward(request, response);
		}	
		if(uri.endsWith("deletebill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("");
			rd.forward(request, response);
		}
		if(uri.endsWith("downloadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/downloadbill.jsp");
			rd.forward(request, response);
		}
		
		
	
		
	}

}
