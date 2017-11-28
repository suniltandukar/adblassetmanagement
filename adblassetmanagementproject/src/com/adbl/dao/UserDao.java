package com.adbl.dao;

import java.sql.ResultSet;

public interface UserDao {

	public boolean adduserdao(String username, String staffcode, int roleid, String mid, String branchdb);
	public ResultSet getroles();
	public ResultSet getexistingusers();
	public ResultSet edituserdao(String userid);
	public boolean deleteuserdao(String userid, String branchdb);
	public boolean updateuserdao(String username, String staffcode, int roleid, String mid, String branchdb,String userid);
	public boolean updateuserroledao(String roleid, String roledescription);
	public boolean deleteuserroledao(String roleid);
	public ResultSet selectusernames();
	public boolean updateusernamepasswordInMaindb(String username, String newusername, String newpassword);
	public boolean updateusernamepasswordInBranchdb(String username, String newusername, String newpassword, String branchdb);

}
