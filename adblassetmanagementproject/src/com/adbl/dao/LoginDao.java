package com.adbl.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.adbl.model.UserModel;
import com.adbl.model.UserRole;

public interface LoginDao {
	public boolean checkmaindb(String staffcode , String username, String password);
	public ResultSet userdetail(String staffcode,String username, String password);
	public boolean checkcompanydb(String staffcode,String username, String password, String branchdb);
	public ResultSet role(String roleid) throws SQLException;
	public String userenddate(String staffcode);
	public UserModel getUserDetail(UserModel u);
	
}
