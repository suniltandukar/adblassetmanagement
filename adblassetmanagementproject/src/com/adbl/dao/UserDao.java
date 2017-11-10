package com.adbl.dao;

import java.sql.ResultSet;

public interface UserDao {

	public void adduserdao(String username, String staffcode, int roleid, String mid, String branchdb);
	public ResultSet getroles();

}
