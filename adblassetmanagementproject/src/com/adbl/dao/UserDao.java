package com.adbl.dao;

import java.net.InetAddress;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adbl.model.History;

public interface UserDao {

	public boolean adduserdao(String username, String staffcode, int roleid, String mid,String role, String effectivedate, String enddate,String usercid);
	public ResultSet getroles();
	public ResultSet getexistingusers();
	public ResultSet edituserdao(String userid);
	public boolean deleteuserdao(String userid, String branchdb);
	public boolean updateuserdao(String username, String staffcode, int roleid, String mid, String branchdb,String userid,String givenrole, String effectivedate, String enddate);
	public boolean updateuserroledao(String roleid, String roledescription);
	public boolean deleteuserroledao(String roleid);
	public ResultSet selectusernames();
	public boolean updateusernamepasswordInMaindb(String username, String newusername, String newpassword);
	public boolean updateusernamepasswordInBranchdb(String username, String newusername, String newpassword);
	public boolean loghistorydao(String username, String action);
	public List<History> viewhistory(HttpServletRequest request, HttpServletResponse response);
	public void addroles(HttpServletRequest request, HttpServletResponse response);
	public String getrecentid();
	public boolean addusercompanyid(String id, String username, String staffcode, String branchdb);
	public String getUserCid(String usercid);
	public boolean addusertomainbranch(String username, String staffcode, int roleid, String mid, String userbranch,
			String role, String effectivedate, String enddate, String usercid, String sessionuser);

	public String getRoleAssigned(String name);
}
