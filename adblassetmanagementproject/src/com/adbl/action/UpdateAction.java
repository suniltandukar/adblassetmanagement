package com.adbl.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.UpdateDao;
import com.adbl.daoimpl.UpdateDaoImpl;

public class UpdateAction {
	UpdateDao up = new UpdateDaoImpl();
	RequestDispatcher rd = null;

	public void editGroup(HttpServletRequest request, HttpServletResponse response) {

		String groupcode = request.getParameter("groupcode"), groupname = request.getParameter("groupname"),
				igroupcode = request.getParameter("igroupcode");

		boolean status = up.editGroup(groupcode, groupname, igroupcode);
		if (status) {
			request.setAttribute("msg", "Update Successful!");
		} else {
			request.setAttribute("msg", "Update Failed!");
		}
		rd = request.getRequestDispatcher("initialdetails.click");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	public void updateDepreciation(HttpServletRequest request, HttpServletResponse response) {
		String lastyrdep = request.getParameter("lastyrdep");
		String did = request.getParameter("did");
		boolean status = up.updateDepreciation(did, lastyrdep);
		if (status) {
			request.setAttribute("msg", "Update Successful!");
		} else {
			request.setAttribute("msg", "Update Failed!");
		}
		rd = request.getRequestDispatcher("viewDep.click");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
