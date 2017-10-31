package com.adbl.daoimpl;
import java.sql.*;
import com.adbl.dao.InventoryDao;
import com.adbl.model.Inventory;
import com.mysql.jdbc.Connection;
import com.org.dbconnection.DBConnection;

public class InventoryDaoImpl implements InventoryDao {
	Connection con=null;
	Statement stmt=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	public InventoryDaoImpl(String branchdb) {
		con=DBConnection.getConnectionNext(branchdb);
	}
	public ResultSet getinventorydata(){
		String query="select * from inventorytbl";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("getinventorydata error"+e);
		}
		return rs;
	}
	public ResultSet getcompanylist(){
		String query="select * from companytbl";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("getcompanylist error"+e);
		}
		return rs;
	}
	public ResultSet getfundsourcelist(){
		String query="select * from fundsourcetbl";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("getfundsource error"+e);
		}
		
		return rs;
	}
	public ResultSet getgroup(){
        String query="select * from grouptbl";
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);

        }
        catch(Exception e){
            System.out.println("getgroup error"+e);
        }
        
        return rs;
    }
	public ResultSet getitemcondition(){
        String query="select * from itemconditiontbl";
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);

        }
        catch(Exception e){
            System.out.println("getgroup error"+e);
        }
        
        return rs;
    }
	public void addalldao(Inventory inventory) throws SQLException{
		String query1="insert into insurancetbl(insurancestart,companyid,insurancestarten,insuranceend,insuranceenden,insurancepremiumamount) "
				+ "values('"+inventory.getInsurancestart()+"',"+inventory.getInsurancecompanyid()+",'"+inventory.getInsurancestarten()+"','"+inventory.getInsuranceend()+"','"+inventory.getInsuranceenden()+"','"+inventory.getInsurancepremuimamount()+"')";
		String query2="insert into warrantytbl(warrantystart,warrantystarten,warrantyend,warrantyenden) "
				+ "values('"+inventory.getWarrantystart()+"','"+inventory.getWarrantystarten()+"','"+inventory.getWarrantyend()+"','"+inventory.getWarrantyenden()+"')";
		String query3="insert into amctbl(amcstart,amcstarten,amcend,amcenden,amccost,companyid)"
				+ "values('"+inventory.getAmcstart()+"','"+inventory.getAmcstarten()+"','"+inventory.getAmcend()+"','"+inventory.getAmcenden()+"','"+inventory.getAmccost()+"',"+inventory.getAmccompanyid()+")";
		try{
			stmt=con.createStatement();
			
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.addBatch(query3);
			stmt.executeBatch();
		}catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(stmt!=null){
				stmt.close();
			}
		}
	}
	public String[] selectids() throws SQLException{
		String[] ids=new String[3];
		String query="SELECT max(amcid) as amcid ,max(warrantyid) as warrantyid ,max(insuranceid) as insuranceid from amctbl, warrantytbl, insurancetbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				ids[0]=rs.getString("amcid");
				ids[1]=rs.getString("warrantyid");
				ids[2]=rs.getString("insuranceid");
			}
			
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(ps!=null){
				ps.close();
			}
		}
		return ids;
	}
	public String selectadditionaldetailid() throws SQLException{
		String id="";
		String query="SELECT max(inventoryotherdetailid) as additionaldetailid from inventoryotherdetailtbl";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				id=rs.getString("additionaldetailid");
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			if(ps!=null){
				ps.close();
			}
		}
		return id;
	}
	public String insuranceid(){
		String query="select max(insuranceid) from insurancetbl";
		String insuranceid="";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
            while(rs.next()){
            	insuranceid=rs.getString("max(insuranceid)");
            }
            
		}
		catch(Exception e){
			
		}
		return insuranceid;
	}

	public String warrantyid(){
		String query="select max(warrantyid) from warrantytbl";
		String warrantyid="";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
            while(rs.next()){
            	warrantyid=rs.getString("max(warrantyid)");
            }
            
		}
		catch(Exception e){
			
		}
		return warrantyid;
	}

	
	public String amcid(){
		String query="select max(amcid) from amctbl";
		String amcid="";
		try{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
            while(rs.next()){
            	amcid=rs.getString("max(amcid)");
            }
            
		}
		catch(Exception e){
			
		}
		return amcid;
	}
	
	public void additionaldetaildao(Inventory inventory,String[] ids) throws SQLException {
		String query="insert into inventoryotherdetailtbl(fundsourceid,unitname,rate,quantity,amount,warrantyid,amcid,insuranceid,supplierid,itemconditionid,itemsize,macaddress,licenseno,vehicleno,chesisno,engineno) "
				+ "values("+inventory.getFundsource()+",'"+inventory.getUnitname()+"','"+inventory.getRate()+"','"+inventory.getQuantity()+"','"+inventory.getAmount()+"','"+ids[1]+"','"+ids[0]+"','"+ids[2]+"',"+inventory.getSupplierid()+","+inventory.getItemconditionid()+",'"+inventory.getItemsize()+"','"+inventory.getMacaddress()+"','"+inventory.getLicenseno()+"','"+inventory.getVehicleno()+"','"+inventory.getChesisno()+"','"+inventory.getEngineno()+"')";	
		try {
			ps=con.prepareStatement(query);

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean inventorydao(Inventory inventory,String additionaldetailid)
	{
		boolean status=false;
		int a;
		String query="insert into inventorytbl(itemcode,transactionid,legacyid,groupcode,itemname,model,decisiondate,decisiondateen,purchasedate,purchasedateen,depreciationrate,inventoryotherdetailid) "
				+ "values('"+inventory.getItemcode()+"','"+inventory.getTransactionid()+"','"+inventory.getLegacyid()+"','"+inventory.getGroupcode()+"','"+inventory.getItemname()+"','"+inventory.getModel()+"','"+inventory.getDecisiondate()+"','"+inventory.getDecisiondateen()+"','"+inventory.getPurchasedate()+"','"+inventory.getPurchasedateen()+"','"+inventory.getDepreciationrate()+"','"+additionaldetailid+"')";
		try {
			ps=con.prepareStatement(query);

			a=ps.executeUpdate();
			if(a>0){
				status=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
}
