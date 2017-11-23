package com.adbl.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.OtherActionDAO;
import com.adbl.daoimpl.OtherActionDAOImpl;
import com.adbl.model.Bill;
import com.oreilly.servlet.MultipartRequest;




public class OtherAction {
	private final String UPLOAD_DIRECTORY = "C:/Users/Sunil/git/adblassetmanagementproject/WebContent/view/uploadedbills";

	public void saveFileData(HttpServletRequest request,
			HttpServletResponse response, Bill bill) {
		    	
		
		OtherActionDAO oad=new OtherActionDAOImpl();
		
		boolean status=oad.uploadbillDao(bill);
		
		if(status){
		
			request.setAttribute("msg", "Bill Uploaded.");
			request.setAttribute("billno", bill.getBillno());
			request.setAttribute("companyname", bill.getCompanyname());
			request.setAttribute("billname", bill.getBillimagename());
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/uploadbill.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		else{
			request.setAttribute("error", "Upload UnSuccessful! Please, try again.");
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/uploadbill.jsp");
			try {
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	
	}
	
	public void editBill(HttpServletRequest request,
			HttpServletResponse response)
	{
		String billid=request.getParameter("id");
		HttpSession session=request.getSession(true);
		ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
		String branchdb="";
		try {
			 branchdb=userdetail.getString("branchdb");
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		OtherActionDAO ac=new OtherActionDAOImpl();
		ResultSet bill=ac.editbillDao(branchdb,billid);
		
		try {
			if(bill.next()){
				request.setAttribute("billno", bill.getString("billno"));
				request.setAttribute("billdate", bill.getString("billdate"));
				request.setAttribute("billdateen", bill.getString("billdateen"));
				request.setAttribute("companyname", bill.getString("companyname"));
				
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
		public void viewbillimage(HttpServletRequest request,
				HttpServletResponse response)
		{
			String billid=request.getParameter("id");
			HttpSession session=request.getSession(true);
			ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
			String branchdb="";
			try {
				 branchdb=userdetail.getString("branchdb");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			
			OtherActionDAO ac=new OtherActionDAOImpl();
			ResultSet bill=ac.viewbillimageDao(branchdb,billid);
			
			try {
				if(bill!=null){
					request.setAttribute("msg", "billname");
					request.setAttribute("billno", bill.getString("billno"));
					request.setAttribute("billdate", bill.getString("billdate"));
					request.setAttribute("billdateen", bill.getString("billdateen"));
					request.setAttribute("companyname", bill.getString("companyname"));
					request.setAttribute("billimageoriginalname", bill.getString("billimageoriginalname"));
					
					RequestDispatcher rd=request.getRequestDispatcher("view/bill/viewbill.jsp");
					try {
						rd.forward(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					} 
					
					
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

}
