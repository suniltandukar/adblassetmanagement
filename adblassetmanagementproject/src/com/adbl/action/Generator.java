package com.adbl.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class Generator {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public Generator(){
		con=DBConnection.getConnection();
	}
	public String itemcodegenerator(String groupcode, String year) {
		String code="";
		try{
			
			String query="select * from inventorytbl where itemcode LIKE '%"+year+groupcode+"%' order by itemcode DESC;";
			ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				int number=0;
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
				System.out.println("else part");
				code=year+groupcode+"0001";
			}
		}
		catch(Exception e){
			System.out.println("get item code error"+e);
		}
		return code;
	}
	public String transactionidgenerator(String branchcode, String year) {
		String transactionid="";
		try{
			String query="select * from inventorytbl where transactionid LIKE '%"+year+branchcode+"%' order by transactionid DESC;";
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				int number=0;
				transactionid = rs.getString("transactionid");
				System.out.println("txn is"+transactionid);
				//String[] splitCode = transactionid.split(branchcode);
				String yr=transactionid.substring(0, 3),//year
				bc=transactionid.substring(4, 7),//branchcode
				lastno=transactionid.substring(8,14);
				
				System.out.println("last no"+lastno);
				number=Integer.parseInt(lastno);
				number++;
				String num=Integer.toString(number);
				if(num.length()<6){
					while(num.length()<6){
						num="0"+num;
					}
				}
				transactionid = year+branchcode+num;
				System.out.println("txnid is "+transactionid);
				
			}
			else{
				transactionid=year+branchcode+"000001";
				System.out.println("txnid is "+transactionid);
			}
		}
		catch(Exception e){
			System.out.println("get transaction id error"+e);
		}
		return transactionid;
	}
	public String addHash(String givenValue){
		String[] str=givenValue.split(",");
		String result=null;
		String b="";
		for(int i=0;i<str.length;i++){
			result="#"+str[i];
			b=result+","+b;
		}
		if(b!=null){
			 givenValue=b.substring(0, b.length() - 1);
			 return givenValue;
		}
		return null;
	}
}
