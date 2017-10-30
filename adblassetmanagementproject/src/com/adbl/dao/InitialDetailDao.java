package com.adbl.dao;

import java.sql.SQLException;

import com.adbl.model.Model;

public interface InitialDetailDao {
	public void addgroup(String groupcode,String groupname) throws SQLException;
	public void additemcondition(String itemconditionname) throws SQLException;
	public void addfundsource(String itemconditionname) throws SQLException;
	public void addcompany(Model m) throws SQLException;
	public void deletecompany(String id) throws SQLException;
	public void deletegroup(String id) throws SQLException;
	public void deletefundsource(String id) throws SQLException;
	public void deleteitemcondition(String id) throws SQLException;
}
