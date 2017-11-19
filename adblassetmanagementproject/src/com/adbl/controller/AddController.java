package com.adbl.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
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
import com.adbl.action.TransferAction;
import com.adbl.action.UserAction;
import com.adbl.action.OtherAction;

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
			transfer.issueitems(request, response);
		}
		if(uri.endsWith("billupload.add"))
		{
			System.out.println("hello");
			String File_Directory = "E:/spring project/JobPortal/WebContent/cv";
			// this map stores the data except the file
			Map<String,String> formMap = new HashMap<String,String>();
			if (ServletFileUpload.isMultipartContent(request)) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				try {
					@SuppressWarnings("unchecked")
					List<FileItem> multiparts = upload.parseRequest(request);
					
					
					for (FileItem fileItem : multiparts) {
						if (!fileItem.isFormField()) {
							String fileName = new File(fileItem.getName())
									.getName();
							formMap.put(fileItem.getFieldName(), fileName);
							try {
								fileItem.write(new File(File_Directory
										+ File.separator + fileName));
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}
					}
					OtherAction action = new OtherAction();
					action.saveFileData(formMap, request, response);
				} catch (FileUploadException e) {
					e.printStackTrace();
				}

			}
		}
	}
}