package com.adbl.dao;

public interface OtherActionDAO {

	boolean uploadbillDao(String billno, String companyname, String billdate, String billdateen, String billimagename,String branchdb);

	String downloadFileNameDAO(String name);
	
	
	

}
