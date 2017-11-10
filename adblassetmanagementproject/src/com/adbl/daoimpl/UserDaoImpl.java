package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.UserDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class UserDaoImpl implements UserDao {
	Connection con=null;
	PreparedStatement ps=null;
	Statement stmt=null;
	ResultSet rs=null;
	public void adduserdao(String username, String staffcode, int roleid,String mid,String branchdb) {
		con=DBConnection.getConnection();
		String query1="insert into usertbl(username,staffcode,roleid,password,mid) values('"+username+"','"+staffcode+"','"+roleid+"','"+username+"','"+mid+"')";
		String query2="insert into "+branchdb+".usertbl (username, password, staffcode) values ('"+username+"','"+username+"','"+staffcode+"')";
		try{
			stmt=con.createStatement();
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.executeBatch();
		}catch(Exception e){
			System.out.println("adduserdao exception"+e);
		}
	}	
	public ResultSet getroles()
	{
		con=DBConnection.getConnection();
		String query="select * from roletbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			return rs;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	

}
