package com.adbl.user.daoImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.adbl.model.UserModel;
import com.adbl.user.dao.UserDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class UserDaoImpl implements UserDao {
	PreparedStatement ps=null;
	Connection con=null;
	ResultSet rs=null;
	List<UserModel> list=null;
	UserModel usermodel=null;
	
	public boolean adduserdao(UserModel u)
	{
		String query="insert into usertbl(username,password,status,givenrole,fullName,post,staffCode,startDate,endDate,branchCode,functionAllowed,functionRestriction,branchAllowed,additionalFunctions) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int rs=0;
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getStatus());
			ps.setString(4,u.getGivenrole() );
			ps.setString(5,u.getFullName() );
			ps.setString(6, u.getPost() );
			ps.setString(7,u.getStaffCode() );
			ps.setString(8,u.getStartDate() );
			ps.setString(9,u.getEndDate() );
			ps.setString(10,u.getBranchCode() );
			ps.setString(11,u.getFunctionAllowed() );
			ps.setString(12,u.getFunctionRestriction() );
			ps.setString(13,u.getBranchAllowed() );
			ps.setString(14, u.getAdditionalFunctions());
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		System.out.println("adduserdao error");
		}
		return false;
		
	}
	public boolean deleteuserdao(String userid)
	{
		String query="delete from usertbl where userid=?";
		int rs=0;
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, userid);
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
	
	public List<UserModel> getexistingusers()
	{
		
		String query="select * from usertbl";
		list=new ArrayList<UserModel>();
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			
			
			while(rs.next())
			{
				usermodel=new UserModel();
				usermodel.setUsername(rs.getString("username"));
				usermodel.setPassword(rs.getString("password"));
				usermodel.setUserid(rs.getString("userid"));
				list.add(usermodel);
			}
			
			if(list.size()>0)
			{
				return list;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public UserModel edituserdao(String userid)
	{
		String query="select * from usertbl where userid=?";
		con=DBConnection.getConnection();
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				usermodel=new UserModel();
				usermodel.setUserid(rs.getString("userid"));
				usermodel.setUsername(rs.getString("username"));
				usermodel.setPassword(rs.getString("password"));
				usermodel.setGivenrole(rs.getString("givenrole"));
				return usermodel;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public boolean updateuserdao(String userid, String username,String givenrole)
	{
		int rs=0;
		String query="update usertbl set username=?, givenrole=? where userid=?";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, givenrole);
			ps.setString(3, userid);
			rs=ps.executeUpdate();
			
			if(rs>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("updateuserdao error");
		}
		
		return false;
		
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
	public List<String> getRoleName(){
		List<String> list=new ArrayList<String>();
		String query="select name from roleindex";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString("name"));
			}
			if(list.size()>0){
				con.close();
				ps.close();
				rs=null;
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getRoleName error");
		}
		return null;
	}
	public List<UserModel> getBranchList(){
		List<UserModel> list=new ArrayList<UserModel>();
		UserModel u=null;
		String query="select * from branchtbl";
		con=DBConnection.getConnection();
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				u=new UserModel();
				u.setBranchCode(rs.getString("branchId"));
				u.setBranchName(rs.getString("branchName"));
				list.add(u);
			}
			if(list.size()>0){
				con.close();
				ps.close();
				rs=null;
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getRoleName error");
		}
		return null;
	}
	public boolean insertusergroup(String groupname, String givenRoles){
		String query="insert into roleindex values('"+givenRoles+"','"+groupname+"')";
		try{
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			int i=ps.executeUpdate();
			if(i>0){
				return true;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	public boolean checkUserGroup(String parameter){
		String query="select name from roleindex where name='"+parameter+"'";
		try{
			con=DBConnection.getConnection();
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()){
				return true;
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return false;
		
	}

}
