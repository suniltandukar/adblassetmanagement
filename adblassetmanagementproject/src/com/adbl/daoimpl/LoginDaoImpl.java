package com.adbl.daoimpl;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.LoginDao;
import com.adbl.model.UserRole;
import com.mysql.jdbc.Connection;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.org.dbconnection.DBConnection;

public class LoginDaoImpl implements LoginDao{
	Connection con=null;
	PreparedStatement ps;
	Statement stmt=null;
	ResultSet rs=null;
	public boolean checkmaindb(String staffcode , String username, String password){
		con=DBConnection.getConnection();
		String query="select * from usertbl where staffcode=? and username=? and password=?";
		
		try{
			ps=con.prepareStatement(query);
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
		}catch(Exception e){System.out.println("checkmaindb error"+e);}
		return false;
	}
	public ResultSet userdetail(String staffcode,String username, String password)
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
		
	
	public boolean checkcompanydb(String staffcode,String username, String password,String branchdb)
	{
		con=DBConnection.getConnectionNext(branchdb);
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
	public ResultSet role(String roleid) throws SQLException{
		String query="select * from rolemgmttbl where roleid='"+roleid+"'";
		try{
			ps=con.clientPrepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			System.out.println("role error"+e);
		}
		return rs;
	}
	

}
