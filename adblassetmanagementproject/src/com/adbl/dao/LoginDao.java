package com.adbl.dao;

import java.sql.ResultSet;

public interface LoginDao {
	public ResultSet verifyuserDao(String staffcode,String username, String password);
	public boolean verifybranchuserDao(String staffcode,String username, String password);
}
