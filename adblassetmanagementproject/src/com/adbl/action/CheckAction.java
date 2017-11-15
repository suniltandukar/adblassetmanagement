package com.adbl.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.CheckDao;
import com.adbl.daoimpl.CheckDaoImpl;

public class CheckAction {

	public void checkusername(HttpServletRequest request,HttpServletResponse response) {
		try {
			PrintWriter out=response.getWriter();
			String id=request.getParameter("id");
			String checkusername="username";
			CheckDao c=new CheckDaoImpl();
			boolean status=c.checkusernamedao(id,checkusername);
			if(status){
				out.println("<h5 class='red'>Unavailable!</h5>");
			}
			else{
				out.println("<h5 class='green'>Available!</h5>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public void checkstaffcode(HttpServletRequest request,HttpServletResponse response) {
		try {
			PrintWriter out=response.getWriter();
			String id=request.getParameter("id");
			String checkstaffcode="staffcode";
			CheckDao c=new CheckDaoImpl();
			boolean status=c.checkusernamedao(id,checkstaffcode);
			if(status){
				out.println("<h5 class='red'>Unavailable!</h5>");
			}
			else{
				out.println("<h5 class='green'>Available!</h5>");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
