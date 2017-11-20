package com.adbl.dao;

import java.sql.ResultSet;

public interface TransferDao {

	public boolean setstatuspending(String transferredby, String transferredto, String branchby, String branchto,
			String transferdate, String transferdateen, String itemcode, String branchdb);
	public String gettransferid();
	public boolean updatetransferitemstatus(String transferid, String itemcode);
	public ResultSet getbranchdetails();

	public boolean setissuestatuspending(String issuedby, String issuedto, String branchby, String branchto,
			String issueddate, String issueddateen, String itemcode, String branchdb);
	public String getissueid();
	public boolean updateissueitemstatus(String issueid, String itemcode);

}