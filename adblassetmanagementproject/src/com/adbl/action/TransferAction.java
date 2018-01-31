package com.adbl.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.InventoryDao;
import com.adbl.dao.TransferDao;
import com.adbl.daoimpl.InventoryDaoImpl;
import com.adbl.daoimpl.TransferDaoImpl;

public class TransferAction {

	public void transferitems(HttpServletRequest request, HttpServletResponse response) {
		String branchdb=request.getParameter("branchdb");
		TransferDao tdao=new TransferDaoImpl();
		
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet) session.getAttribute("userdetail");
		
		String branchby="",transferredby="";
		try {
			branchby = userdetail.getString("cid");
			System.out.println("Branch By "+branchby);
			transferredby=userdetail.getString("username");
		} catch (SQLException e1) {	
			e1.printStackTrace();
		}
		
		String transferredto=request.getParameter("touser");
		System.out.println(transferredto+" to user id");
		String branchto=request.getParameter("tobranch");
		System.out.println(branchto);
		String transferdate=request.getParameter("transferdate");
		String transferdateen=request.getParameter("transferdateen");
		String[] itemcode=new String[100];
		itemcode=request.getParameterValues("itemcode");
		boolean status=false;
		int i;	
		String branchname=request.getParameter("branchname");
		
		for(i=0;i<itemcode.length;i++){
		tdao.setstatuspending(transferredby,transferredto,branchby,branchto,transferdate,transferdateen,itemcode[i],branchdb,branchname);
		String transferid=tdao.gettransferid();
		status=tdao.updatetransferitemstatus(transferid, itemcode[i]);
		}
		
		if(status)
		{
			System.out.println("status pending");
			request.setAttribute("msg", "Transfer Successfull");
			RequestDispatcher rd=request.getRequestDispatcher("view/transferissue/transferitem.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}

	}
	//to be changed...
	public boolean issueitems(HttpServletRequest request, HttpServletResponse response) {
		String branchdb=request.getParameter("branchdb");
		TransferDao tdao=new TransferDaoImpl();
		
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
		String issueddate=request.getParameter("issueddate");
		String issueddateen=request.getParameter("issueddateen");
		
		String[] itemcode=new String[100];
		itemcode=request.getParameterValues("itemcode");
		boolean status=false;
		int i;	
		
		for(i=0;i<itemcode.length;i++){
		tdao.setissuestatuspending(issuedby,issuedto,issueddate,issueddateen,itemcode[i]);
		String issueid=tdao.getissueid();
		status=tdao.updateissueitemstatus(issueid, itemcode[i]);
		}
		
		return status;
		
	}
	public ResultSet issueditemsdetails(HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
		String branchdb="";
		String username="";
		try {
			 branchdb=userdetail.getString("branchdb");
			 username=userdetail.getString("username");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		TransferDao t=new TransferDaoImpl();
		ResultSet issueditemdetails=t.getissueditemdetails(username);
		
		return issueditemdetails;
	}
	public ResultSet transferitemsdetails(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
		String cid="";
		String username="";
		try {
			 cid=userdetail.getString("cid");
			 System.out.println("branchdb"+cid);
			 username=userdetail.getString("username");
			 System.out.println(username+" is userid");
			 TransferDao t=new TransferDaoImpl();
			 ResultSet transferdetails=t.getransferdetails(cid,username);
			 return transferdetails;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void transferitembranch(HttpServletRequest request, HttpServletResponse response) {
		
		String newcid=request.getParameter("cid");
		String transferid=request.getParameter("transferid");
		String statusid=request.getParameter("statusid");
		InventoryDao trans= new InventoryDaoImpl();
		if(statusid.equals("2")){
		boolean status=trans.transferitembranchdao(newcid,transferid);
	
		
		if(status)
		{
			boolean stats=trans.changeitemstatus(transferid,statusid);
			ResultSet rs=trans.getitemcode(transferid);
			
			String itemcode;
			try {
				itemcode = rs.getString("itemcode");
				System.out.println("your itemcode is "+itemcode);
				boolean record=trans.savetransferstatus(transferid,itemcode);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			
			
			request.setAttribute("msg", "Transfer Successfull");
			RequestDispatcher rd=request.getRequestDispatcher("pendingtransfers.click");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			}
			else{
				request.setAttribute("msg", "Transfer Unsuccessfull");
				RequestDispatcher rd=request.getRequestDispatcher("pendingtransfers.click");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		}
			
		else 
		{
			boolean stats=trans.changeitemstatus(transferid,statusid);
			
			if(stats){
			request.setAttribute("msg", "Transfer Rejected !");
			RequestDispatcher rd=request.getRequestDispatcher("pendingtransfers.click");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			}
			else{
				request.setAttribute("msg", "Transfer Rejection Failed!");
				RequestDispatcher rd=request.getRequestDispatcher("pendingtransfers.click");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
	}

}
