package com.adbl.dao;

import java.sql.ResultSet;

import com.adbl.model.Bill;

public interface OtherActionDAO {

	

	String downloadFileNameDAO(String name);

	boolean uploadbillDao(Bill bill);

	public ResultSet editbillDao(String branchdb, String billid);
	public ResultSet viewbillDao(String branchdb);

	public ResultSet viewbillimageDao(String branchdb, String billid);

	public boolean deletebilldata(String branchdb, String billid);

	
	
	

}
