package com.adbl.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.adbl.dao.UpdateDao;
import com.org.dbconnection.DBConnection;

public class UpdateDaoImpl implements UpdateDao{
	PreparedStatement ps=null;
	Connection con=null;
	
	public boolean editGroup(String groupcode, String groupname, String igroupcode){
		String sql="UPDATE GROUPTBL SET GROUPCODE=?, GROUPNAME=? WHERE GROUPCODE=?";
		try{
			con=DBConnection.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, groupcode);
			ps.setString(2, groupname);
			ps.setString(3, igroupcode);
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
}
