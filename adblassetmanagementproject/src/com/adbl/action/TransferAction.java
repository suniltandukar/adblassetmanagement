package com.adbl.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.TransferDao;
import com.adbl.daoimpl.TransferDaoImpl;

public class TransferAction {

	public void transferitems(HttpServletRequest request, HttpServletResponse response) {
		String branchdb=request.getParameter("branchdb");
		TransferDao tdao=new TransferDaoImpl(branchdb);
		
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet) session.getAttribute("userdetail");
		
		String branchby="",transferredby="";
		try {
			branchby = userdetail.getString("branchid");
			transferredby=userdetail.getString("username");
		} catch (SQLException e1) {	
			e1.printStackTrace();
		}
		
		String transferredto=request.getParameter("transferedto");
		String branchto=request.getParameter("branchto");
		String transferdate=request.getParameter("transferdate");
		String transferdateen=request.getParameter("transferdateen");
		String[] itemcode=new String[100];
		itemcode=request.getParameterValues("itemcode");
		boolean status=false;
		int i;	
		
		for(i=0;i<itemcode.length;i++){
		tdao.setstatuspending(transferredby,transferredto,branchby,branchto,transferdate,transferdateen,itemcode[i],branchdb);
		String transferid=tdao.gettransferid();
		status=tdao.updatetransferitemstatus(transferid, itemcode[i]);
		}
		
		if(status)
		{
			System.out.println("status pending");
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferitem.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}

		
		
		
		
		
		
				
				

	}
	//to be changed...
	public void issueitems(HttpServletRequest request, HttpServletResponse response) {
		String branchdb=request.getParameter("branchdb");
		TransferDao tdao=new TransferDaoImpl(branchdb);
		
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet) session.getAttribute("userdetail");
		
		String branchby="",issuedby="";
		try {
			branchby = userdetail.getString("branchid");
			issuedby=userdetail.getString("username");
		} catch (SQLException e1) {	
			e1.printStackTrace();
		}
		
		String issuedto=request.getParameter("issuedto");
		String branchto=request.getParameter("branchto");
		String issueddate=request.getParameter("issueddate");
		String issueddateen=request.getParameter("issueddateen");
		String[] itemcode=new String[100];
		itemcode=request.getParameterValues("itemcode");
		boolean status=false;
		int i;	
		
		for(i=0;i<itemcode.length;i++){
		tdao.setissuestatuspending(issuedby,issuedto,branchby,branchto,issueddate,issueddateen,itemcode[i],branchdb);
		String issueid=tdao.getissueid();
		status=tdao.updateissueitemstatus(issueid, itemcode[i]);
		}
		
		if(status)
		{
			System.out.println("status pending");
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/issueitem.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
}
