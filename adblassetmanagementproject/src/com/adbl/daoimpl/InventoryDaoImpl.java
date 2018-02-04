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
	public InventoryDaoImpl() {
		con=DBConnection.getConnection();
	}
	public ResultSet getinventorydata(String currentBranchcode){
		String query="select * from inventoryitemdetail where branchcode='"+currentBranchcode+"'";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("getinventorydata error"+e);
		}
		return rs;
	}
	public ResultSet userspecificdetail(String cid)
	{
		ResultSet userdetail=null;
		String query="";
		try{
		query="SELECT usertbl.*,branchdetailtbl.*,companycodetbl.branchdbname,companycodetbl.name FROM usertbl join mainusertbl on usertbl.mid=mainusertbl.mid JOIN branchdetailtbl on mainusertbl.branchid=branchdetailtbl.branchid join companycodetbl on companycodetbl.cid=usertbl.cid where usertbl.cid='"+cid+"'";
		stmt=con.createStatement();
		userdetail=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println(e);
		}
		return userdetail;
	}
	public ResultSet getinventoryeditdata(String itemcode){
		String query="select * from inventoryitemdetail where itemcode='"+itemcode+"'";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
		}
		catch(Exception e){
			System.out.println("geteditdata error"+e);
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
		
        String query="select * from adblheadofficedb.grouptbl";
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
		String query1="insert into insurancetbl(insurancestart,insurancecompanyid,insurancestarten,insuranceend,insuranceenden,insurancepremiumamount) "
				+ "values('"+inventory.getInsurancestart()+"',"+inventory.getInsurancecompanyid()+",'"+inventory.getInsurancestarten()+"','"+inventory.getInsuranceend()+"','"+inventory.getInsuranceenden()+"','"+inventory.getInsurancepremuimamount()+"')";
		String query2="insert into warrantytbl(warrantystart,warrantystarten,warrantyend,warrantyenden) "
				+ "values('"+inventory.getWarrantystart()+"','"+inventory.getWarrantystarten()+"','"+inventory.getWarrantyend()+"','"+inventory.getWarrantyenden()+"')";
		String query3="insert into amctbl(amcstart,amcstarten,amcend,amcenden,amccost,amccompanyid)"
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
	public boolean inventorydao(Inventory inventory,String additionaldetailid,String item_code,String transactionid,String branchCode,String inputter)
	{
		boolean status=false;
		int a;
		String transactiondateen="date";
		String query="insert into inventorytbl(itemcode,transactionid,transactiondateen,legacyid,groupcode,itemname,model,decisiondate,decisiondateen,purchasedate,purchasedateen,depreciationrate,inventoryotherdetailid,branchCode,donationpercentage,inputter) "
				+ "values('"+item_code+"','"+transactionid+"','"+transactiondateen+"','"+inventory.getLegacyid()+"','"+inventory.getGroupcode()+"','"+inventory.getItemname()+"','"+inventory.getModel()+"','"+inventory.getDecisiondate()+"','"+inventory.getDecisiondateen()+"','"+inventory.getPurchasedate()+"','"+inventory.getPurchasedateen()+"','"+inventory.getDepreciationrate()+"','"+additionaldetailid+"','"+branchCode+"','"+inventory.getDonationpercentage()+"','"+inputter+"')";
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
	public boolean editalldaocodechanged(Inventory inventory)
	{
		int rs=0;
		
		String query="update inventorytbl inner join inventoryotherdetailtbl on  inventoryotherdetailtbl.inventoryotherdetailid=inventorytbl.inventoryotherdetailid inner join insurancetbl on inventoryotherdetailtbl.insuranceid=insurancetbl.insuranceid inner join amctbl on inventoryotherdetailtbl.amcid=amctbl.amcid inner join warrantytbl on inventoryotherdetailtbl.warrantyid=warrantytbl.warrantyid set "
				+ "inventorytbl.itemcode='"+inventory.getUpdated_itemcode()+"',inventorytbl.donationpercentage='"+inventory.getDonationpercentage()+"', inventorytbl.transactionid='"+inventory.getTransactionid()+"', inventorytbl.legacyid='"+inventory.getLegacyid()+"', inventorytbl.groupcode='"+inventory.getGroupcode()+"', inventorytbl.itemname='"+inventory.getItemname()+"', inventorytbl.model='"+inventory.getModel()+"', inventorytbl.decisiondate='"+inventory.getDecisiondate()+"', inventorytbl.decisiondateen='"+inventory.getDecisiondateen()+"', inventorytbl.purchasedate='"+inventory.getPurchasedate()+"', inventorytbl.purchasedateen='"+inventory.getPurchasedateen()+"', inventorytbl.depreciationrate='"+inventory.getDepreciationrate()+"',"
				+ "inventoryotherdetailtbl.fundsourceid='"+inventory.getFundsource()+"', inventoryotherdetailtbl.unitname='"+inventory.getUnitname()+"', inventoryotherdetailtbl.rate='"+inventory.getRate()+"', inventoryotherdetailtbl.supplierid='"+inventory.getSupplierid()+"', inventoryotherdetailtbl.itemconditionid='"+inventory.getItemconditionid()+"', inventoryotherdetailtbl.itemsize='"+inventory.getItemsize()+"', inventoryotherdetailtbl.vehicleno='"+inventory.getVehicleno()+"', inventoryotherdetailtbl.chesisno='"+inventory.getChesisno()+"', inventoryotherdetailtbl.engineno='"+inventory.getEngineno()+"', inventoryotherdetailtbl.macaddress='"+inventory.getMacaddress()+"', inventoryotherdetailtbl.licenseno='"+inventory.getLicenseno()+"',"
						+ "insurancetbl.insurancecompanyid='"+inventory.getInsurancecompanyid()+"', insurancetbl.insurancestart='"+inventory.getInsurancestart()+"',insurancetbl.insurancestarten='"+inventory.getInsurancestarten()+"', insurancetbl.insuranceend='"+inventory.getInsuranceend()+"', insurancetbl.insuranceenden='"+inventory.getInsuranceenden()+"', insurancetbl.insurancepremiumamount='"+inventory.getInsurancepremuimamount()+"',"
						+ "amctbl.amcstart='"+inventory.getAmcstart()+"', amctbl.amcstarten='"+inventory.getAmcstarten()+"', amctbl.amcend='"+inventory.getAmcend()+"', amctbl.amcenden='"+inventory.getAmcenden()+"', amctbl.amccost='"+inventory.getAmccost()+"', amctbl.amccompanyid='"+inventory.getAmccompanyid()+"',"
								+ "warrantytbl.warrantystart='"+inventory.getWarrantystart()+"', warrantytbl.warrantystarten='"+inventory.getWarrantystarten()+"', warrantytbl.warrantyend='"+inventory.getWarrantyend()+"', warrantytbl.warrantyenden='"+inventory.getWarrantyenden()+"'"
								+ "where inventorytbl.itemcode='"+inventory.getItemcode()+"' and inventoryotherdetailtbl.inventoryotherdetailid='"+inventory.getInventoryotherdetailid()+"' and insurancetbl.insuranceid='"+inventory.getInsuranceid()+"' and amctbl.amcid='"+inventory.getAmcid()+"'and warrantytbl.warrantyid='"+inventory.getWarrantyid()+"';";
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeUpdate();
			if(rs>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	public boolean deleteinventorydao(String itemcode, String inventoryotherdetailid, String amcid, String insuranceid, String warrantyid)
	{
		String query1="delete from inventoryotherdetailtbl where inventoryotherdetailid='"+inventoryotherdetailid+"'";
		String query2="delete from amctbl where amcid='"+amcid+"'";
		String query3="delete from insurancetbl where insuranceid='"+insuranceid+"'";
		String query4="delete from warrantytbl where warrantyid='"+warrantyid+"'";
		String query5="delete from inventorytbl where itemcode='"+itemcode+"'";
				
		
		try {
			stmt=con.createStatement();
			stmt.addBatch(query5);
			stmt.addBatch(query1);
			stmt.addBatch(query2);
			stmt.addBatch(query3);
			stmt.addBatch(query4);
			stmt.executeBatch();
			return true;
						
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteinventory dao error");
		}
		return false;
	
		
	}
	public boolean issueconfirmation(String issueid, String statusid){
		int a=0;
		String query="update issuetbl SET statusid='"+statusid+"' WHERE issueid='"+issueid+"';";
		try{
			ps=con.prepareStatement(query);
			a=ps.executeUpdate();
			if(a>0){
				System.out.println("confirmation done!");
				ps.close();
				con.close();
				return true;
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return false;
	}
	
	public boolean transferitembranchdao(String newbranchcode,String transferid)
	{
		int rs=0;
		String query="update inventorytbl set branchcode='"+newbranchcode+"' where transferid='"+transferid+"'";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("transferitembranchdao error");
		}
		return false;
	}
	public ResultSet getitemcode(String transferid)
	{
		String query="select * from inventorytbl where transferid='"+transferid+"'";
		try{
			stmt=con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next()){
			return rs;
			}
		}
		catch(Exception e){
			System.out.println("getitemcode error"+e);
		}
		return null;
		
	
	}
	public boolean changeitemstatus(String transferid,String statusid,String actionBy)
	{
		int rs=0;
		String query="update transfertbl set statusid='"+statusid+"',actionBy='"+actionBy+"' where transferid='"+transferid+"'";
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("transferitembranchdao error");
		}
		return false;
	}
	
	public boolean savetransferstatus(String transferid, String itemcode)
	{
		int rs=0;
		String query="insert into transferhistorytbl(itemcode,transferid) values(?,?)" ;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, itemcode);
			ps.setString(2, transferid);
			rs=ps.executeUpdate();
			if(rs>0)
			{
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("savetransferstatus error");
		}
		return false;
	}
}
