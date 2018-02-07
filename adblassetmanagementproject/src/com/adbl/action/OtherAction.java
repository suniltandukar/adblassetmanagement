package com.adbl.action;

import java.io.File;
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
			request.setAttribute("companyid", bill.getCompanyid());
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

		public void deletebilldata(HttpServletRequest request, HttpServletResponse response) {
			
			String path=request.getParameter("path");
			String filename=request.getParameter("filename");
			String filepath=path+"/"+filename;
			String billid=request.getParameter("id");
			OtherActionDAO ac=new OtherActionDAOImpl();
			boolean status=ac.deletebilldata(billid);
			if(status){
				System.out.println("filepath="+filepath);
				File file = new File(filepath);
				
		        boolean fileDelete = file.delete();

		            if (fileDelete) 
		            { 
		              request.setAttribute("msg", "Delete Successful !");   
		            } else {
		            	request.setAttribute("msg", "Delete Unsuccessful !");      
		            } 
			}
			else{
				request.setAttribute("msg", "Delete Unsuccessful !");   
			}
			RequestDispatcher rd=request.getRequestDispatcher("view/bill/viewbill.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			
		}

		public void getbilldetail(HttpServletRequest request,
				HttpServletResponse response) {
			String billid=request.getParameter("id");
			HttpSession session=request.getSession(true);
			ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
			String branchdb="";
			try {
				 branchdb=userdetail.getString("branchdb");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			Bill bill=new Bill();
			OtherActionDAO ac=new OtherActionDAOImpl();
			Bill b=ac.getbilldetail(billid, branchdb, bill);
			request.setAttribute("billdata", b);
			
		}

		public void billupdate(HttpServletRequest req,
				HttpServletResponse response) {
			  String billno=req.getParameter("billno");
		      String companyid=req.getParameter("companyid");
		      String billdate=req.getParameter("billdate");
		      String billdateen=req.getParameter("billdateen");
		      String billid=req.getParameter("billid");
		      
		      String[] billdateString=billdate.split("-");
			     String[] billdateenString=billdateen.split("-");
			     String billdateyear=billdateString[0];
			     String billdateenyear=billdateenString[0];
			     String billimagegeneratedname=billdateyear+billno+billdateenyear;
			     
		      HttpSession session=req.getSession(true);
				ResultSet userdetail=(ResultSet)session.getAttribute("userdetail");
				String branchdb="";
				try {
					 branchdb=userdetail.getString("branchdb");
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				Bill bill=new Bill();
				bill.setBillid(billid);
				bill.setBilldate(billdate);
				bill.setBilldateen(billdateen);
				bill.setBillno(billno);
				bill.setBranchdb(branchdb);
				bill.setCompanyid(companyid);
				bill.setBillimagegeneratedname(billimagegeneratedname);
				
				OtherActionDAO ac=new OtherActionDAOImpl();
				boolean status=ac.editbillDao(branchdb, bill);
				if(status){
					req.setAttribute("msg","Update Successful !");
				}
				else{
					req.setAttribute("msg","Update Unsuccessful !");
				}
				RequestDispatcher rd=req.getRequestDispatcher("view/bill/viewbill.jsp");
				try {
					rd.forward(req, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
		}


}
