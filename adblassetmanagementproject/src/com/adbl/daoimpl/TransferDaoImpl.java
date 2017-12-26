package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.TransferDao;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class TransferDaoImpl implements TransferDao{
	Connection con=null;
	Statement stmt=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	public TransferDaoImpl(String branchdb) {
		con=DBConnection.getConnectionNext(branchdb);
	}
	
	public boolean setstatuspending(String transferedby, String transferedto, String branchby, String branchto,
			String transferdate, String transferdateen, String itemcode, String branchdb)
	{
		Connection con=DBConnection.getConnectionNext(branchto);
		String statusid="3";
		int r=0;
		String query="insert into transfertbl(transferedby,branchby,transferedto,branchto,transfereddate,transfereddateen,statusid) values(?,?,?,?,?,?,?)";
		try {
			
			ps=con.prepareStatement(query);
			ps.setString(1, transferedby);
			ps.setString(2, branchby);
			ps.setString(3, transferedto);
			ps.setString(4, branchto);
			ps.setString(5, transferdate);
			ps.setString(6, transferdateen);
			ps.setString(7, statusid);
			r=ps.executeUpdate();
			
			if(r>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}


	

	public boolean setissuestatuspending(String issuedby, String issuedto,
			String issueddate, String issueddateen, String itemcode)
	{
		String statusid="3";
		int r=0;
		String query="insert into issuetbl(issuedby,issuedto,issueddate,issueddateen,statusid, issueitemcode) values(?,?,?,?,?,?)";
		try {
			
			ps=con.prepareStatement(query);
			ps.setString(1, issuedby);
			ps.setString(2, issuedto);
			ps.setString(3, issueddate);
			ps.setString(4, issueddateen);
			ps.setString(5, statusid);
			ps.setString(6, itemcode);
			r=ps.executeUpdate();
			
			if(r>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}


	public String gettransferid(){
		String id="";
		String query="select max(transferid) as transferid from transfertbl;";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				id=rs.getString("transferid");
				return id;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	
	public String getissueid(){
		String id="";
		String query="select max(issueid) as issueid from issuetbl;";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				id=rs.getString("issueid");
				return id;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return null;
	}
	public boolean updatetransferitemstatus(String transferid, String itemcode){
		String query="update inventorytbl set transferid=? where itemcode=?";
		int rs=0;
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, transferid);
			ps.setString(2, itemcode);
			rs=ps.executeUpdate();
			if(rs>0){
				return true;
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	public boolean updateissueitemstatus(String issueid, String itemcode){
		String query="update inventorytbl set issueid=? where itemcode=?";
		int rs=0;
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, issueid);
			ps.setString(2, itemcode);
			rs=ps.executeUpdate();
			if(rs>0){
				return true;
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	
	public ResultSet getbranchdetails(){
		con=DBConnection.getConnection();
		String query="select * from companycodetbl";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("branchname error");
		}
		
		return null;
				
	}
	public ResultSet getUseretails(String branchid){
		con=DBConnection.getConnection();
		String query="select branchdetailtbl.*,usertbl.* from branchdetailtbl join mainusertbl on branchdetailtbl.branchid=mainusertbl.branchid join usertbl on usertbl.mid=mainusertbl.mid where branchid='"+branchid+"'";

		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("branchname error");
		}
		
		return null;
				
	}
	public ResultSet getissueditemdetails(String username){
		String query="SELECT inventorytbl.*, issuetbl.*, statustbl.statusname from inventorytbl JOIN issuetbl on inventorytbl.issueid=issuetbl.issueid join statustbl on issuetbl.statusid=statustbl.statusid  WHERE issuetbl.issuedto='"+username+"' ";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		}
		catch(Exception e)
		{
			System.out.println("TransferDaoImpl getissueditemdetails error"+e);
		}		return rs;
	}
	public ResultSet getissuedetails(){
		String query="SELECT inventorytbl.*, issuetbl.* from inventorytbl JOIN issuetbl on inventorytbl.issueid=issuetbl.issueid where issuetbl.statusid='2'";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		}
		catch(Exception e)
		{
			System.out.println("TransferDaoImpl getissueditemdetails error"+e);
		}		return rs;
		
	}
	public ResultSet myitemdetails(String username){
		String query="SELECT inventorytbl.*, issuetbl.* from inventorytbl JOIN issuetbl on inventorytbl.issueid=issuetbl.issueid where issuetbl.statusid='2' and issuedTo='"+username+"'";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		}
		catch(Exception e)
		{
			System.out.println("TransferDaoImpl getissueditemdetails error"+e);
		}		return rs;
		
	}

	
}
