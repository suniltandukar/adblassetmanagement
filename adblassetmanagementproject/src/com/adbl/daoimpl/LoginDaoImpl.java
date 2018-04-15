package com.adbl.daoimpl;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.action.Generator;
import com.adbl.dao.LoginDao;
import com.adbl.model.UserModel;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class LoginDaoImpl implements LoginDao{
	Connection con=null;
	PreparedStatement ps;
	Statement stmt=null;
	ResultSet rs=null;
	public boolean checkmaindb(String staffcode , String username, String password){
		String query="select * from usertbl where staffCode=? and username=? and password=?";
		try{
			con=DBConnection.getConnection();
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
		query="SELECT usertbl.*,branchdetailtbl.*,companycodetbl.branchdbname,companycodetbl.name FROM usertbl join mainusertbl on usertbl.mid=mainusertbl.mid JOIN branchdetailtbl on mainusertbl.branchid=branchdetailtbl.branchid join companycodetbl on companycodetbl.cid=usertbl.cid where usertbl.staffcode='"+staffcode+"' and usertbl.username='"+username+"' and usertbl.password='"+password+"'";
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
	public ResultSet role(String roleid) throws SQLException{
		String query="select * from rolemgmttbl where roleid='"+roleid+"'";
		try{
			con=DBConnection.getConnection();
			ps=con.clientPrepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			System.out.println("role error"+e);
		}
		return rs;
	}
	public String userenddate(String staffcode) {
		try {
			String query="select endDate from usertbl where staffcode=?";
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, staffcode);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getString("endDate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	public UserModel getUserDetail(UserModel u){
		UserModel um=null;
		String query="Select * from usertbl where username=? and password=?";
		try{
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			rs=ps.executeQuery();
			while(rs.next()){
				um=new UserModel();
				um.setUsername(rs.getString("username"));
				um.setPassword(rs.getString("password"));
				um.setFullName(rs.getString("fullName"));
				um.setPost(rs.getString("post"));
				um.setStatus(rs.getString("status"));
				um.setGivenrole(rs.getString("givenrole"));
				um.setFunctionAllowed(rs.getString("functionAllowed"));
				um.setAdditionalFunctions(rs.getString("additionalFunctions"));
				um.setBranchCode(rs.getString("branchCode"));
				um.setBranchAllowed(rs.getString("branchAllowed"));
				um.setBranchAllowedFunctions(rs.getString("branchAllowedFunctions"));

				con.close();
				ps.close();
				return um;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}

}
