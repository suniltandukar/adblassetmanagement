package com.adbl.dao;

public interface UpdateDao {
	public boolean editGroup(String groupcode, String groupname, String igroupcode);

	public boolean updateDepreciation(String did, String lastyrdep);

}
