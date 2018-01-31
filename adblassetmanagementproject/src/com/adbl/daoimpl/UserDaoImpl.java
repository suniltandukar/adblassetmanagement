package com.adbl.daoimpl;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adbl.dao.UserDao;
import com.adbl.model.History;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class UserDaoImpl implements UserDao {
	Connection con=null;
	PreparedStatement ps=null;
	Statement stmt=null;
	ResultSet rs=null;
	HttpSession session=null;
	public boolean addusertomainbranch(String username, String staffcode, int roleid, String mid, String userbranch,
			String role, String effectivedate, String enddate, String usercid,String sessionuser)
	{
		con=DBConnection.getConnectionNext("adblheadofficedb");
		
		//String query1="insert into usertbl(username,staffcode,roleid,password,mid,givenrole,edate,enddate,cid) values('"+username+"','"+staffcode+"','"+roleid+"','"+username+"','"+mid+"','"+role+"','"+effectivedate+"','"+enddate+"','"+usercid+"')";
		String query2="insert into usertbl (username, password, staffcode,givenrole,edate,enddate,cid) values ('"+username+"','"+username+"','"+staffcode+"','"+role+"','"+effectivedate+"','"+enddate+"','"+usercid+"')";

		try{
			stmt=con.createStatement();
			//stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.executeBatch();
			String action="new user "+username+" created";
			loghistorydao(sessionuser, action);
		
			return true;
			
		}catch(Exception e){
			System.out.println("adduserdao exception"+e);
		}
		return false;

		
	}
	public boolean adduserdao(String username, String staffcode, int roleid,String mid,String role, String effectivedate, String enddate,String usercid) {
		con=DBConnection.getConnectionNext("adblheadofficedb");
		String query1="insert into "+"adblassetmanagementdb"+".usertbl(username,staffcode,roleid,password,mid,givenrole,edate,enddate,cid) values('"+username+"','"+staffcode+"','"+roleid+"','"+username+"','"+mid+"','"+role+"','"+effectivedate+"','"+enddate+"','"+usercid+"')";
			System.out.println(query1+"query 1");
		String query2="insert into usertbl (username, password, staffcode,givenrole,edate,enddate,cid) values ('"+username+"','"+username+"','"+staffcode+"','"+role+"','"+effectivedate+"','"+enddate+"','"+usercid+"')";

		try{
			stmt=con.createStatement();
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.executeBatch();
			
		
			return true;
		}catch(Exception e){
			System.out.println("adduserdao yei exception"+e);
		}
		return false;
	}	
	
	public ResultSet edituserdao(String userid) {
		con=DBConnection.getConnection();
		
		//String query="select *,roletbl.* from usertbl join roletbl where userid='"+userid+"'";
		String query="SELECT usertbl.*,roletbl.roledescription,branchdetailtbl.* from usertbl join roletbl on usertbl.roleid=roletbl.roleid join mainusertbl on mainusertbl.mid=usertbl.mid join branchdetailtbl on branchdetailtbl.branchid=mainusertbl.branchid where userid='"+userid+"'";
		
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

	public boolean updateuserdao(String username, String staffcode, int roleid, String mid, String branchdb,String userid,String givenrole, String effectivedate, String enddate){
		String query="update usertbl set username='"+username+"', staffcode='"+staffcode+"',roleid='"+roleid+"',givenrole='"+givenrole+"',edate='"+effectivedate+"',enddate='"+enddate+"' where userid='"+userid+"'";

		String query1="update "+branchdb+".usertbl set username='"+username+"', staffcode='"+staffcode+"' ,givenrole='"+givenrole+"',edate='"+effectivedate+"',enddate='"+enddate+"' where userid='"+userid+"'";
		
		System.out.println(query1);
		

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
	public String userenddate(String staffcode)
	{
		String query="select enddate from usertbl where staffcode=?";
		con=DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, staffcode);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getString("enddate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
				
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
	public boolean loghistorydao(String username,String action)
	{
		try {
			
			InetAddress ip;
		
			ip = InetAddress.getLocalHost();
			String ipaddress=ip.toString();
			NetworkInterface network = NetworkInterface.getByInetAddress(ip);

			/*byte[] mac = network.getHardwareAddress();

			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length; i++) {
				sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
			}
			String macaddress=sb.toString();*/
		int rs=0;
		
	
			String query="insert into loginhistorytbl(username,ipaddress,logindatetime,action) values(?,'"+ipaddress+"',NOW(),?)";
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, action);
		
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}
		} catch (Exception e) {
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
				hist.setAction(rs.getString("action"));
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
	public void addroles(HttpServletRequest request, HttpServletResponse response)
	{
		String query="";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getrecentid()
	{
		String query="SELECT max(userid) as userid from usertbl";
		con=DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getString("userid");
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addusercompanyid(String id, String userbranch, String staffcode,String branchdb)
	{
		int rs=0;
		String query="insert into companycodetbl(userid,branchname,branchlocation,companycodename) values(?,?,?,?)";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, userbranch);
			ps.setString(3, branchdb);
			ps.setString(4, staffcode);
		
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
	public String getUserCid(String cid)
	{
		
		try {
			//String query="select usertbl.*,companycodetbl.name,companycodetbl.address,companycodetbl.branchcode,companycodetbl.branchdbname from usertbl join companycodetbl on usertbl.cid=companycodetbl.cid where cid=?";
			String query ="select * from companycodetbl where cid=?";
					con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			ps.setString(1, cid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getString("branchdbname");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String getRoleAssigned(String name)
	{
		
		String query="select roles from roleindex where name='"+name+"'";
		String roles="";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()){
				roles=rs.getString("roles");
				con.close();
				ps.close();
				rs=null;
				return roles;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("updateuserdao error");
		}
		
		return null;
		
	}
		
	

}
