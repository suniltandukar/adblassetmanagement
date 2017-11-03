package com.adbl.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class Generator {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public Generator(String branchdb){
		con=DBConnection.getConnectionNext(branchdb);
	}
	public String itemcodegenerator(String groupcode, String year) {
		String code="";
		try{
			java.sql.Statement stmt=con.createStatement();
			String query="select * from inventorytbl where itemcode LIKE '%"+year+groupcode+"%' order by itemcode DESC;";
			ResultSet rs=stmt.executeQuery(query);
			int number=0;
			if(rs.next()) {
				code = rs.getString("itemcode");
				String[] splitCode = code.split(groupcode);
				number=Integer.parseInt(splitCode[1]);
				number++;
				String num=Integer.toString(number);
				if(num.length()<4){
					while(num.length()<4){
						num="0"+num;
					}
				}
				code = year+groupcode+num;
				System.out.println(code);
			}
			else{
				code=year+groupcode+"0001";
			}
		}
		catch(Exception e){
			System.out.println("get item code error"+e);
		}
		return code;
	}
}
