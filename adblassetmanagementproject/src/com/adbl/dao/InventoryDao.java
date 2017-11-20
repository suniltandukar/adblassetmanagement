package com.adbl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.adbl.model.Inventory;

public interface InventoryDao {
	public ResultSet getinventorydata();
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
	public boolean inventorydao(Inventory inventory,String additionaldetailid, String item_code,String transactionid);
	public boolean editalldao(Inventory inventory,String additionaldetailid);
	public boolean editalldaocodechanged(Inventory inventory, String additionaldetailid, String generated_itemcode);
	
}
