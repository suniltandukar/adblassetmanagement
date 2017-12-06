package com.adbl.daoimpl;

import java.net.InetAddress;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.dao.UserDao;
import com.adbl.model.History;
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
	public boolean updateusernamepasswordInMaindb(String username, String newusername, String newpassword){
		 con=DBConnection.getConnection();
		 int i=0;
		 String query="update usertbl set username=?, password=? where username=?";
		 try{
			 ps=con.prepareStatement(query);
			 ps.setString(1, newusername);
			 ps.setString(2, newpassword);
			 ps.setString(3, username);
			 i=ps.executeUpdate();
			 if(i>0){
				 return true;
			 }
		 }
		 catch(Exception e){
			 System.out.println(e);
		 }
		 return false;
	}
	public boolean updateusernamepasswordInBranchdb(String username, String newusername, String newpassword, String branchdb){
		 con=DBConnection.getConnectionNext(branchdb);
		 int i=0;
		 String query="update usertbl set username=?, password=? where username=?";
		 try{
			 ps=con.prepareStatement(query);
			 ps.setString(1, newusername);
			 ps.setString(2, newpassword);
			 ps.setString(3, username);
			 i=ps.executeUpdate();
			 if(i>0){
				 return true;
			 }
		 }
		 catch(Exception e){
			 System.out.println(e);
		 }
		 return false;
	}
	public boolean loghistorydao(ResultSet userdetail, String ip, String mac)
	{
		int rs=0;
		
		try {
			String query="insert into loginhistorytbl(username,ipaddress,macaddress,logindatetime) values(?,?,?,NOW())";
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, userdetail.getString("username"));
			ps.setString(2, ip);
			ps.setString(3, mac);
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
			
	}
	public List<History> viewhistory(HttpServletRequest request, HttpServletResponse response)
	{
		String query="select * from loginhistorytbl";
		con=DBConnection.getConnection();
		History hist=null;
		List<History> list=new ArrayList<History>();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				hist=new History();
				hist.setUsername(rs.getString("username"));
				hist.setIpaddress(rs.getString("ipaddress"));
				hist.setMacaddress(rs.getString("macaddress"));
				hist.setLogin(rs.getString("logindatetime"));
				list.add(hist);
			}
			if(list.size()>0){
				con.close();
				rs=null;
				ps=null;
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}

}
