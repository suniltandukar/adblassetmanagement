package com.adbl.dao;

import java.sql.ResultSet;

public interface UserDao {

	public boolean adduserdao(String username, String staffcode, int roleid, String mid, String branchdb);
	public ResultSet getroles();
	public ResultSet getexistingusers();
	public ResultSet edituserdao(String userid);
	public boolean deleteuserdao(String userid, String branchdb);
	public Boolean updateuserdao(String username, String staffcode, int roleid, String mid, String branchdb,String userid);

}
