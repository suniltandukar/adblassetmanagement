package com.adbl.daoimpl;
import java.sql.*;
import com.adbl.dao.InventoryDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class InventoryDaoImpl implements InventoryDao {
	Connection con=null;
	Statement stmt=null;
	public ResultSet getinventorydata(String branchdb){
		con=DBConnection.getConnectionNext(branchdb);
		String query="select * from inventorytbl";
		ResultSet rs=null;
		try{
			stmt=con.createStatement();
			System.out.println("reached");
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("getinventorydata error"+e);
		}
		return rs;
	}
}
