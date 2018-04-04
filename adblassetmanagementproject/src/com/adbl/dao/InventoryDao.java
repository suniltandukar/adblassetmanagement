package com.adbl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.json.JSONObject;

import com.adbl.model.Inventory;

public interface InventoryDao {
	public JSONObject getinventorydata(String currentBranchcode);
	public ResultSet getcompanylist();
	public ResultSet getfundsourcelist();
	public ResultSet getgroup();
	public ResultSet getinventoryeditdata(String itemcode);
	public ResultSet getitemcondition();
	public String insuranceid();
	public String amcid();
	public String warrantyid();
	public void additionaldetaildao(Inventory inventory,String[] ids) throws SQLException;
	public void addalldao(Inventory inventory) throws SQLException;
	public String[] selectids() throws SQLException;
	public String selectadditionaldetailid() throws SQLException;
	public boolean inventorydao(Inventory inventory,String additionaldetailid, String item_code,String transactionid,String branchcode,String inputter);
	public boolean deleteinventorydao(String itemcode, String inventoryotherdetailid, String amcid, String insuranceid, String warrantyid);
	public boolean editalldaocodechanged(Inventory inventory);
	public boolean issueconfirmation(String issueid,String statusid);
	public ResultSet userspecificdetail(String cid);
	public boolean transferitembranchdao(String newcid,String transferid);
	public boolean changeitemstatus(String transferid,String statusid,String actionBy);
	public ResultSet getitemcode(String transferid);
	public boolean savetransferstatus(String transferid, String itemcode);
	//public boolean depreciationdao(Inventory inventory, String item_code);
	public ResultSet getinventoryfordep(String itemcode);
	public boolean insertDep(Inventory inventory, String genitemcode);
	public String getGeneralSettings();
	public List<String> getallItemcodes(String currentBranchcode);
	
}
