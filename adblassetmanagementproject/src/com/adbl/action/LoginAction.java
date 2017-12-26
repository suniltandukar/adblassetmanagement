package com.adbl.action;
import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.LoginDao;
import com.adbl.dao.UserDao;
import com.adbl.daoimpl.LoginDaoImpl;
import com.adbl.daoimpl.UserDaoImpl;
import com.adbl.model.UserRole;
import com.org.dbconnection.DBConnection;

public class LoginAction {

	public void verifyuser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
		String staffcode=request.getParameter("staffcode");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ResultSet userdetail=null;
		String branchdb="";
		String roleid="";
		InetAddress ip;
		LoginDao ldao=  new LoginDaoImpl();
		boolean maindbstatus=ldao.checkmaindb(staffcode, username, password);
		
		
				//for user date validation
		DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		Date todaydate = new Date();
		String enddate=ldao.userenddate(staffcode);
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
			userdetail=ldao.userdetail(staffcode, username, password);
			if(userdetail.next()){
			roleid=userdetail.getString("roleid");
			 branchdb=userdetail.getString("branchdbname");
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
				try {
					ip = InetAddress.getLocalHost();
					String ipaddress=ip.toString();
					NetworkInterface network = NetworkInterface.getByInetAddress(ip);

					byte[] mac = network.getHardwareAddress();

					StringBuilder sb = new StringBuilder();
					for (int i = 0; i < mac.length; i++) {
						sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
					}
					String macaddress=sb.toString();
					
					
					
					UserDao use=new UserDaoImpl();
					boolean status=use.loghistorydao(userdetail, ipaddress, macaddress);
					
					if(status)
					{
						System.out.println("logged");
					}
						
					else{
						System.out.println("not logged");
					}
					
					
					
				} catch (Exception e1) {
					System.out.println("ip error//mac error in login action");
					e1.printStackTrace();
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
			}
	}
}
