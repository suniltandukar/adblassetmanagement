package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.adbl.dao.InitialDetailDao;
import com.adbl.model.Model;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class InitialDetailDaoImpl implements InitialDetailDao{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public InitialDetailDaoImpl(){
		con=DBConnection.getConnection();
	}
	public void addgroup(String groupcode,String groupname) throws SQLException{
		String query="insert into grouptbl values ('"+groupcode+"','"+groupname+"');";
		try{
		ps=con.prepareStatement(query);
		ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println("addgroup error"+e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void additemcondition(String itemconditionname) throws SQLException{
		String query="insert into itemconditiontbl(itemconditionname) values ('"+itemconditionname+"');";
		try{
		ps=con.prepareStatement(query);
		ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println("additemcondition error"+e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void addfundsource(String sourcename) throws SQLException{
		String query="insert into fundsourcetbl(sourcename) values ('"+sourcename+"');";
		try{
		ps=con.prepareStatement(query);
		ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println("addfundsource error"+e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void addcompany(Model m) throws SQLException{
		String query="insert into companytbl(vatpan,companyname,companyaddress,companycontactno,companyemail,companycontactperson) values ('"+m.getVatpan()+"','"+m.getCompanyname()+"','"+m.getCompanyaddress()+"','"+m.getCompanycontactno()+"','"+m.getCompanyemail()+"','"+m.getCompanycontactperson()+"');";
		try{
		ps=con.prepareStatement(query);
		ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println("addcompany error"+e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public boolean addcompanycode(String companyname, String companyaddress, String companycode)
	{
		Statement stmt=null;
		Connection con=DBConnection.getConnectionNext("adblheadofficedb");
		int rs=0;
		String query="insert into companycodetbl(name,address,branchcode) values ('"+companyname+"','"+companyaddress+"','"+companycode+"')";
		String query1="insert into "+"adblassetmanagementdb"+".companycodetbl(name,address,branchcode) values ('"+companyname+"','"+companyaddress+"','"+companycode+"')";
		try{
			stmt=con.createStatement();
			stmt.addBatch(query1);
			stmt.addBatch(query);
			stmt.executeBatch();
			return true;

	
		
		}
		catch(Exception e){
			System.out.println("addcompanycode error"+e);
		}
		return false;
		
		
	}
	public ResultSet showcompany(){
		String query="select * from companytbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			
		}
		return rs;
	}
	public ResultSet showgroup(){
		String query="select * from grouptbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			
		}
		return rs;
	}
	public ResultSet showfundsource(){
		String query="select * from fundsourcetbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
	public ResultSet showitemcondition(){
		String query="select * from itemconditiontbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return rs;
	}
	public void deletecompany(String id) throws SQLException{
		String query="delete from companytbl where companyid='"+id+"'";
		try{
			ps=con.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void deletegroup(String id) throws SQLException{
		String query="delete from grouptbl where groupcode='"+id+"'";
		try{
			ps=con.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void deletefundsource(String id) throws SQLException{
		String query="delete from fundsourcetbl where fundsourceid='"+id+"'";
		try{
			ps=con.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
	public void deleteitemcondition(String id) throws SQLException{
		String query="delete from itemconditiontbl where itemconditionid='"+id+"'";
		try{
			ps=con.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
		}
	}
}
