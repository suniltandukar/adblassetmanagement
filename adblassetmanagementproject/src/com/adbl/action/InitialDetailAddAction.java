package com.adbl.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.InitialDetailDao;
import com.adbl.daoimpl.InitialDetailDaoImpl;
import com.adbl.model.Model;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class InitialDetailAddAction {
	String branchdb="";
	public InitialDetailAddAction(HttpServletRequest request,HttpServletResponse response)  {
		branchdb=request.getParameter("branchdb");
	}
	
	public void addgroup(HttpServletRequest request,HttpServletResponse response) throws SQLException {
		String groupcode=request.getParameter("groupcode");
		String groupname=request.getParameter("groupname");
		InitialDetailDao i=new InitialDetailDaoImpl(branchdb);
		i.addgroup(groupcode, groupname);
	}

	public void additemcondition(HttpServletRequest request,HttpServletResponse response) throws SQLException {
		String itemconditionname=request.getParameter("itemconditionname");
		InitialDetailDao i=new InitialDetailDaoImpl(branchdb);
		i.additemcondition(itemconditionname);
		
	}

	public void addfundsource(HttpServletRequest request,HttpServletResponse response) throws SQLException{
		String sourcename=request.getParameter("sourcename");
		InitialDetailDao i=new InitialDetailDaoImpl(branchdb);
		i.addfundsource(sourcename);
		
	}

	public void addcompany(HttpServletRequest request,HttpServletResponse response) throws SQLException{
		Model m=new Model();
		m.setVatpan(request.getParameter("vatpan"));
		m.setCompanyname(request.getParameter("companyname"));
		m.setCompanyaddress(request.getParameter("companyaddress"));
		m.setCompanycontactno(request.getParameter("companycontactno"));
		m.setCompanyemail(request.getParameter("companyemail"));
		m.setCompanycontactperson(request.getParameter("companycontactperson"));
		InitialDetailDao i=new InitialDetailDaoImpl(branchdb);
		i.addcompany(m);
	}

	public void addcompanycode(HttpServletRequest request, HttpServletResponse response) {

		String companyname=request.getParameter("companyname");
		String companyaddress=request.getParameter("companyaddress");
		String companycode=request.getParameter("companycode");
		
		InitialDetailDao dao=new InitialDetailDaoImpl("adblheadofficedb");
		dao.addcompanycode(companyname,companyaddress,companycode);
			
	}

}
