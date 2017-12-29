package com.adbl.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.adbl.action.InitialDetailAddAction;
import com.adbl.action.InventoryAction;
import com.adbl.action.TransferAction;
import com.adbl.action.UserAction;
import com.adbl.dao.OtherActionDAO;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.OtherActionDAOImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.action.OtherAction;

/**
 * Servlet implementation class AddController
 */
@WebServlet("/AddController")
public class AddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("adduseraction.add"))
		{
			UserAction user=new UserAction();
			user.adduser(request,response);
		}
		
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
		if(uri.endsWith("companycode.add"))
		{
			InitialDetailAddAction action=new InitialDetailAddAction(request, response);
			action.addcompanycode(request,response);
		}
		if(uri.endsWith("inventory.add")){
			RequestDispatcher rd=request.getRequestDispatcher("initialdetails.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("updateuser.add"))
		{
		UserAction user=new UserAction();
		user.updateuser(request,response);
		}
		if(uri.endsWith("updateuserrole.add"))
		{
		UserAction user=new UserAction();
		user.updateuserrole(request,response);
		}
		if(uri.endsWith("transferitem.add"))
		{
			TransferAction transfer=new TransferAction();
			transfer.transferitems(request, response);
		}
		if(uri.endsWith("issueitem.add"))
		{
			TransferAction transfer=new TransferAction();
			boolean status=transfer.issueitems(request, response);
			if(status){
				request.setAttribute("msg", "Issue Successful!");
			}
			else{
				request.setAttribute("msg", "Issue Unsuccessful!");
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueitem.jsp");
			rd.forward(request, response);
		}
		
			
		else if(uri.endsWith("viewbillimage.add")){
			OtherAction action=new OtherAction();
			action.viewbillimage(request, response);
		}
		else if(uri.endsWith("billupdate.add")){
			OtherAction action=new OtherAction();
			action.billupdate(request, response);
		}
		else if(uri.endsWith("updateusernamepassword.add")){
			UserAction u=new UserAction();
			u.usernamepasswordupdate(request, response);
		}
	
	}

}
