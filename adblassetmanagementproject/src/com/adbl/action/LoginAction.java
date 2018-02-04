package com.adbl.action;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.LoginDao;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.LoginDaoImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.UserModel;

public class LoginAction {

	public void verifyuser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
		UserModel u=new UserModel();
		String staffcode=request.getParameter("staffcode");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ResultSet userdetail=null;
		
		
		
		LoginDao ldao=  new LoginDaoImpl();
		boolean maindbstatus=ldao.checkmaindb(staffcode, username, password);
		
		
				//for user date validation
		DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		Date todaydate = new Date();
		String enddate=ldao.userenddate(staffcode);
		System.out.println(enddate);
		Date end;
		
			end = dateformat.parse(enddate);
			if (todaydate.compareTo(end) > 0) {
				String msg="Validation Expired!!";
				request.setAttribute("msg", msg);
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
	            
	        }
	if(maindbstatus){
		u.setUsername(request.getParameter("username"));
		u.setPassword(request.getParameter("password"));
		LoginDao l=new LoginDaoImpl();
		
			UserModel userDetail=l.getUserDetail(u);
			System.out.println(userDetail);
			HttpSession session=request.getSession(true);
			session.setAttribute("userDetail", userDetail);
			String currentBranchcode=userDetail.getBranchCode();
			session.setAttribute("currentBranchcode", currentBranchcode);
			
			
			
			UserDao ud=new UserDaoImpl();
			String mainRole=ud.getRoleAssigned(userDetail.getGivenrole());
			session.setAttribute("mainRole", mainRole);
			System.out.println(mainRole);
			
			session.setAttribute("currentBranchFunctions", userDetail.getFunctionAllowed());
			//for log history
			String logged="Login Action";
			UserDao use=new UserDaoImpl();
			boolean status=use.loghistorydao(username,logged);
			
			if(status)
			{
				System.out.println("logged");
			}
				
			else{
				System.out.println("not logged");
			}
			
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			/*userdetail=ldao.userdetail(staffcode, username, password);
			if(userdetail.next()){
			roleid=userdetail.getString("roleid");
			// branchdb=userdetail.getString("branchdbname");
			 System.out.println("latest user branch is "+branchdb);
			}
			ResultSet ulist=ldao.role(roleid);
			
			boolean companydbstatus=ldao.checkcompanydb(staffcode, username, password, branchdb);
			
			if(companydbstatus){
				HttpSession session=request.getSession(true);
				session.setAttribute("userdetail", userdetail);
				request.setAttribute("role", ulist);
				System.out.println(roleid);
				if(roleid.equals("1"))
				{
					session.setAttribute("userrole", "admin");
					
				}
				else
				{
					session.setAttribute("userrole", "staff");
				}
				
				//for log history
				
				
					
					
					String logged="Login Action";
					UserDao use=new UserDaoImpl();
					boolean status=use.loghistorydao(username,logged);
					
					if(status)
					{
						System.out.println("logged");
					}
						
					else{
						System.out.println("not logged");
					}
					
					
					
				
				
				
				
				try{
					//for pop up if inventory arrived
					TransferAction t=new TransferAction();
					ResultSet issueditemdetails=t.issueditemsdetails(request, response);
					request.setAttribute("issueditemdetails", issueditemdetails);
					
				RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
				}catch(Exception e){
					System.out.println(e);
				}
			}
			else{
				try{
					String msg="Unmatched Login Credentials!";
					request.setAttribute("msg", msg);
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
					}catch(Exception e){
						System.out.println(e);
					}			
				}*/
		}
		else{
			try{
				String msg="Unmatched Login Credentials!";
				request.setAttribute("msg", msg);
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				}catch(Exception e){
					System.out.println(e);
				}		
			}
	}
}
