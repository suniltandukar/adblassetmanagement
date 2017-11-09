package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.adbl.dao.CheckDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class CheckDaoImpl implements CheckDao{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public boolean checkusernamedao(String id, String checkvariable){
		con=DBConnection.getConnection();
		String query="select * from usertbl where "+checkvariable+" like '%"+id+"%'";
		try{
			System.out.println(query);
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next()){
				con.close();
				ps.close();
				rs.close();
				return true;
			}
		}catch(Exception e){
			System.out.println("check username error"+e);
		}
		return false;
	}
}
