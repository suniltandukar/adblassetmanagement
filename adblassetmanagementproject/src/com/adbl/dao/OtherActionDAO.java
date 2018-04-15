package com.adbl.dao;

import java.sql.ResultSet;
import java.util.List;

import org.json.JSONObject;

import com.adbl.model.Bill;
import com.adbl.model.Inventory;

public interface OtherActionDAO {

	

	String downloadFileNameDAO(String name);

	boolean uploadbillDao(Bill bill);

	public boolean editbillDao(String branchdb, Bill bill);
	public ResultSet viewbillDao();

	public ResultSet viewbillimageDao(String branchdb, String billid);

	public boolean deletebilldata(String billid);

	public Bill getbilldetail(String billid, String branchdb, Bill bill);

	public JSONObject getDepreciation();

	public List<String> getDashboardDetails(String username);

	
	
	

}
