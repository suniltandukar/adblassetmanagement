package com.adbl.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.InitialDetailDao;
import com.adbl.daoimpl.InitialDetailDaoImpl;

public class InitialDetailDeleteAction {
	String id,branchdb;
	public InitialDetailDeleteAction(HttpServletRequest request,HttpServletResponse response) throws SQLException{
		id=request.getParameter("id");
	}
	public void deletecompany(HttpServletRequest request,HttpServletResponse response) {
		try {
			InitialDetailDao i=new InitialDetailDaoImpl();
			i.deletecompany(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deletegroup(HttpServletRequest request,HttpServletResponse response) {
		try {
			InitialDetailDao i=new InitialDetailDaoImpl();
			i.deletegroup(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deletefundsource(HttpServletRequest request,HttpServletResponse response) {
		try {
			InitialDetailDao i=new InitialDetailDaoImpl();
			i.deletefundsource(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteitemcondition(HttpServletRequest request,HttpServletResponse response) {
		try {
			InitialDetailDao i=new InitialDetailDaoImpl();
			i.deleteitemcondition(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
