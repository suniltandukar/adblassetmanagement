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

	public void saveFileData(HttpServletRequest request,
			HttpServletResponse response, Map<String, String> formMap) {
		
		String name=request.getParameter("name");
		
		String filename=formMap.get("fileName");
		
		
		OtherActionDAO oad=new OtherActionDAOImpl();
		
		boolean status=oad.uploadCVDAO(name,filename);
		
		if(status){
			
			request.setAttribute("msg", "CV Uploaded.");
			RequestDispatcher rd=request.getRequestDispatcher("employersuccessful.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else{
			request.setAttribute("error", "Upload UnSuccessful! Please, try again.");
			RequestDispatcher rd=request.getRequestDispatcher("employersuccessful.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	
	}

}
