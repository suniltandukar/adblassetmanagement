package com.adbl.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.action.OtherAction;
import com.adbl.action.TransferAction;
import com.adbl.action.UserAction;
import com.adbl.dao.OtherActionDAO;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.OtherActionDAOImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.History;


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
		else if(uri.endsWith("addinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/addinventory.jsp");
			rd.forward(request, response);
		}
				
		else if(uri.endsWith("editinventory.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/editinventory.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("viewinventoryitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/inventory/viewinventoryitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("initialdetails.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/initialdetails/initialdetails.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("addusers.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/adduser.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("userrolemanagement.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/userrolemgmt.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("edituser.click"))
		{
			UserAction action=new UserAction();
			action.edituser(request, response);
			
		}
		else if(uri.endsWith("deleteuser.click"))
		{
			UserAction action=new UserAction();
			action.deleteuser(request, response);
			
		}
		else if(uri.endsWith("transferitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issueitem.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueitem.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issueconfirmation.click"))
		{
			TransferAction t=new TransferAction();
			ResultSet issueditemdetails=t.issueditemsdetails(request, response);
			request.setAttribute("issueditemdetails", issueditemdetails);
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueconfirmation.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("uploadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/uploadbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("viewbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/viewbill.jsp");
			rd.forward(request, response);
		}	
		else if(uri.endsWith("downloadbill.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/downloadbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("editbill.click"))
		{
			OtherAction o=new OtherAction();
			o.getbilldetail(request,response);
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/editbill.jsp");
			rd.forward(request, response);
		}
		else if(uri.endsWith("issuedetail.click"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issuedetails.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("changeusernamepassword.click"))
		{
			HttpSession session=request.getSession();
			ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
			String username="";
			String password="";
			try {
				 username=userdetail.getString("username");
				 password=userdetail.getString("password");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/changeusernamepassword.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("logindetails.click"))
		{
			UserDao userhistory=new UserDaoImpl();
			List<History> hist=userhistory.viewhistory(request,response);
			
			request.setAttribute("list", hist);
			RequestDispatcher rd=request.getRequestDispatcher("view/settings/usersettings/logindetails.jsp");
			rd.forward(request, response);
		}
		
		else if(uri.endsWith("viewuserdetail.click"))
				{
			
			
				}
	
		
	}

}
