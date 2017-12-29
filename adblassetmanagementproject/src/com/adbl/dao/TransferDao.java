package com.adbl.dao;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface TransferDao {

	public boolean setstatuspending(String transferredby, String transferredto, String branchby, String branchto,
			String transferdate, String transferdateen, String itemcode, String branchdb,String branchname);
	public String gettransferid();
	public boolean updatetransferitemstatus(String transferid, String itemcode);
	public ResultSet getbranchdetails();
	public ResultSet getUseretails(String branchid);

	public boolean setissuestatuspending(String issuedby, String issuedto,
			String issueddate, String issueddateen, String itemcode);
	public String getissueid();
	public boolean updateissueitemstatus(String issueid, String itemcode);
	public ResultSet getissueditemdetails(String username);
	public ResultSet getissuedetails();
	public ResultSet myitemdetails(String username);
	public ResultSet getransferdetails(String cid, String username);
	public ResultSet transferhistorydao(HttpServletRequest request, HttpServletResponse response);

}
