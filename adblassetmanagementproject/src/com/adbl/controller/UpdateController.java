package com.adbl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.action.UpdateAction;
import com.adbl.dao.UpdateDao;
import com.adbl.daoimpl.UpdateDaoImpl;

@WebServlet("/UpdateServlet")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		RequestDispatcher rd=null;
		UpdateAction up=new UpdateAction();

		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/") + 1, uri.length());

		switch (uri) {

		case "group.update":
			request.setAttribute("groupcode", request.getParameter("id"));
			request.setAttribute("groupname", request.getParameter("name"));
			rd=request.getRequestDispatcher("view/edit/group.jsp");
			rd.forward(request, response);

			break;
		case "editGroup.update":
			up.editGroup(request,response);
			break;
		case "updateDepreciation.update":
			up.updateDepreciation(request,response);
			break;

		default:
			out.println("Invalid Action!");
		}

	}

}
