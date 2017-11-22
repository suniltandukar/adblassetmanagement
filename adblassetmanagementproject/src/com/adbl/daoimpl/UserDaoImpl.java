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
	public boolean adduserdao(String username, String staffcode, int roleid,String mid,String branchdb) {
		con=DBConnection.getConnection();
		String query1="insert into usertbl(username,staffcode,roleid,password,mid) values('"+username+"','"+staffcode+"','"+roleid+"','"+username+"','"+mid+"')";
		String query2="insert into "+branchdb+".usertbl (username, password, staffcode) values ('"+username+"','"+username+"','"+staffcode+"')";
		try{
			stmt=con.createStatement();
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.executeBatch();
			return true;
		}catch(Exception e){
			System.out.println("adduserdao exception"+e);
		}
		return false;
	}	
	public ResultSet edituserdao(String userid) {
		con=DBConnection.getConnection();
		
		//String query="select *,roletbl.* from usertbl join roletbl where userid='"+userid+"'";
		String query="SELECT usertbl.*,roletbl.roledescription from usertbl join roletbl where usertbl.roleid=roletbl.roleid and userid='"+userid+"'";
		
			try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				
				while(rs.next()){
					return rs;
				}
					
			} catch (SQLException e) {
				System.out.println("edituserdao exception"+e);
			}
			return null;
			
			
		
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
	public ResultSet getexistingusers()
	{
		 con=DBConnection.getConnection();
		String query="select * from usertbl";
		try{
		ps=con.prepareStatement(query);
		rs=ps.executeQuery();
		return rs;
		
		}catch(Exception e)
		{
			System.out.println("Exxisting user error"+e);
		}
		return null;
	}
	public boolean deleteuserdao(String userid,String branchdb)
	{
		con=DBConnection.getConnection();
		
		String query="delete  from usertbl where userid='"+userid+"'";
		String query1="delete  from "+branchdb+".usertbl where userid='"+userid+"'";
		
		try {
			stmt=con.createStatement();
			stmt.addBatch(query);
			stmt.addBatch(query1);
			stmt.executeBatch();
			return true;
			
		} catch (SQLException e) {
			System.out.println("Delete USer Dao Error"+e);
		}
		
		return false;
		
	}

	public boolean updateuserdao(String username, String staffcode, int roleid, String mid, String branchdb,String userid){
		String query="update usertbl set username='"+username+"', staffcode='"+staffcode+"',roleid='"+roleid+"' where userid='"+userid+"'";

		String query1="update "+branchdb+".usertbl set username='"+username+"', staffcode='"+staffcode+"' where userid='"+userid+"'";
		
		System.out.println(query);
		

		int[] rs=null;

		con=DBConnection.getConnection();
		try {
			
			stmt=con.createStatement();
			stmt.addBatch(query);
			stmt.addBatch(query1);
			rs=stmt.executeBatch();
			
			if(rs!=null)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateuserroledao(String roleid, String roledescription){
		String query="update roletbl set roledescription=? where roleid=?";
		int rs=0;
		con=DBConnection.getConnection();
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, roledescription);
			ps.setString(2, roleid);
			
			rs=ps.executeUpdate();
			if(rs>0){
				return true;
			}
		}catch(SQLException  e){
			e.printStackTrace();
		}
		return false;
	}
	public boolean deleteuserroledao(String roleid){
		String query="update roletbl set roledescription=? where roleid=?";
		int rs=0;
		con=DBConnection.getConnection();
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, "");
			ps.setString(2, roleid);
			rs=ps.executeUpdate();
			if(rs>0){
				return true;
			}
		}catch(SQLException  e){
			e.printStackTrace();
		}
		return false;
		
	}
	public ResultSet selectusernames(){
		 con=DBConnection.getConnection();
		String query="select username from usertbl;";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		return rs;
	}
	
}
