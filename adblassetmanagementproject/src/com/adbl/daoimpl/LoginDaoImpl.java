package com.adbl.daoimpl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.LoginDao;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import com.org.dbconnection.DBConnection;

public class LoginDaoImpl implements LoginDao{
	Connection con=null;
	PreparedStatement ps;
	Statement stmt=null;
	ResultSet rs=null;
	public ResultSet verifyuserDao(String staffcode,String username, String password)
	{
		ResultSet userdetail=null;
		String query="";
		con=DBConnection.getConnection();
		try{
		query="SELECT usertbl.*,branchdetailtbl.* FROM usertbl join mainusertbl on usertbl.mid=mainusertbl.mid JOIN branchdetailtbl on mainusertbl.branchid=branchdetailtbl.branchid where usertbl.staffcode='"+staffcode+"' and usertbl.username='"+username+"' and usertbl.password='"+password+"'";
		stmt=con.createStatement();
		userdetail=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println(e);
		}
		return userdetail;
	}
		
	
	public boolean verifybranchuserDao(String staffcode,String username, String password)
	{
		con=DBConnection.getConnection();
		try{
		ps=con.prepareStatement("SELECT * from usertbl where staffcode=? and username=? and password=?");
		ps.setString(1, staffcode);
		ps.setString(2, username);
		ps.setString(3, password);
		rs=ps.executeQuery();
		if(rs.next()){
			con.close();
			ps=null;
			rs=null;
			return true;
		}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	

}
