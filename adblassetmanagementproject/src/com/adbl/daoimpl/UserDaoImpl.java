package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.UserDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class UserDaoImpl implements UserDao {

	public void adduserdao(String username, String staffcode, int roleid,String mid,String branchdb) {
		Connection con=null;
		PreparedStatement ps=null;
		Statement stmt=null;
		int rs;
		
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
	

}
