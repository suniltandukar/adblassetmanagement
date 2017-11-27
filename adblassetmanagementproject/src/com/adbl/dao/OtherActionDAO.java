package com.adbl.dao;

import java.sql.ResultSet;

import com.adbl.model.Bill;

public interface OtherActionDAO {

	

	String downloadFileNameDAO(String name);

	boolean uploadbillDao(Bill bill);

	public boolean editbillDao(String branchdb, Bill bill);
	public ResultSet viewbillDao(String branchdb);

	public ResultSet viewbillimageDao(String branchdb, String billid);

	public boolean deletebilldata(String branchdb, String billid);

	public Bill getbilldetail(String billid, String branchdb, Bill bill);

	
	
	

}
