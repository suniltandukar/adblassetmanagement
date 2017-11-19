package com.adbl.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.OtherActionDAO;
import com.adbl.daoimpl.OtherActionDAOImpl;




public class OtherAction {

	public void saveFileData(Map<String, String> formMap, HttpServletRequest request,
			HttpServletResponse response) {
		
		String branchdb=request.getParameter("branchdb");
		String billno=request.getParameter("billno");
		String companyname=request.getParameter("companyname");
		String billdate=request.getParameter("billdate");
		String billdateen=request.getParameter("billdateen");
		System.out.println(billno);
		
		
		String billimagename=formMap.get("billimagename");
		System.out.println("filename "+billimagename);
		
		
		OtherActionDAO oad=new OtherActionDAOImpl();
		
		boolean status=oad.uploadbillDao(billno,companyname,billdate,billdateen,billimagename,branchdb);
		
		if(status){
			
			request.setAttribute("msg", "Bill Uploaded.");
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

}
