package com.adbl.dao;

import java.sql.ResultSet;

public interface LoginDao {
	public boolean checkmaindb(String staffcode , String username, String password);
	public ResultSet userdetail(String staffcode,String username, String password);
	public boolean checkcompanydb(String staffcode,String username, String password, String branchdb);
}
