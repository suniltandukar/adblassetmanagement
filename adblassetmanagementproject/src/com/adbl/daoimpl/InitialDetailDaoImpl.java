package com.adbl.daoimpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.adbl.dao.InitialDetailDao;
import com.adbl.model.Model;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class InitialDetailDaoImpl implements InitialDetailDao{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public InitialDetailDaoImpl(String branchdb){
		con=DBConnection.getConnectionNext(branchdb);
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
