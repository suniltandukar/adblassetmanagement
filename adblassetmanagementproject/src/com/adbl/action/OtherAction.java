package com.adbl.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
