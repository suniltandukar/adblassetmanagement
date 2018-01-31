package com.adbl.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.model.UserModel;
import com.adbl.user.action.UserAction;
import com.adbl.user.dao.UserDao;
import com.adbl.user.daoImpl.UserDaoImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		if(uri.endsWith("adduser.user"))
		{
		
			UserDao userdao=new UserDaoImpl();
			List<UserModel> userInfo=userdao.getexistingusers();
			request.setAttribute("userInfo",userInfo);
			
			List<String> rolename=userdao.getRoleName();
			request.setAttribute("rolename", rolename);
			
			List<UserModel> branchlist=userdao.getBranchList();
			request.setAttribute("branchlist", branchlist);
			
			RequestDispatcher rd=request.getRequestDispatcher("view/UserSetting/adduser.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("adduseraction.user"))
		{
			UserAction user=new UserAction();
			user.adduseraction(request,response);
		}
		if(uri.endsWith("addusergroup.user"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("view/UserSetting/insertUserGroup.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("insertusergroup.user")){
			UserAction user=new UserAction();
			user.insertusergroup(request,response);
			
		}
		if(uri.endsWith("deleteusernav.user"))
		{
			UserDao userdao=new UserDaoImpl();
			List<UserModel> userInfo=userdao.getexistingusers();
			request.setAttribute("userInfo",userInfo);
			RequestDispatcher rd=request.getRequestDispatcher("view/UserSetting/adduser.jsp");
			rd.forward(request, response);
		}
		if(uri.endsWith("deleteuser.user"))
		{
			UserAction user=new UserAction();
			user.deleteuseraction(request,response);
		}
		if(uri.endsWith("edituser.user"))
		{
			UserAction user=new UserAction();
			user.edituseraction(request,response);
			
		}
		if(uri.endsWith("updateuser.user"))
		{
			UserAction user=new UserAction();
			user.updateuseraction(request,response);
		}
	}

}
